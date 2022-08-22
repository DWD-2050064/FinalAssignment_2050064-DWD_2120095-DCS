import 'dart:convert';
import 'package:finalassign/postApi/web1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottomnavbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavBar(),
      body: FutureBuilder(
          future: VCategory.vc(),
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
                              'Category',
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
                                    Padding(padding: EdgeInsets.only(left: 50,bottom: 50),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Text(obj['resultList'][i]['name'],
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                    color: Colors.white
                                                ),
                                              )
                                          ),
                                          InkWell(
                                            onTap: ()async{
                                              SharedPreferences prefs = await SharedPreferences.getInstance();
                                              prefs.setString('category_id', obj['resultList'][i]['category_id']);
                                              if(prefs.getString('merchant_id') != null){
                                                Navigator.of(context)
                                                    .pushNamedAndRemoveUntil('/product_list_merchant', (Route<dynamic> route) => false);
                                              }else if(prefs.getString('customer_id') != null){
                                                Navigator.of(context)
                                                    .pushNamedAndRemoveUntil('/product_list', (Route<dynamic> route) => false);
                                              }
                                            },
                                            child: Image.network(
                                              'https://androidapi.bitesbytesnetwork.com/' +
                                                  obj['resultList'][i]['thumbnail'],
                                              height: 200,
                                              width: 300,
                                              fit: BoxFit.fitWidth,
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
      ),
    );
  }
}
