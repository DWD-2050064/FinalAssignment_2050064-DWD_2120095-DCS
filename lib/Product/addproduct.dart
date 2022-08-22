import 'dart:convert';
import 'dart:io';
//import 'package:ecommerce/View.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../postApi/web1.dart';
import '../postApi/web2.dart';
//Widget productList = ProductList();

void main() {
  runApp( MaterialApp(home: addProduct(),
    builder: EasyLoading.init(),));
}
class addProduct extends StatefulWidget {
  const addProduct({Key? key, }) : super(key: key);


  @override
  State<addProduct> createState() => _addProductState();
}

class _addProductState extends State<addProduct> {
  TextEditingController product_name = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController stock = TextEditingController();
  TextEditingController variation = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController category_id= TextEditingController();

  String? filePath;
  String? pictureExt;
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Card(
            elevation: 10,
            shadowColor: Colors.grey,
            child:
            TextButton(
              onPressed: (){
                showMaterialModalBottomSheet(
                    expand: false,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => Container(
                        decoration: const BoxDecoration(
                            color: Colors.white
                        ),
                        child: ListView(
                          padding:  EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            ListTile(
                              leading: const Icon(Icons.browse_gallery),
                              onTap: ()async{
                                XFile? image = await picker.pickImage(source: ImageSource.gallery);
                                setState(() {
                                  filePath = image!.path;
                                  pictureExt = image.path.split('.').last;
                                });
                              },
                              title: const Text('Upload from gallery'),
                            ),
                            const Divider(),
                            ListTile(
                              leading: const Icon(Icons.camera),
                              onTap: ()async{
                                XFile? image = await picker.pickImage(source: ImageSource.camera);
                                setState(() {
                                  filePath = image!.path;
                                  pictureExt = image.path.split('.').last;
                                });
                              },
                              title: const Text('Upload from camera'),
                            ),

                          ],
                        )

                    )
                );
              }, child: Column(
                children: [
                  Container(
                      child: filePath!= null
                          ? Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(onPressed: () => setState(() {
                            Image.file(File(filePath!));
                            filePath = null;
                            pictureExt = null;
                          }),icon: Icon(Icons.cancel_outlined,color: Colors.redAccent,)
                          )
                      ):Column()),
                  filePath!= null
                      ? Image.file(File(filePath!))
                      :Column(
                    children: [
                      Container(padding: const EdgeInsets.all(10),),
                      Icon(Icons.add_circle,color: Colors.grey,size: 50,),
                      Container(padding: const EdgeInsets.all(10),),
                      const Text('Upload Product Image',style: TextStyle(color: Colors.black87),),
                      Container(padding: const EdgeInsets.all(10),),
                    ],
                  )

                ]
            ),
            ),
          ),
          Container(padding: const EdgeInsets.all(10),),
          TextFormField(
            controller: product_name,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black87
                  )
              ) ,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black87
                  )
              ),
              labelText: 'Product Name',
              hintText: 'Product Name',
              hintStyle: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
          ),
          Container(padding: const EdgeInsets.all(10),),
          TextFormField(
            controller: price,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black87
                  )
              ) ,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black87
                  )
              ),
              labelText: 'Product Price',
              hintText: 'Product Price',
              hintStyle: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
          ),
          Container(padding: const EdgeInsets.all(10),),
          TextFormField(
            controller: stock,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black87
                  )
              ) ,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black87
                  )
              ),
              labelText: 'Product Stock',
              hintText: 'Product Stock',
              hintStyle: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
          ),
          Container(padding: const EdgeInsets.all(10),),
          TextFormField(
            controller: category_id,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black87
                  )
              ) ,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black87
                  )
              ),
              labelText: 'Category ID',
              hintText: 'Category ID',
              hintStyle: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
          ),
          Container(padding: const EdgeInsets.all(10),),
          TextFormField(
            controller: variation,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black87
                  )
              ) ,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black87
                  )
              ),
              labelText: 'Variation',
              hintText: 'Variation',
              hintStyle: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
          ),
          Container(padding: const EdgeInsets.all(10),),
          TextFormField(
            controller: description,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black87
                  )
              ) ,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black87
                  )
              ),
              labelText: 'Product Description',
              hintText: 'Product Description',
              hintStyle: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
          ),
          Container(padding: const EdgeInsets.all(10),),

          ElevatedButton(onPressed: () async{
            if(filePath != null)
              EasyLoading.show(status : 'Uploading');
            SharedPreferences prefs = await SharedPreferences.getInstance();
            String merchant_id = prefs.getString('merchant_id')!;
            var response2 = await AProduct.ap(filePath,pictureExt,product_name.text,category_id.text,
                price.text,stock.text,variation.text,description.text,merchant_id);


            var obj2 = jsonDecode(response2);
            if(obj2['code']== 'success'){
              setState(() {
                filePath = null;
                pictureExt = null;
                product_name.text = "";
                price.text = "";
                stock.text = "";
                variation.text = "";
                description.text = "";


              });
            }
            EasyLoading.dismiss();
            showDialog(context: context,
                builder: (context){
                  return CupertinoAlertDialog(
                    title: Text(obj2['code']),
                    content: Text(obj2['message']),
                  );
                }
            );
          },
              child: Text("ADD PRODUCT",style: TextStyle(color: Colors.purple),),
              style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.purple, width: 2),
                  primary: Colors.white,

                  minimumSize: const Size.fromHeight(50),
                  padding: const EdgeInsets.all(10)
              )
          ),
        ],
      ),
    );
  }
}




