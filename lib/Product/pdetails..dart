import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../postApi/web1.dart';


class details extends StatefulWidget {
  const details({Key? key}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot){
        String category = snapshot.data!.getString("category_id")!;
        return FutureBuilder(
            future: VProduct.vp(category),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot){
              if(snapshot.hasData){
                var response = snapshot.data;
                var obj = jsonDecode(response!);
                if (obj['code'] == 'success'){
                  return Column(
                    children: [
                      for(var i = 0; i < obj['resultList'].length;i++)
                        Column(
                          children: [
                            Padding(padding: const EdgeInsets.all(10)),
                            Card(
                              shadowColor: Colors.grey,
                              elevation: 10,
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 185,
                                  child: InkWell(
                                    onTap: (){

                                    },child:  ListView(
                                    physics: const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Padding(padding: EdgeInsets.all(10)),
                                      FittedBox(
                                        child: Image.network('https://androidapi.bitesbytesnetwork.com/' + obj['resultList'][i]['picture'],
                                            width: 150,height: 150, fit:BoxFit.fill),
                                      ),
                                      Padding(padding: EdgeInsets.all(7.5)),
                                      Table(
                                        defaultColumnWidth: FixedColumnWidth(200.0),
                                        children: [
                                          TableRow(
                                              children: [
                                                TableCell(
                                                    child: Container(
                                                        padding: EdgeInsets.all(5),
                                                        child: Text(obj['resultList'][i]['product_name'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)

                                                    )
                                                )
                                              ]
                                          ),
                                          TableRow(
                                              children: [
                                                TableCell(
                                                    child: Container(
                                                        padding: EdgeInsets.all(5),
                                                        child: Text(obj['resultList'][i]['description'])
                                                    )
                                                )
                                              ]
                                          ),
                                          TableRow(
                                              children: [
                                                TableCell(
                                                    child: Container(
                                                        padding: EdgeInsets.all(5),
                                                        child: Text("Stock : "+obj['resultList'][i]['stock'])
                                                    )
                                                )
                                              ]
                                          ),
                                          TableRow(
                                              children: [
                                                TableCell(
                                                  child: Container(
                                                      padding: EdgeInsets.all(5),
                                                      child: Text("Price : RM"+obj['resultList'][i]['price'])
                                                  ),
                                                ),
                                              ]
                                          ),
                                          TableRow(
                                              children: [
                                                TableCell(
                                                    child: Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () async {
                                                            showBarModalBottomSheet(
                                                              expand: true,
                                                              context: context,
                                                              builder: (context) => Scaffold(
                                                                appBar: AppBar(
                                                                  leading: new IconButton(
                                                                    icon: new Icon(Icons.arrow_back, color: Colors.white),
                                                                    onPressed: () => setState(() {
                                                                      Navigator.pop(context);
                                                                    }),
                                                                  ),
                                                                  flexibleSpace: Container(
                                                                    decoration: const BoxDecoration(
                                                                      gradient: LinearGradient(
                                                                          begin: Alignment.topCenter,
                                                                          end: Alignment.bottomCenter,
                                                                          colors: <Color>[Colors.black,Colors.orange]
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  title: const Text("Product Details"),
                                                                  backgroundColor: Colors.white,
                                                                ),
                                                                body: Container(
                                                                  alignment: Alignment.center,
                                                                  child: ListView(
                                                                    padding: const EdgeInsets.all(20),
                                                                    children: [
                                                                      FittedBox(
                                                                        child: Image.network('https://androidapi.bitesbytesnetwork.com/' + obj['resultList'][i]['picture'],
                                                                            width: 160,height: 180, fit:BoxFit.fill),
                                                                      ),
                                                                      Divider(),
                                                                      Text(obj['resultList'][i]['product_name'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                                                      Container(padding: const EdgeInsets.all(5),),
                                                                      Text("Price : RM"+obj['resultList'][i]['price']),
                                                                      Container(padding: const EdgeInsets.all(5),),
                                                                      Text("Stock : "+obj['resultList'][i]['stock']),
                                                                      Container(padding: const EdgeInsets.all(5),),
                                                                      Text("Description : "+obj['resultList'][i]['description']),
                                                                      Container(padding: const EdgeInsets.all(5),),




                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },

                                                          child: Text("Product Detail",style: TextStyle(color: Colors.blue),
                                                          ),
                                                        ),

                                                      ],
                                                    )
                                                )
                                              ]
                                          )


                                        ],
                                      )
                                    ],
                                  ),
                                  )
                              ),
                            ),
                          ],
                        ),
                    ],
                  );
                }else{
                  return Container();
                }
              }else {
                return Container();
              }
            }

        );
      },
    ),
    );


  }
}
