import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'db.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CartDatabase.instance.readAllCart(),
      builder: (BuildContext context,
          AsyncSnapshot<List> snapshot){
        if (snapshot.hasData){
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
                            for(var i = 0;i < snapshot.data!.length;i++)
                            Padding(padding: EdgeInsets.only(left: 10,bottom: 50,right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 130,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.orange)
                                      ),
                                          child: Row(
                                            children: [
                                              Image.network(snapshot.data![i].picture.toString(),
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
                                                        child: Text(snapshot.data![i].product_id.toString(),
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors.white
                                                          ),
                                                        )
                                                    ),
                                                    Container(
                                                        padding: EdgeInsets.all(5),
                                                        child: Text("RM"+ snapshot.data![i].price.toString(),
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              color: Colors.white
                                                          ),
                                                        )
                                                    ),
                                                    Container(
                                                        padding: EdgeInsets.all(5),
                                                        child: Text("stock "+snapshot.data![i].stock.toString(),
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
        }else{
          return Container();
        }
      },
    );
  }
}