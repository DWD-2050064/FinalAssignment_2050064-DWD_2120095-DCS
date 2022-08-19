import 'dart:convert';

import 'package:finalassignment/postApi/web1.dart';
import 'package:flutter/material.dart';



class details extends StatefulWidget {
  const details({Key? key}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}

  class _detailsState extends State<details> {
  String ?category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
          ListView(
          children:[
      FutureBuilder(
          future: VProduct.vp(category),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot){
            //if (category = null){
            if(snapshot.hasData){
              var  response = snapshot.data;
              var obj = jsonDecode(response!);
              if(obj['code'] == 'success'){
                return
                  Column(
                      children: [
                  for(var i = 0; i < obj['resultlist'].length;i++)
                Column(
                  children: [
                    const Padding(padding: EdgeInsets.all(10)),
                    Card(
                    shadowColor: Colors.grey,
                    elevation: 10,
                    child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 185,
                    child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                    const Padding(padding: EdgeInsets.all(10)),
                    Center(
                    child: Image.network('https://androidapi.bitesbytesnetwork.com/' + obj['resultlist'][i]['picture']),
                    ),

                    const Padding(padding: EdgeInsets.all(7.5)),
                    Table(
                    defaultColumnWidth: const FixedColumnWidth(200.0),
                    children: [
                    TableRow(
                    children: [
                    TableCell(
                    child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Text(obj['resultlist'][i]['product_name'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)

                    ),

                    ),
                    TableCell(
                    child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Text(obj['resultlist'][i]['desciption'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)

                    ),

                    ),
                    TableCell(
                    child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Text(obj['resultlist'][i]['price'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)

                    ),

                    ),
                    ]
                    ),


                  ],


                    ),

                   ],

                    ),

                  ),
                  ),
            ],
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
    ]
    ),

    );


  }
}
