import 'dart:convert';
import 'package:finalassign/postApi/web1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Cart/Cart_Model.dart';
import '../Cart/db.dart';
import '../bottomnavbar.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.pushNamed(context, '/cart_page');
        },
        child: Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
          size: 24.0,
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
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
                                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                                          prefs.setString('category', obj['resultList'][i]['category']);
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
                                                                    FittedBox(
                                                                      child: Image.network('https://androidapi.bitesbytesnetwork.com/' + obj['resultList'][i]['picture'],
                                                                          width: 160,height: 180, fit:BoxFit.fill),
                                                                    ),
                                                                    Text(obj['resultList'][i]['product_name'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                                                    Container(padding: const EdgeInsets.all(5),),
                                                                    Text("Price : RM"+obj['resultList'][i]['price'],
                                                                      style: TextStyle(
                                                                        fontSize: 20,
                                                                        color: Colors.white
                                                                    ),),
                                                                    Container(padding: const EdgeInsets.all(5),),
                                                                    Text("Stock : "+obj['resultList'][i]['stock'],
                                                                      style: TextStyle(
                                                                          fontSize: 20,
                                                                          color: Colors.white
                                                                      ),),
                                                                    Container(padding: const EdgeInsets.all(5),),
                                                                    Text("Description : "+obj['resultList'][i]['description'],
                                                                      style: TextStyle(
                                                                          fontSize: 20,
                                                                          color: Colors.white
                                                                      ),),
                                                                    Container(padding: const EdgeInsets.all(5),),
                                                                    TextButton(
                                                                        onPressed: (){
                                                                        },
                                                                        child: Container(
                                                                          width: 400,
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.orange,
                                                                            borderRadius: BorderRadius.circular(5)
                                                                          ),
                                                                          child: Text(
                                                                            'Add Cart',
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
                                                            TextButton(
                                                                onPressed: () async {
                                                                  String product_id = obj['resultList'][i]['product_id'];
                                                                  String picture = obj['resultList'][i]['picture'];
                                                                  String price = obj['resultList'][i]['price'];
                                                                  String stock = obj['resultList'][i]['stock'];
                                                                  final cart = Cart(
                                                                      product_id: int.parse(product_id),
                                                                      picture: int.parse(picture),
                                                                      price: int.parse(price),
                                                                      stock: int.parse(stock)
                                                                  );

                                                                  await CartDatabase.instance.create(cart);
                                                                },
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    color: Colors.orange,
                                                                      borderRadius: BorderRadius.circular(2)
                                                                  ),
                                                                  child: Text(
                                                                    'Add Cart',
                                                                    textAlign: TextAlign.center,
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                      fontSize: 18
                                                                    ),
                                                                  ),
                                                                )
                                                            )
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
