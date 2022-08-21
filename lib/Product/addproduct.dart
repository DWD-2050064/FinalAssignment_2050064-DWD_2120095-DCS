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
          // Container(padding: const EdgeInsets.all(15),),
          // Text("Product List",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.purple)),
          // //productList,
          // FutureBuilder(
          //     future: VProduct.vp(),
          //     builder: (BuildContext context, AsyncSnapshot<String> snapshot){
          //       if(snapshot.hasData){
          //         var response = snapshot.data;
          //         var obj = jsonDecode(response!);
          //         if (obj['code'] == 'success'){
          //           return Column(
          //             children: [
          //               for(var i = 0; i < obj['resultList'].length;i++)
          //                 Column(
          //                   children: [
          //                     Padding(padding: const EdgeInsets.all(10)),
          //                     Card(
          //                       shadowColor: Colors.grey,
          //                       elevation: 10,
          //                       child: Container(
          //                           padding: const EdgeInsets.all(10),
          //                           height: 185,
          //                           child: InkWell(
          //                             onTap: (){
          //                             },child:  ListView(
          //                             physics: const NeverScrollableScrollPhysics(),
          //                             scrollDirection: Axis.horizontal,
          //                             children: [
          //                               Padding(padding: EdgeInsets.all(10)),
          //                               FittedBox(
          //                                 child: Image.network('https://androidapi.bitesbytesnetwork.com/' + obj['resultList'][i]['picture'],
          //                                     width: 150,height: 150, fit:BoxFit.fill),
          //                               ),
          //                               Padding(padding: EdgeInsets.all(7.5)),
          //                               Table(
          //                                 defaultColumnWidth: FixedColumnWidth(200.0),
          //                                 children: [
          //                                   TableRow(
          //                                       children: [
          //                                         TableCell(
          //                                             child: Container(
          //                                                 padding: EdgeInsets.all(5),
          //                                                 child: Text(obj['resultList'][i]['product_name'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
          //
          //                                             )
          //                                         )
          //                                       ]
          //                                   ),
          //                                   TableRow(
          //                                       children: [
          //                                         TableCell(
          //                                             child: Container(
          //                                                 padding: EdgeInsets.all(5),
          //                                                 child: Text(obj['resultList'][i]['description'])
          //                                             )
          //                                         )
          //                                       ]
          //                                   ),
          //                                   TableRow(
          //                                       children: [
          //                                         TableCell(
          //                                             child: Container(
          //                                                 padding: EdgeInsets.all(5),
          //                                                 child: Text("Stock : "+obj['resultList'][i]['stock'])
          //                                             )
          //                                         )
          //                                       ]
          //                                   ),
          //                                   TableRow(
          //                                       children: [
          //                                         TableCell(
          //                                           child: Container(
          //                                               padding: EdgeInsets.all(5),
          //                                               child: Text("Price : RM"+obj['resultList'][i]['price'])
          //                                           ),
          //                                         ),
          //                                       ]
          //                                   ),
          //                                   TableRow(
          //                                       children: [
          //                                         TableCell(
          //                                             child: Row(
          //                                               children: [
          //                                                 InkWell(
          //                                                   onTap: () async {
          //                                                     print(obj['resultList'][i]['product_name']);
          //                                                     setState(() {
          //
          //                                                       product_name.text = obj['resultList'][i]['product_name'];
          //                                                       description.text = obj['resultList'][i]['description'];
          //                                                       category.text =obj['resultList'][i]['category'];
          //                                                       stock.text = obj['resultList'][i]['stock'];
          //                                                       price.text = obj['resultList'][i]['price'];
          //                                                       variation.text = obj['resultList'][i]['variation'];
          //
          //
          //
          //                                                     });
          //                                                     showBarModalBottomSheet(
          //                                                       expand: true,
          //                                                       context: context,
          //                                                       builder: (context) => Scaffold(
          //                                                         appBar: AppBar(
          //                                                           leading: new IconButton(
          //                                                             icon: new Icon(Icons.arrow_back, color: Colors.white),
          //                                                             onPressed: () => setState(() {
          //                                                               product_name.text = "";
          //                                                               category.text = "";
          //                                                               price.text = "";
          //                                                               stock.text = "";
          //                                                               description.text = "";
          //                                                               variation.text = "";
          //                                                               Navigator.pop(context);
          //                                                             }),
          //                                                           ),
          //                                                           flexibleSpace: Container(
          //                                                             decoration: const BoxDecoration(
          //                                                               gradient: LinearGradient(
          //                                                                   begin: Alignment.topCenter,
          //                                                                   end: Alignment.bottomCenter,
          //                                                                   colors: <Color>[Colors.redAccent,Colors.lightBlueAccent]
          //                                                               ),
          //                                                             ),
          //                                                           ),
          //                                                           title: const Text("Edit Product"),
          //                                                           backgroundColor: Colors.white,
          //                                                         ),
          //                                                         body: Container(
          //                                                           padding: EdgeInsets.all(20),
          //                                                           alignment: Alignment.center,
          //                                                           child: ListView(
          //                                                             children: [
          //                                                               Container(padding: const EdgeInsets.all(10),),
          //                                                               TextFormField(
          //                                                                 controller: product_name,
          //                                                                 style:  const TextStyle(color: Colors.black),
          //                                                                 decoration:  InputDecoration(
          //                                                                   filled: true,
          //                                                                   enabledBorder: const OutlineInputBorder
          //                                                                     (
          //                                                                       borderSide: BorderSide
          //                                                                         (
          //                                                                           color: Colors.redAccent
          //                                                                       )
          //                                                                   ),
          //                                                                   focusedBorder: const OutlineInputBorder
          //                                                                     (
          //                                                                       borderSide: BorderSide
          //                                                                         (
          //                                                                           color: Colors.lightBlueAccent
          //                                                                       )
          //                                                                   ),
          //                                                                   labelText: 'Product Name',
          //                                                                   hintText: 'Product Name',
          //                                                                   hintStyle: TextStyle
          //                                                                     (
          //                                                                     color: Colors.black.withOpacity(0.5),
          //                                                                   ),
          //                                                                 ),
          //                                                               ),
          //                                                               const Padding(padding: EdgeInsets.all(20)),
          //                                                               TextFormField(
          //                                                                 controller: description,
          //                                                                 style:  const TextStyle(color: Colors.black),
          //                                                                 decoration:  InputDecoration(
          //                                                                   filled: true,
          //                                                                   enabledBorder: const OutlineInputBorder
          //                                                                     (
          //                                                                       borderSide: BorderSide
          //                                                                         (
          //                                                                           color: Colors.redAccent
          //                                                                       )
          //                                                                   ),
          //                                                                   focusedBorder: const OutlineInputBorder
          //                                                                     (
          //                                                                       borderSide: BorderSide
          //                                                                         (
          //                                                                           color: Colors.lightBlueAccent
          //                                                                       )
          //                                                                   ),
          //                                                                   labelText: 'Product Description',
          //                                                                   hintText: 'Product Description',
          //                                                                   hintStyle: TextStyle
          //                                                                     (
          //                                                                     color: Colors.black.withOpacity(0.5),
          //                                                                   ),
          //                                                                 ),
          //                                                               ),
          //                                                               const Padding(padding: EdgeInsets.all(20)),
          //                                                               TextFormField(
          //                                                                 controller: stock,
          //                                                                 keyboardType: TextInputType.number,
          //                                                                 inputFormatters: [
          //                                                                   FilteringTextInputFormatter.digitsOnly
          //                                                                 ],
          //                                                                 style:  const TextStyle(color: Colors.black),
          //                                                                 decoration:  InputDecoration(
          //                                                                   filled: true,
          //                                                                   enabledBorder: const OutlineInputBorder
          //                                                                     (
          //                                                                       borderSide: BorderSide
          //                                                                         (
          //                                                                           color: Colors.redAccent
          //                                                                       )
          //                                                                   ),
          //                                                                   focusedBorder: const OutlineInputBorder
          //                                                                     (
          //                                                                       borderSide: BorderSide
          //                                                                         (
          //                                                                           color: Colors.lightBlueAccent
          //                                                                       )
          //                                                                   ),
          //                                                                   labelText: 'Product Stock',
          //                                                                   hintText: 'Product Stock',
          //                                                                   hintStyle: TextStyle
          //                                                                     (
          //                                                                     color: Colors.black.withOpacity(0.5),
          //                                                                   ),
          //                                                                 ),
          //                                                               ),
          //                                                               const Padding(padding: EdgeInsets.all(20)),
          //                                                               TextFormField(
          //                                                                 controller: price,
          //                                                                 keyboardType: TextInputType.number,
          //                                                                 inputFormatters: [
          //                                                                   FilteringTextInputFormatter.digitsOnly
          //                                                                 ],
          //                                                                 style:  const TextStyle(color: Colors.black),
          //                                                                 decoration:  InputDecoration(
          //                                                                   filled: true,
          //                                                                   enabledBorder: const OutlineInputBorder
          //                                                                     (
          //                                                                       borderSide: BorderSide
          //                                                                         (
          //                                                                           color: Colors.redAccent
          //                                                                       )
          //                                                                   ),
          //                                                                   focusedBorder: const OutlineInputBorder
          //                                                                     (
          //                                                                       borderSide: BorderSide
          //                                                                         (
          //                                                                           color: Colors.lightBlueAccent
          //                                                                       )
          //                                                                   ),
          //                                                                   labelText: 'Product Price',
          //                                                                   hintText: 'Product Price',
          //                                                                   hintStyle: TextStyle
          //                                                                     (
          //                                                                     color: Colors.black.withOpacity(0.5),
          //                                                                   ),
          //                                                                 ),
          //                                                               ),
          //                                                               Container(padding: const EdgeInsets.all(10),),
          //                                                               TextFormField(
          //                                                                 controller: variation,
          //                                                                 decoration: const InputDecoration(
          //                                                                   enabledBorder: OutlineInputBorder(
          //                                                                       borderSide: BorderSide(
          //                                                                           color: Colors.black87
          //                                                                       )
          //                                                                   ) ,
          //                                                                   focusedBorder: OutlineInputBorder(
          //                                                                       borderSide: BorderSide(
          //                                                                           color: Colors.black87
          //                                                                       )
          //                                                                   ),
          //                                                                   labelText: 'Variation',
          //                                                                   hintText: 'Variation',
          //                                                                   hintStyle: TextStyle(
          //                                                                     color: Colors.blueGrey,
          //                                                                   ),
          //                                                                 ),
          //                                                               ),
          //                                                               Container(padding: const EdgeInsets.all(10),),
          //                                                               TextFormField(
          //                                                                 controller: category_id,
          //                                                                 keyboardType: TextInputType.number,
          //                                                                 inputFormatters: [
          //                                                                   FilteringTextInputFormatter.digitsOnly
          //                                                                 ],
          //                                                                 decoration: const InputDecoration(
          //                                                                   enabledBorder: OutlineInputBorder(
          //                                                                       borderSide: BorderSide(
          //                                                                           color: Colors.black87
          //                                                                       )
          //                                                                   ) ,
          //                                                                   focusedBorder: OutlineInputBorder(
          //                                                                       borderSide: BorderSide(
          //                                                                           color: Colors.black87
          //                                                                       )
          //                                                                   ),
          //                                                                   labelText: 'Category ID',
          //                                                                   hintText: 'Category ID',
          //                                                                   hintStyle: TextStyle(
          //                                                                     color: Colors.blueGrey,
          //                                                                   ),
          //                                                                 ),
          //                                                               ),
          //                                                               Container(padding: const EdgeInsets.all(10),),
          //                                                               const Padding(padding: EdgeInsets.all(20)),
          //                                                               TextButton
          //                                                                 (
          //                                                                   onPressed: () async
          //                                                                   {
          //                                                                     var merchant_id =['merchant_id'];
          //                                                                     var product_id = obj['resultList'][i]['product_id'];
          //                                                                     var response2 = await EProduct.ep(product_name.text,category.text,
          //                                                                         price.text,stock.text,variation.text,description.text,merchant_id,product_id);
          //                                                                     var obj2 = jsonDecode(response2);
          //                                                                     print(response);
          //                                                                     if (obj2['code'] == 'success')
          //                                                                     {
          //                                                                       showDialog
          //                                                                         (
          //                                                                         context: context,
          //                                                                         builder: (_) => const CupertinoAlertDialog
          //                                                                           (
          //                                                                           content: Text("Update Success"),
          //                                                                         ),
          //                                                                       );
          //                                                                       setState(() {
          //                                                                         product_name.text = "";
          //                                                                         description.text = "";
          //                                                                         stock.text = "";
          //                                                                         price.text = "";
          //                                                                         category_id.text="";
          //                                                                         variation.text="";
          //                                                                    //     productList = ProductList();
          //
          //
          //
          //                                                                       });
          //                                                                     }
          //                                                                     else
          //                                                                     {
          //                                                                       showDialog
          //                                                                         (
          //                                                                           context: context,
          //                                                                           builder: (_) => const CupertinoAlertDialog
          //                                                                             (
          //                                                                             content: Text("Error"),
          //                                                                           )
          //                                                                       );
          //                                                                     }
          //                                                                     (obj2['code']);
          //                                                                   },
          //                                                                   child:Text("SAVE",style: TextStyle(color: Colors.purple),),
          //                                                                   style: ElevatedButton.styleFrom(
          //                                                                       side: BorderSide(color: Colors.purple, width: 2),
          //                                                                       primary: Colors.white,
          //                                                                       minimumSize: const Size.fromHeight(50),
          //                                                                       padding: const EdgeInsets.all(10)
          //                                                                   )
          //                                                               ),
          //                                                             ],
          //                                                           ),
          //                                                         ),
          //                                                       ),
          //                                                     );
          //                                                   },
          //
          //                                                   child: Text("Edit",style: TextStyle(color: Colors.blue),
          //                                                   ),
          //                                                 ),Container(padding: const EdgeInsets.all(10),),
          //                                                 Row(
          //                                                   children: [
          //                                                     TextButton(
          //                                                       onPressed: () async{
          //                                                         var merchant_id =['merchant_id'];
          //                                                         var product_id = obj['resultList'][i]['product_id'];
          //                                                         var response2 = await RProduct.ep(product_id,merchant_id);
          //                                                         var obj2 = jsonDecode(response2);
          //                                                         if(obj['code'] == "success"){
          //                                                           setState(() {
          //                                                             productList =ProductList();
          //                                                           });
          //                                                         }
          //                                                         showDialog(
          //                                                             context: context,
          //                                                             builder: (_) => CupertinoAlertDialog(
          //                                                               content: Text(obj['code']),
          //
          //                                                             )
          //                                                         );
          //                                                       },
          //
          //
          //                                                       child: const Text('Remove',style: TextStyle(color: Colors.redAccent),),
          //
          //
          //                                                     ),
          //
          //                                                   ],
          //
          //                                                 )
          //                                               ],
          //                                             )
          //                                         )
          //                                       ]
          //                                   )
          //
          //                                 ],
          //                               )
          //                             ],
          //                           ),
          //                           )
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //             ],
          //           );
          //         }else{
          //           return Container();
          //         }
          //       }else {
          //         return Container();
          //       }
          //     }
          // )
        ],
      ),
    );
  }
}



