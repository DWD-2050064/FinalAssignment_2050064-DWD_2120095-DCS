import 'dart:convert';

import 'package:flutter/material.dart';

import '../postApi/web1.dart';

class product extends StatefulWidget {
  const product({Key? key}) : super(key: key);

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  String ?category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body:
      FutureBuilder(
        future: VProduct.vp(category),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot){
          //if (category = null){
          if(snapshot.hasData){
            var  response = snapshot.data;
            var obj = jsonDecode(response!);
            if(obj['code'] == 'success'){
              return
                Table(

                children: [
                  TableRow(
                      children: [
                        TableCell(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Text('No'),
                            )
                        ),
                        TableCell(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Text('Image'),
                            )
                        ),
                        TableCell(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Text('Update'),
                            )
                        )
                      ]
                  ),
                  for(var i = 0;i < obj['resultList'].length;i++)
                    TableRow(
                        children: [
                          TableCell(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text((i+1).toString()),
                              )
                          ),
                          TableCell(
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Image.network(obj['resultList'][i]['imagePath'])
                              )
                          ),
                          TableCell(
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: InkWell(
                                    onTap: () async{
                                      //resultlist
                                      // var response2 = await ImageRemove.testApiRemoveImage(obj['resultList'][i]['imageID']);
                                      // var obj2 = jsonDecode(response2);
                                      // if(obj2['code'] == 'success'){
                                      //   setState(() {
                                      //     imageList = imageView();
                                      //   });
                                      // }
                                      // showDialog(
                                      //     context: context,
                                      //     builder: (context){
                                      //       return CupertinoAlertDialog(
                                      //         title: Text(obj2['code']),
                                      //         content: Text(obj2['message']),
                                      //       );
                                      //     }
                                      // );
                                    },
                                    child: Text(
                                      'Remove',
                                      style: TextStyle(
                                          color: Colors.red
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                              )
                          )
                        ]
                    ),
                ],
              );
            }else{
              return Container();
            }
          }else{
            return Container();
          }


        }
      ),
    );


  }
}
