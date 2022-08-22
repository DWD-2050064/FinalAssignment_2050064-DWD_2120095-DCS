import 'dart:convert';
import 'package:finalassign/postApi/web1.dart';
import 'package:finalassign/postApi/web2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bottomnavbar.dart';

class ProductListMerchant extends StatefulWidget {
  const ProductListMerchant({Key? key}) : super(key: key);

  @override
  State<ProductListMerchant> createState() => _ProductListMerchantState();
}

class _ProductListMerchantState extends State<ProductListMerchant> {
  String? filePath;
  String? pictureExt;
  TextEditingController product_name = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController stock = TextEditingController();
  TextEditingController variation = TextEditingController();
  TextEditingController description = TextEditingController();
  ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Product',
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.pushNamed(context, '/cart_page');
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 24.0,
        ),
      ),
      body: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot){
          if(snapshot.hasData){
            if(snapshot.data!.getString('category_id') != null) {
              String category_id = snapshot.data!.getString("category_id")!;
              return FutureBuilder(
                  future: VProduct.vp(category_id),
                  builder: (BuildContext context,
                      AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      var response = snapshot.data;
                      var obj = jsonDecode(response!);
                      if (obj['code'] == 'success') {
                        return Column(
                          children: [
                            Column(
                              children: [
                                Padding(padding: const EdgeInsets.only(top: 50,bottom: 10),
                                  child: Container(
                                    child: Text(
                                      'Product List',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.orange
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 500,
                                  child: ListView(
                                      physics: const BouncingScrollPhysics(),
                                      children: [
                                        for(var i = 0; i < obj['resultList'].length; i++)
                                          Padding(padding: EdgeInsets.only(left: 10,bottom: 50,right: 10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 130,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: Colors.orange)
                                                      ),
                                                    child: InkWell(
                                                        onTap: ()async{
                                                          setState(() {
                                                            product_name.text = obj['resultList'][i]['product_name'];
                                                            filePath = 'https://androidapi.bitesbytesnetwork.com/' + obj['resultList'][i]['picture'];
                                                            category.text = obj['resultList'][i]['category'];
                                                            price.text = obj['resultList'][i]['price'];
                                                            stock.text = obj['resultList'][i]['stock'];
                                                            variation.text = obj['resultList'][i]['variation'];
                                                            description.text = obj['resultList'][i]['description'];
                                                          });
                                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                                          prefs.setString('product_id', obj['resultList'][i]['product_id']);
                                                          showBarModalBottomSheet(
                                                            expand: true,
                                                            context: context,
                                                            builder: (context) => Scaffold(
                                                              backgroundColor: Colors.black,
                                                              body: Container(
                                                                alignment: Alignment.center,
                                                                child: ListView(
                                                                  padding: const EdgeInsets.all(20),
                                                                  children: [
                                                                    Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: [
                                                                        FittedBox(
                                                                          child: Image.network(filePath!,
                                                                              width: 160,height: 180, fit:BoxFit.fill),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: (){
                                                                            showMaterialModalBottomSheet(
                                                                                expand: false,
                                                                                context: context,
                                                                                backgroundColor: Colors.transparent,
                                                                                builder: (context) => Container(
                                                                                    decoration: const BoxDecoration(color: Colors.black),
                                                                                    child: ListView(
                                                                                      padding:  EdgeInsets.zero,
                                                                                      shrinkWrap: true,
                                                                                      physics: const NeverScrollableScrollPhysics(),
                                                                                      children: [
                                                                                        ListTile(
                                                                                          leading: const Icon(Icons.browse_gallery,color: Colors.orange,),
                                                                                          onTap: ()async{
                                                                                            XFile? image = await picker.pickImage(source: ImageSource.gallery);
                                                                                            setState(() {
                                                                                              filePath = image!.path;
                                                                                              pictureExt = image.path.split('.').last;
                                                                                            });
                                                                                          },
                                                                                          title: const Text('Upload from gallery',style: TextStyle(color: Colors.white),),
                                                                                        ),
                                                                                        const Divider(),
                                                                                        ListTile(
                                                                                          leading: const Icon(Icons.camera,color: Colors.orange,),
                                                                                          onTap: ()async{
                                                                                            XFile? image = await picker.pickImage(source: ImageSource.camera);
                                                                                            setState(() {
                                                                                              filePath = image!.path;
                                                                                              pictureExt = image.path.split('.').last;
                                                                                            });
                                                                                          },
                                                                                          title: const Text('Upload from camera',style: TextStyle(color: Colors.white),),
                                                                                        ),
                                                                                      ],
                                                                                    )
                                                                                )
                                                                            );
                                                                          },
                                                                          child: const Icon(Icons.refresh, color: Colors.orange,),
                                                                          style: TextButton.styleFrom(
                                                                              padding: EdgeInsets.zero
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    TextFormField(
                                                                      controller: product_name,
                                                                      decoration: InputDecoration(
                                                                        enabledBorder: OutlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                              color: Colors.blue,
                                                                            )
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                              color: Colors.black,
                                                                            )
                                                                        ),
                                                                        labelText: 'Product Name',
                                                                      ),
                                                                    ),
                                                                    Container(padding: const EdgeInsets.all(5),),
                                                                    TextFormField(
                                                                      controller: price,
                                                                      decoration: InputDecoration(
                                                                        enabledBorder: OutlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                              color: Colors.blue,
                                                                            )
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                              color: Colors.black,
                                                                            )
                                                                        ),
                                                                        labelText: 'Price',
                                                                      ),
                                                                    ),
                                                                    Container(padding: const EdgeInsets.all(5),),
                                                                    TextFormField(
                                                                      controller: category,
                                                                      decoration: InputDecoration(
                                                                        enabledBorder: OutlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                              color: Colors.blue,
                                                                            )
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                              color: Colors.black,
                                                                            )
                                                                        ),
                                                                        labelText: 'Category',
                                                                      ),
                                                                    ),
                                                                    Container(padding: const EdgeInsets.all(5),),
                                                                    TextFormField(
                                                                      controller: stock,
                                                                      decoration: InputDecoration(
                                                                        enabledBorder: OutlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                              color: Colors.blue,
                                                                            )
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                              color: Colors.black,
                                                                            )
                                                                        ),
                                                                        labelText: 'Stock',
                                                                      ),
                                                                    ),
                                                                    Container(padding: const EdgeInsets.all(5),),
                                                                    TextFormField(
                                                                      controller: variation,
                                                                      decoration: InputDecoration(
                                                                        enabledBorder: OutlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                              color: Colors.blue,
                                                                            )
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                              color: Colors.black,
                                                                            )
                                                                        ),
                                                                        labelText: 'Variation',
                                                                      ),
                                                                    ),
                                                                    Container(padding: const EdgeInsets.all(5),),
                                                                    TextFormField(
                                                                      controller: description,
                                                                      decoration: InputDecoration(
                                                                        enabledBorder: OutlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                              color: Colors.blue,
                                                                            )
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                              color: Colors.black,
                                                                            )
                                                                        ),
                                                                        labelText: 'Description',
                                                                      ),
                                                                    ),
                                                                    Container(padding: const EdgeInsets.all(5),),
                                                                    TextButton(
                                                                        onPressed: () async {
                                                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                                                          String product_id = prefs.getString("product_id")!;
                                                                          var response2 = await EProduct.ep(product_id,product_name,category,price,stock,variation,description,filePath,pictureExt);
                                                                          var obj2 = jsonDecode(response2);
                                                                          if(obj2['code'] == 'success'){
                                                                            showDialog(
                                                                                context: context,
                                                                                builder: (context){
                                                                                  return CupertinoAlertDialog(
                                                                                    title: Text(obj2['code']),
                                                                                    content: Text(obj2['message']),
                                                                                  );
                                                                                }
                                                                            );
                                                                          }
                                                                        },
                                                                        child: Container(
                                                                          width: 400,
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.orange,
                                                                            borderRadius: BorderRadius.circular(5)
                                                                          ),
                                                                          child: Text(
                                                                            'Save',
                                                                            textAlign: TextAlign.center,
                                                                            style: TextStyle(
                                                                              fontSize: 30,
                                                                                color: Colors.white
                                                                            ),
                                                                          ),
                                                                        )
                                                                    ),
                                                                    TextButton(
                                                                        onPressed: () async {
                                                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                                                          String product_id = prefs.getString("product_id")!;
                                                                          var response2 = await RProduct.rp(product_id);
                                                                          var obj2 = jsonDecode(response2);
                                                                          if(obj2['code'] == 'success'){
                                                                            showDialog(
                                                                                context: context,
                                                                                builder: (context){
                                                                                  return CupertinoAlertDialog(
                                                                                    title: Text(obj2['code']),
                                                                                    content: Text(obj2['message']),
                                                                                  );
                                                                                }
                                                                            );
                                                                          }
                                                                        },
                                                                        child: Container(
                                                                          width: 400,
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.orange,
                                                                              borderRadius: BorderRadius.circular(5)
                                                                          ),
                                                                          child: Text(
                                                                            'Remove',
                                                                            textAlign: TextAlign.center,
                                                                            style: TextStyle(
                                                                                fontSize: 30,
                                                                                color: Colors.white
                                                                            ),
                                                                          ),
                                                                        )
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Image.network(
                                                              'https://androidapi.bitesbytesnetwork.com/' +
                                                                  obj['resultList'][i]['picture'],
                                                              height: 150,
                                                              width: 150,
                                                              fit: BoxFit.fitWidth,
                                                            ),
                                                            Container(
                                                              width: 145,
                                                              padding: EdgeInsets.all(10),
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                      padding: EdgeInsets.all(5),
                                                                      child: Text(obj['resultList'][i]['product_name'],
                                                                        textAlign: TextAlign.left,
                                                                        style: TextStyle(
                                                                            fontSize: 20,
                                                                            color: Colors.white
                                                                        ),
                                                                      )
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.all(5),
                                                                      child: Text("RM"+ obj['resultList'][i]['price'],
                                                                        textAlign: TextAlign.left,
                                                                        style: TextStyle(
                                                                            fontSize: 18,
                                                                            color: Colors.white
                                                                        ),
                                                                      )
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.all(5),
                                                                      child: Text("stock "+obj['resultList'][i]['stock'],
                                                                        textAlign: TextAlign.left,
                                                                        style: TextStyle(
                                                                            fontSize: 15,
                                                                            color: Colors.white
                                                                        ),
                                                                      )
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                    ),
                                                  )
                                                ],
                                              )
                                          )
                                      ]
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    } else {
                      return Container();
                    }
                  }
              );
            }else {
              return Container();
            }
          } else{
            return Container();
          }
        },
      ),
    );
  }
}