// import 'package:finalassignment/Product/product.dart';

// import 'package:finalassignment/postApi/web1.dart';
// import 'package:finalassignment/postApi/web2.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// Widget imageList = ProductList();
//
//
// class  addProduct extends StatefulWidget {
//   const addProduct({Key? key}) : super(key: key);
//
//   @override
//   State<addProduct> createState() => _addProductState();
// }
//
// class _addProductState extends State<addProduct> {
//   TextEditingController product_name = TextEditingController();
//   TextEditingController category = TextEditingController();
//   TextEditingController price = TextEditingController();
//   TextEditingController stock = TextEditingController();
//   TextEditingController variation = TextEditingController();
//   TextEditingController description = TextEditingController();
//   TextEditingController mID = TextEditingController();
//   String? filePath;
//   String? pictureExt;
//   ImagePicker picker = ImagePicker();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//             padding: const EdgeInsets.all(10),
//             child: ListView(
//                 children: [
//                   Card(
//                     elevation: 5,
//                     shadowColor: Colors.blue,
//                     child:SizedBox(
//                       height: 100,
//                       width: 700,
//                       child:
//                       TextButton(
//                         onPressed: (){
//                           showMaterialModalBottomSheet(
//                               expand: false,
//                               context: context,
//                               backgroundColor: Colors.transparent,
//                               builder: (context) => Container(
//                                   decoration: const BoxDecoration(color: Colors.white),
//                                   child: ListView(
//                                     padding:  EdgeInsets.zero,
//                                     shrinkWrap: true,
//                                     physics: const NeverScrollableScrollPhysics(),
//                                     children: [
//                                       ListTile(
//                                         leading: const Icon(Icons.browse_gallery),
//                                         onTap: ()async{
//                                           XFile? image = await picker.pickImage(source: ImageSource.gallery);
//                                           setState(() {
//                                             filePath = image!.path;
//                                             pictureExt = image.path.split('.').last;
//                                           });
//                                         },
//                                         title: const Text('Upload from gallery'),
//                                       ),
//                                       const Divider(),
//                                       ListTile(
//                                         leading: const Icon(Icons.camera),
//                                         onTap: ()async{
//                                           XFile? image = await picker.pickImage(source: ImageSource.camera);
//                                           setState(() {
//                                             filePath = image!.path;
//                                             pictureExt = image.path.split('.').last;
//                                           });
//                                         },
//                                         title: const Text('Upload from camera'),
//                                       ),
//
//                                     ],
//                                   )
//                               )
//                           );
//                           Text('Choose File/Image');
//
//                         },
//                         child: const Icon(Icons.add_circle_outline_rounded, color: Colors.black,),
//                         style: TextButton.styleFrom(
//                             primary: Colors.white,
//                             backgroundColor: Colors.white,
//                             padding: const EdgeInsets.all(40)
//                         ),
//
//                       ),
//
//
//                     ),
//                   ),
//                   const Padding(padding: EdgeInsets.all(10)),
//
//                   if(filePath != null)
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.black),
//                       ),
//                       child: Image.file(File(filePath!)),
//                       height: 200,
//                     ),
//                   if(filePath != null)
//                     const Padding(padding: EdgeInsets.all(40)),
//
//                   TextFormField(
//                     controller: product_name,
//                     decoration: const InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.black87
//                           )
//                       ) ,
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.black87
//                           )
//                       ),
//                       labelText: 'Product Name',
//                       hintText: 'Product Name',
//                       hintStyle: TextStyle(
//                         color: Colors.blueGrey,
//                       ),
//                     ),
//                   ),
//                   const Padding(padding: EdgeInsets.all(10)),
//
//                   TextFormField(
//                     controller: description,
//                     decoration: const InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.black87
//                           )
//                       ) ,
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.black87
//                           )
//                       ),
//                       labelText: 'Product Description',
//                       hintText: 'Product Description',
//                       hintStyle: TextStyle(
//                         color: Colors.blueGrey,
//                       ),
//                     ),
//                   ),
//                   const Padding(padding: EdgeInsets.all(10)),
//
//                   TextFormField(
//                     controller: stock,
//                     keyboardType: TextInputType.number,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.digitsOnly
//                     ],
//                     decoration: const InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.black87
//                           )
//                       ) ,
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.black87
//                           )
//                       ),
//                       labelText: 'Product Stock',
//                       hintText: 'Product Stock',
//                       hintStyle: TextStyle(
//                         color: Colors.blueGrey,
//                       ),
//                     ),
//                   ),
//                   const Padding(padding: EdgeInsets.all(10)),
//
//                   TextFormField(
//                     controller: price,
//                     keyboardType: TextInputType.number,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.digitsOnly
//                     ],
//                     decoration: const InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.black87
//                           )
//                       ) ,
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.black87
//                           )
//                       ),
//                       labelText: 'Product Price',
//                       hintText: 'Product Price',
//                       hintStyle: TextStyle(
//                         color: Colors.blueGrey,
//                       ),
//                     ),
//                   ),
//                   const Padding(padding: EdgeInsets.all(10)),
//
//                   TextFormField(
//                     controller: category,
//                     keyboardType: TextInputType.number,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.digitsOnly
//                     ],
//                     decoration: const InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.black87
//                           )
//                       ) ,
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.black87
//                           )
//                       ),
//                       labelText: 'Product category',
//                       hintText: 'Product category',
//                       hintStyle: TextStyle(
//                         color: Colors.blueGrey,
//                       ),
//                     ),
//                   ),
//                   const Padding(padding: EdgeInsets.all(10)),
//
//                   TextFormField(
//                     controller: variation,
//                     keyboardType: TextInputType.number,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.digitsOnly
//                     ],
//                     decoration: const InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.black87
//                           )
//                       ) ,
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.black87
//                           )
//                       ),
//                       labelText: 'Product variation',
//                       hintText: 'Product variation',
//                       hintStyle: TextStyle(
//                         color: Colors.blueGrey,
//                       ),
//                     ),
//                   ),
//
//                   TextFormField(
//                     controller: mID,
//                     keyboardType: TextInputType.number,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.digitsOnly
//                     ],
//                     decoration: const InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.black87
//                           )
//                       ) ,
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors.black87
//                           )
//                       ),
//                       labelText: 'Merchant_ID',
//                       hintText: 'Merchant_ID',
//                       hintStyle: TextStyle(
//                         color: Colors.blueGrey,
//                       ),
//                     ),
//                   ),
//                   const Padding(padding: EdgeInsets.all(10)),
//
//                   ElevatedButton(onPressed: () async{
//                     if(filePath != null)
//                       EasyLoading.show(status : 'Uploading');
//                     var response = await AProduct.ap(filePath,pictureExt,product_name.text,category.text,stock.text,price.text,
//                     variation.text,description.text,mID.text);
//                     var obj = jsonDecode(response);
//                     if(obj['code']== "success"){
//                       SharedPreferences prefs = await SharedPreferences.getInstance();
//                       prefs.setString('mID',obj['mID']);
//                       setState(() {
//                         filePath = null;
//                         pictureExt = null;
//                         product_name.text = "";
//                         description.text = "";
//                         stock.text = "";
//                         price.text = "";
//                         category.text = "";
//                         variation.text = "";
//                         mID.text = "";
//
//                         imageList = ProductList();
//                       });
//                     }
//                     EasyLoading.dismiss();
//                     showDialog(context: context,
//                         builder: (context){
//                           return CupertinoAlertDialog(
//                             title: Text(obj['code']),
//                             content: Text(obj['message']),
//                           );
//                         }
//                     );
//                   },
//                       child: const Text("ADD PRODUCT",style: TextStyle(color: Colors.purple),),
//                       style: ElevatedButton.styleFrom(
//                           side: const BorderSide(color: Colors.purple, width: 2),
//                           primary: Colors.white,
//
//                           minimumSize: const Size.fromHeight(50),
//                           padding: const EdgeInsets.all(10)
//
//
//                       )
//                   ),
//                   Container(padding: const EdgeInsets.all(15),),
//                   const Text("Product List",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.purple)),
//                   imageList,
//
//                 ]
//             )
//         )
//     );
//   }
// }
//
//
//
// class ProductList extends StatefulWidget {
//   const ProductList({Key? key}) : super(key: key);
//
//   @override
//   State<ProductList> createState() => _ProductListState();
// }
//
// class _ProductListState extends State<ProductList> {
//   TextEditingController product_name = TextEditingController();
//   TextEditingController category = TextEditingController();
//   TextEditingController price = TextEditingController();
//   TextEditingController stock = TextEditingController();
//   TextEditingController variation = TextEditingController();
//   TextEditingController description = TextEditingController();
//   TextEditingController mID = TextEditingController();
//   String? filePath;
//   String? pictureExt;
//   ImagePicker picker = ImagePicker();
//   Widget productList = const ProductList();
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//
//             future: SharedPreferences.getInstance(),
//             builder: (BuildContext context,
//                 AsyncSnapshot<SharedPreferences>snapshot) {
//               String uID = snapshot.data!.getString("mID")!;
//
//               return ListView(
//                 children: [
//
//                   FutureBuilder(
//                     future: VProduct.vp(category),
//                     builder: (BuildContext context,
//                         AsyncSnapshot<String> snapshot) {
//                       if (snapshot.hasData) {
//                         var response = snapshot.data;
//                         var obj = jsonDecode(response!);
//                         if (obj['code'] == 'success') {
//                           return Column(
//                             children: [
//                               for(var i = 0; i < obj['resultlist'].length; i++)
//                                 Column(
//                                   children: [
//                                     Padding(padding: const EdgeInsets.all(10)),
//                                     Card(
//                                       shadowColor: Colors.grey,
//                                       elevation: 10,
//                                       child: Container(
//                                         padding: const EdgeInsets.all(10),
//                                         height: 185,
//                                         child: ListView(
//                                           physics: const NeverScrollableScrollPhysics(),
//                                           scrollDirection: Axis.horizontal,
//                                           children: [
//                                             const Padding(
//                                                 padding: EdgeInsets.all(10)),
//                                             Center(
//                                               child: Image.network(
//                                                   'https://androidapi.bitesbytesnetwork.com/' +
//                                                       obj['resultlist'][i]['picture']),
//                                             ),
//                                             const Padding(
//                                                 padding: EdgeInsets.all(7.5)),
//                                             Table(
//                                               defaultColumnWidth: const FixedColumnWidth(
//                                                   200.0),
//                                               children: [
//                                                 TableRow(
//                                                     children: [
//                                                       TableCell(
//                                                           child: Container(
//                                                               padding: const EdgeInsets
//                                                                   .all(5),
//                                                               child: Text(
//                                                                 obj['resultlist'][i]['product_name'],
//                                                                 style: TextStyle(
//                                                                     fontSize: 25,
//                                                                     fontWeight: FontWeight
//                                                                         .bold),)
//
//                                                           )
//                                                       )
//                                                     ]
//                                                 ),
//                                                 TableRow(
//                                                     children: [
//                                                       TableCell(
//                                                           child: Container(
//                                                               padding: EdgeInsets
//                                                                   .all(5),
//                                                               child: Text(
//                                                                   obj['resultlist'][i]['description'])
//                                                           )
//                                                       )
//                                                     ]
//                                                 ),
//                                                 TableRow(
//                                                     children: [
//                                                       TableCell(
//                                                           child: Container(
//                                                               padding: EdgeInsets
//                                                                   .all(5),
//                                                               child: Text(
//                                                                   "Stock : " +
//                                                                       obj['resultlist'][i]['stock'])
//                                                           )
//                                                       )
//                                                     ]
//                                                 ),
//                                                 TableRow(
//                                                     children: [
//                                                       TableCell(
//                                                         child: Container(
//                                                             padding: EdgeInsets
//                                                                 .all(5),
//                                                             child: Text(
//                                                                 "Price : RM" +
//                                                                     obj['resultlist'][i]['price'])
//                                                         ),
//                                                       ),
//                                                     ]
//                                                 ),
//                                                 TableRow(
//                                                     children: [
//                                                       TableCell(
//                                                         child: Container(
//                                                             padding: EdgeInsets
//                                                                 .all(5),
//                                                             child: Text(
//                                                                 "Catergory : " +
//                                                                     obj['resultlist'][i]['category'])
//                                                         ),
//                                                       ),
//                                                     ]
//                                                 ),
//                                                 TableRow(
//                                                     children: [
//                                                       TableCell(
//                                                         child: Container(
//                                                             padding: EdgeInsets
//                                                                 .all(5),
//                                                             child: Text(
//                                                                 "Variation: " +
//                                                                     obj['resultlist'][i]['variation'])
//                                                         ),
//                                                       ),
//                                                     ]
//                                                 ),
//                                                 TableRow(
//                                                     children: [
//                                                       TableCell(
//                                                         child: Container(
//                                                             padding: EdgeInsets
//                                                                 .all(5),
//                                                             child: Text(
//                                                                 "Merchant_ID: " +
//                                                                     obj['resultlist'][i]['mID'])
//                                                         ),
//                                                       ),
//                                                     ]
//                                                 ),
//                                                 TableRow(
//                                                     children: [
//                                                       TableCell(
//                                                           child: Row(
//                                                             children: [
//                                                               InkWell(
//                                                                 onTap: () async {
//                                                                   print(
//                                                                       obj['resultlist'][i]['product_name']);
//                                                                   setState(() {
//                                                                     filePath =
//                                                                         'https://androidapi.bitesbytesnetwork.com/' +
//                                                                             obj['resultlist'][i]['picture'];
//                                                                     pictureExt =
//                                                                     "";
//
//                                                                     product_name
//                                                                         .text =
//                                                                     obj['resultlist'][i]['product_name'];
//                                                                     description
//                                                                         .text =
//                                                                     obj['resultlist'][i]['description'];
//                                                                     stock.text =
//                                                                     obj['resultlist'][i]['stock'];
//                                                                     price.text =
//                                                                     obj['resultlist'][i]['price'];
//                                                                     category
//                                                                         .text =
//                                                                     obj['resultlist'][i]['category'];
//                                                                     variation
//                                                                         .text =
//                                                                     obj['resultlist'][i]['variation'];
//                                                                     mID.text =
//                                                                     obj['resultlist'][i]['mID'];
//                                                                   });
//                                                                   showBarModalBottomSheet(
//                                                                     expand: true,
//                                                                     context: context,
//                                                                     builder: (
//                                                                         context) =>
//                                                                         Scaffold(
//                                                                           appBar: AppBar(
//                                                                             leading: new IconButton(
//                                                                               icon: new Icon(
//                                                                                   Icons
//                                                                                       .arrow_back,
//                                                                                   color: Colors
//                                                                                       .white),
//                                                                               onPressed: () =>
//                                                                                   setState(() {
//                                                                                     product_name
//                                                                                         .text =
//                                                                                     "";
//                                                                                     description
//                                                                                         .text =
//                                                                                     "";
//                                                                                     stock
//                                                                                         .text =
//                                                                                     "";
//                                                                                     price
//                                                                                         .text =
//                                                                                     "";
//                                                                                     category
//                                                                                         .text =
//                                                                                     "";
//                                                                                     variation
//                                                                                         .text =
//                                                                                     "";
//                                                                                     mID
//                                                                                         .text =
//                                                                                     "";
//                                                                                     Navigator
//                                                                                         .pop(
//                                                                                         context);
//                                                                                   }),
//                                                                             ),
//                                                                             flexibleSpace: Container(
//                                                                               decoration: const BoxDecoration(
//                                                                                 gradient: LinearGradient(
//                                                                                     begin: Alignment
//                                                                                         .topCenter,
//                                                                                     end: Alignment
//                                                                                         .bottomCenter,
//                                                                                     colors: <
//                                                                                         Color>[
//                                                                                       Colors
//                                                                                           .black,
//                                                                                       Colors
//                                                                                           .white
//                                                                                     ]
//                                                                                 ),
//                                                                               ),
//                                                                             ),
//                                                                             title: const Text(
//                                                                                 "Edit Product"),
//                                                                             backgroundColor: Colors
//                                                                                 .white,
//                                                                           ),
//                                                                           body: Container(
//                                                                             padding: EdgeInsets
//                                                                                 .all(
//                                                                                 20),
//                                                                             alignment: Alignment
//                                                                                 .center,
//                                                                             child: ListView(
//                                                                               children: [
//                                                                                 Card(
//                                                                                   elevation: 10,
//                                                                                   shadowColor: Colors
//                                                                                       .grey,
//                                                                                   child:
//                                                                                   TextButton(
//                                                                                     onPressed: () {
//                                                                                       showMaterialModalBottomSheet(
//                                                                                           expand: false,
//                                                                                           context: context,
//                                                                                           backgroundColor: Colors
//                                                                                               .transparent,
//                                                                                           builder: (
//                                                                                               context) =>
//                                                                                               Container(
//                                                                                                   decoration: const BoxDecoration(
//                                                                                                       color: Colors
//                                                                                                           .white
//                                                                                                   ),
//                                                                                                   child: ListView(
//                                                                                                     padding: EdgeInsets
//                                                                                                         .zero,
//                                                                                                     shrinkWrap: true,
//                                                                                                     physics: const NeverScrollableScrollPhysics(),
//                                                                                                     children: [
//                                                                                                       ListTile(
//                                                                                                         leading: const Icon(
//                                                                                                             Icons
//                                                                                                                 .browse_gallery),
//                                                                                                         onTap: () async {
//                                                                                                           XFile? image = await picker
//                                                                                                               .pickImage(
//                                                                                                               source: ImageSource
//                                                                                                                   .gallery);
//                                                                                                           setState(() {
//                                                                                                             filePath =
//                                                                                                                 image!
//                                                                                                                     .path;
//                                                                                                             pictureExt =
//                                                                                                                 image
//                                                                                                                     .path
//                                                                                                                     .split(
//                                                                                                                     '.')
//                                                                                                                     .last;
//                                                                                                           });
//                                                                                                         },
//                                                                                                         title: const Text(
//                                                                                                             'Upload from gallery'),
//                                                                                                       ),
//                                                                                                       const Divider(),
//                                                                                                       ListTile(
//                                                                                                         leading: const Icon(
//                                                                                                             Icons
//                                                                                                                 .camera),
//                                                                                                         onTap: () async {
//                                                                                                           XFile? image = await picker
//                                                                                                               .pickImage(
//                                                                                                               source: ImageSource
//                                                                                                                   .camera);
//                                                                                                           setState(() {
//                                                                                                             filePath =
//                                                                                                                 image!
//                                                                                                                     .path;
//                                                                                                             pictureExt =
//                                                                                                                 image
//                                                                                                                     .path
//                                                                                                                     .split(
//                                                                                                                     '.')
//                                                                                                                     .last;
//                                                                                                           });
//                                                                                                         },
//                                                                                                         title: const Text(
//                                                                                                             'Upload from camera'),
//                                                                                                       ),
//                                                                                                     ],
//                                                                                                   )
//                                                                                               )
//                                                                                       );
//                                                                                     },
//                                                                                     child: Column(
//                                                                                         children: [
//                                                                                           if(filePath !=
//                                                                                               null)
//                                                                                             Image
//                                                                                                 .network(
//                                                                                                 'https://androidapi.bitesbytesnetwork.com/' +
//                                                                                                     obj['resultlist'][i]['picture'])
//                                                                                         ]
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 //Image.network('https://androidapi.bitesbytesnetwork.com/' +obj['resultlist'][i]['pImage']),
//
//                                                                                 Container(
//                                                                                   padding: const EdgeInsets
//                                                                                       .all(
//                                                                                       10),),
//                                                                                 TextFormField(
//                                                                                   controller: product_name,
//                                                                                   style: const TextStyle(
//                                                                                       color: Colors
//                                                                                           .black),
//                                                                                   decoration: InputDecoration(
//                                                                                     filled: true,
//                                                                                     enabledBorder: const OutlineInputBorder
//                                                                                       (
//                                                                                         borderSide: BorderSide
//                                                                                           (
//                                                                                             color: Colors
//                                                                                                 .black
//                                                                                         )
//                                                                                     ),
//                                                                                     focusedBorder: const OutlineInputBorder
//                                                                                       (
//                                                                                         borderSide: BorderSide
//                                                                                           (
//                                                                                             color: Colors
//                                                                                                 .black
//                                                                                         )
//                                                                                     ),
//                                                                                     labelText: 'Product Name',
//                                                                                     hintText: 'Product Name',
//                                                                                     hintStyle: TextStyle
//                                                                                       (
//                                                                                       color: Colors
//                                                                                           .black
//                                                                                           .withOpacity(
//                                                                                           0.5),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 const Padding(
//                                                                                     padding: EdgeInsets
//                                                                                         .all(
//                                                                                         20)),
//                                                                                 TextFormField(
//                                                                                   controller: description,
//                                                                                   style: const TextStyle(
//                                                                                       color: Colors
//                                                                                           .black),
//                                                                                   decoration: InputDecoration(
//                                                                                     filled: true,
//                                                                                     enabledBorder: const OutlineInputBorder
//                                                                                       (
//                                                                                         borderSide: BorderSide
//                                                                                           (
//                                                                                             color: Colors
//                                                                                                 .black
//                                                                                         )
//                                                                                     ),
//                                                                                     focusedBorder: const OutlineInputBorder
//                                                                                       (
//                                                                                         borderSide: BorderSide
//                                                                                           (
//                                                                                             color: Colors
//                                                                                                 .black
//                                                                                         )
//                                                                                     ),
//                                                                                     labelText: 'Product Description',
//                                                                                     hintText: 'Product Description',
//                                                                                     hintStyle: TextStyle
//                                                                                       (
//                                                                                       color: Colors
//                                                                                           .black
//                                                                                           .withOpacity(
//                                                                                           0.5),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 const Padding(
//                                                                                     padding: EdgeInsets
//                                                                                         .all(
//                                                                                         20)),
//                                                                                 TextFormField(
//                                                                                   controller: stock,
//                                                                                   style: const TextStyle(
//                                                                                       color: Colors
//                                                                                           .black),
//                                                                                   decoration: InputDecoration(
//                                                                                     filled: true,
//                                                                                     enabledBorder: const OutlineInputBorder
//                                                                                       (
//                                                                                         borderSide: BorderSide
//                                                                                           (
//                                                                                             color: Colors
//                                                                                                 .black
//                                                                                         )
//                                                                                     ),
//                                                                                     focusedBorder: const OutlineInputBorder
//                                                                                       (
//                                                                                         borderSide: BorderSide
//                                                                                           (
//                                                                                             color: Colors
//                                                                                                 .black
//                                                                                         )
//                                                                                     ),
//                                                                                     labelText: 'Product Stock',
//                                                                                     hintText: 'Product Stock',
//                                                                                     hintStyle: TextStyle
//                                                                                       (
//                                                                                       color: Colors
//                                                                                           .black
//                                                                                           .withOpacity(
//                                                                                           0.5),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 const Padding(
//                                                                                     padding: EdgeInsets
//                                                                                         .all(
//                                                                                         20)),
//                                                                                 TextFormField(
//                                                                                   controller: price,
//                                                                                   style: const TextStyle(
//                                                                                       color: Colors
//                                                                                           .black),
//                                                                                   decoration: InputDecoration(
//                                                                                     filled: true,
//                                                                                     enabledBorder: const OutlineInputBorder
//                                                                                       (
//                                                                                         borderSide: BorderSide
//                                                                                           (
//                                                                                             color: Colors
//                                                                                                 .black
//                                                                                         )
//                                                                                     ),
//                                                                                     focusedBorder: const OutlineInputBorder
//                                                                                       (
//                                                                                         borderSide: BorderSide
//                                                                                           (
//                                                                                             color: Colors
//                                                                                                 .black
//                                                                                         )
//                                                                                     ),
//                                                                                     labelText: 'Product Price',
//                                                                                     hintText: 'Product Price',
//                                                                                     hintStyle: TextStyle
//                                                                                       (
//                                                                                       color: Colors
//                                                                                           .black
//                                                                                           .withOpacity(
//                                                                                           0.5),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 const Padding(
//                                                                                     padding: EdgeInsets
//                                                                                         .all(
//                                                                                         10)),
//
//                                                                                 TextFormField(
//                                                                                   controller: category,
//                                                                                   keyboardType: TextInputType
//                                                                                       .number,
//                                                                                   inputFormatters: [
//                                                                                     FilteringTextInputFormatter
//                                                                                         .digitsOnly
//                                                                                   ],
//                                                                                   decoration: const InputDecoration(
//                                                                                     enabledBorder: OutlineInputBorder(
//                                                                                         borderSide: BorderSide(
//                                                                                             color: Colors
//                                                                                                 .black87
//                                                                                         )
//                                                                                     ),
//                                                                                     focusedBorder: OutlineInputBorder(
//                                                                                         borderSide: BorderSide(
//                                                                                             color: Colors
//                                                                                                 .black87
//                                                                                         )
//                                                                                     ),
//                                                                                     labelText: 'Product category',
//                                                                                     hintText: 'Product category',
//                                                                                     hintStyle: TextStyle(
//                                                                                       color: Colors
//                                                                                           .blueGrey,
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 const Padding(
//                                                                                     padding: EdgeInsets
//                                                                                         .all(
//                                                                                         10)),
//
//                                                                                 TextFormField(
//                                                                                   controller: variation,
//                                                                                   keyboardType: TextInputType
//                                                                                       .number,
//                                                                                   inputFormatters: [
//                                                                                     FilteringTextInputFormatter
//                                                                                         .digitsOnly
//                                                                                   ],
//                                                                                   decoration: const InputDecoration(
//                                                                                     enabledBorder: OutlineInputBorder(
//                                                                                         borderSide: BorderSide(
//                                                                                             color: Colors
//                                                                                                 .black87
//                                                                                         )
//                                                                                     ),
//                                                                                     focusedBorder: OutlineInputBorder(
//                                                                                         borderSide: BorderSide(
//                                                                                             color: Colors
//                                                                                                 .black87
//                                                                                         )
//                                                                                     ),
//                                                                                     labelText: 'Product variation',
//                                                                                     hintText: 'Product variation',
//                                                                                     hintStyle: TextStyle(
//                                                                                       color: Colors
//                                                                                           .blueGrey,
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//
//                                                                                 TextFormField(
//                                                                                   controller: mID,
//                                                                                   keyboardType: TextInputType
//                                                                                       .number,
//                                                                                   inputFormatters: [
//                                                                                     FilteringTextInputFormatter
//                                                                                         .digitsOnly
//                                                                                   ],
//                                                                                   decoration: const InputDecoration(
//                                                                                     enabledBorder: OutlineInputBorder(
//                                                                                         borderSide: BorderSide(
//                                                                                             color: Colors
//                                                                                                 .black87
//                                                                                         )
//                                                                                     ),
//                                                                                     focusedBorder: OutlineInputBorder(
//                                                                                         borderSide: BorderSide(
//                                                                                             color: Colors
//                                                                                                 .black87
//                                                                                         )
//                                                                                     ),
//                                                                                     labelText: 'Merchant_ID',
//                                                                                     hintText: 'Merchant_ID',
//                                                                                     hintStyle: TextStyle(
//                                                                                       color: Colors
//                                                                                           .blueGrey,
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 const Padding(
//                                                                                     padding: EdgeInsets
//                                                                                         .all(
//                                                                                         20)),
//                                                                                 TextButton
//                                                                                   (
//                                                                                     onPressed: () async
//                                                                                     {
//                                                                                       if (filePath !=
//                                                                                           null)
//                                                                                         EasyLoading
//                                                                                             .show(
//                                                                                             status: 'Uploading');
//                                                                                       var product_id = obj['resultlist'][i]['product_id'];
//                                                                                       var response = await EProduct
//                                                                                           .ep(
//                                                                                           product_name
//                                                                                               .text,
//                                                                                           description
//                                                                                               .text,
//                                                                                           stock
//                                                                                               .text,
//                                                                                           price
//                                                                                               .text,
//                                                                                           product_id,
//                                                                                           filePath,
//                                                                                           pictureExt,
//                                                                                           category
//                                                                                               .text,
//                                                                                           variation
//                                                                                               .text);
//                                                                                       var obj2 = jsonDecode(
//                                                                                           response);
//                                                                                       print(
//                                                                                           response);
//                                                                                       if (obj2['code'] ==
//                                                                                           'success') {
//                                                                                         Navigator
//                                                                                             .pop(
//                                                                                             context);
//                                                                                         showDialog
//                                                                                           (
//                                                                                           context: context,
//                                                                                           builder: (
//                                                                                               _) =>
//                                                                                           const CupertinoAlertDialog
//                                                                                             (
//                                                                                             content: Text(
//                                                                                                 "Update Success"),
//                                                                                           ),
//                                                                                         );
//                                                                                         setState(() {
//                                                                                           product_name
//                                                                                               .text =
//                                                                                           "";
//                                                                                           description
//                                                                                               .text =
//                                                                                           "";
//                                                                                           stock
//                                                                                               .text =
//                                                                                           "";
//                                                                                           price
//                                                                                               .text =
//                                                                                           "";
//                                                                                           category
//                                                                                               .text =
//                                                                                           "";
//                                                                                           variation
//                                                                                               .text =
//                                                                                           "";
//                                                                                         });
//                                                                                       }
//                                                                                       else {
//                                                                                         showDialog
//                                                                                           (
//                                                                                             context: context,
//                                                                                             builder: (
//                                                                                                 _) =>
//                                                                                             const CupertinoAlertDialog
//                                                                                               (
//                                                                                               content: Text(
//                                                                                                 "Error",),
//                                                                                             )
//                                                                                         );
//                                                                                       }
//                                                                                       (obj2['code']);
//                                                                                     },
//                                                                                     child: Text(
//                                                                                       "SAVE",
//                                                                                       style: TextStyle(
//                                                                                           color: Colors
//                                                                                               .purple),),
//                                                                                     style: ElevatedButton
//                                                                                         .styleFrom(
//                                                                                         side: BorderSide(
//                                                                                             color: Colors
//                                                                                                 .purple,
//                                                                                             width: 2),
//                                                                                         primary: Colors
//                                                                                             .white,
//                                                                                         minimumSize: const Size
//                                                                                             .fromHeight(
//                                                                                             50),
//                                                                                         padding: const EdgeInsets
//                                                                                             .all(
//                                                                                             10)
//                                                                                     )
//                                                                                 ),
//                                                                               ],
//                                                                             ),
//                                                                           ),
//                                                                         ),
//                                                                   );
//                                                                 },
//
//                                                                 child: Text(
//                                                                   "Edit",
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .blue),
//                                                                 ),
//                                                               ),
//                                                               Container(
//                                                                 padding: const EdgeInsets
//                                                                     .all(10),),
//                                                               Row(
//                                                                 children: [
//                                                                   TextButton(
//                                                                     onPressed: () async {
//                                                                       var product_id = obj['resultlist'][i]['product_id'];
//                                                                       var response2 = await RProduct
//                                                                           .ep(
//                                                                           product_id);
//                                                                       var obj2 = jsonDecode(
//                                                                           response2);
//                                                                       if (obj['code'] ==
//                                                                           "success") {
//                                                                         setState(() {
//                                                                           productList =
//                                                                               ProductList();
//                                                                         });
//                                                                       }
//                                                                       showDialog(
//                                                                           context: context,
//                                                                           builder: (
//                                                                               _) =>
//                                                                               CupertinoAlertDialog(
//                                                                                 content: Text(
//                                                                                     obj['code']),
//
//                                                                               )
//                                                                       );
//                                                                     },
//
//
//                                                                     child: const Text(
//                                                                       'Remove',
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .redAccent),),
//
//
//                                                                   ),
//
//                                                                 ],
//
//                                                               )
//                                                             ],
//                                                           )
//                                                       )
//                                                     ]
//                                                 )
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                             ],
//                           );
//                         }
//                         else {
//                           return Container();
//                         }
//                       }
//                       else {
//                         return Container();
//                       }
//                     },
//
//                   ),
//                 ],
//               );
//             }
//
//     );
//   }
// }
//
//
//
