import 'dart:convert';

import 'package:finalassign/Sign_in/sign_in.dart';
import 'package:finalassign/postApi/web2.dart';
import 'package:finalassign/postApi/web3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottomnavbar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavBar(),
      body: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot){
          if(snapshot.hasData){
            if(snapshot.data!.getString('merchant_id') != null) {
              String merchant_id = snapshot.data!.getString("merchant_id")!;
              return FutureBuilder(
                  future: VProfileMerchant.vpm(merchant_id),
                  builder: (BuildContext context,
                      AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      var response = snapshot.data;
                      var obj = jsonDecode(response!);
                      if (obj['code'] == 'success') {
                        return Column(
                          children: [
                            for(var i = 0; i < obj['resultList'].length; i++)
                              Column(
                                children: [
                                  Padding(padding: const EdgeInsets.all(10)),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 600,
                                    child: ListView(
                                      physics: const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        Center(
                                          child: ListView(
                                              shrinkWrap: true,
                                              children: [
                                                Container(
                                                  padding:EdgeInsets.only(top: 20,bottom: 20),
                                                  child: Text(
                                                    'Profile',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        color: Colors.white
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 200,
                                                  child: Image.network(
                                                    'https://androidapi.bitesbytesnetwork.com/' +
                                                        obj['resultList'][i]['image'],),
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.all(
                                                        7.5)),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          10),
                                                      child: Text(
                                                        'Username:',
                                                        style: TextStyle(
                                                            color: Colors.white
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                        padding: const EdgeInsets
                                                            .all(5),
                                                        width: 200,
                                                        // decoration: BoxDecoration(
                                                        //     borderRadius: BorderRadius.circular(5),
                                                        //     border: Border.all(color: Colors.orange)
                                                        // ),
                                                        child: Text(
                                                          obj['resultList'][i]['username'],
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors
                                                                  .white
                                                          ),
                                                          textAlign: TextAlign
                                                              .center,
                                                        )
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          10),
                                                      child: Text(
                                                        'Company Name:',
                                                        style: TextStyle(
                                                            color: Colors.white
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                        padding: const EdgeInsets
                                                            .all(5),
                                                        width: 200,
                                                        // decoration: BoxDecoration(
                                                        //     borderRadius: BorderRadius.circular(5),
                                                        //     border: Border.all(color: Colors.orange)
                                                        // ),
                                                        child: Text(
                                                          obj['resultList'][i]['companyName'],
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors
                                                                  .white
                                                          ),
                                                          textAlign: TextAlign
                                                              .center,
                                                        )
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          10),
                                                      child: Text(
                                                        'Email:',
                                                        style: TextStyle(
                                                            color: Colors.white
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                        padding: const EdgeInsets
                                                            .all(5),
                                                        width: 200,
                                                        // decoration: BoxDecoration(
                                                        //     borderRadius: BorderRadius.circular(5),
                                                        //     border: Border.all(color: Colors.orange)
                                                        // ),
                                                        child: Text(
                                                          obj['resultList'][i]['email'],
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors
                                                                  .white
                                                          ),
                                                          textAlign: TextAlign
                                                              .center,
                                                        )
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          10),
                                                      child: Text(
                                                        'Description:',
                                                        style: TextStyle(
                                                            color: Colors.white
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                        padding: const EdgeInsets
                                                            .all(5),
                                                        width: 200,
                                                        // decoration: BoxDecoration(
                                                        //     borderRadius: BorderRadius.circular(5),
                                                        //     border: Border.all(color: Colors.orange)
                                                        // ),
                                                        child: Text(
                                                          obj['resultList'][i]['description'],
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors
                                                                  .white
                                                          ),
                                                          textAlign: TextAlign
                                                              .center,
                                                        )
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  child: Center(
                                                    child: TextButton(
                                                      onPressed: () async {
                                                        SharedPreferences prefs = await SharedPreferences
                                                            .getInstance();
                                                        prefs.remove('merchant_id');
                                                        Navigator
                                                            .pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (
                                                                    BuildContext ctx) =>
                                                                    SignIn()));
                                                      },
                                                      child: Text('Logout'),
                                                    ),
                                                  ),
                                                ),
                                              ]
                                          ),
                                        ),
                                      ],
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
            }else if(snapshot.data!.getString('customer_id') != null) {
              String customer_id = snapshot.data!.getString("customer_id")!;
              return FutureBuilder(
                  future: VProfileCustomer.vpc(customer_id),
                  builder: (BuildContext context,
                      AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      var response = snapshot.data;
                      var obj = jsonDecode(response!);
                      if (obj['code'] == 'success') {
                        return Column(
                          children: [
                            for(var i = 0; i < obj['resultList'].length; i++)
                              Column(
                                children: [
                                  Padding(padding: const EdgeInsets.all(10)),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 600,
                                    child: ListView(
                                      physics: const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        Center(
                                          child: ListView(
                                              shrinkWrap: true,
                                              children: [
                                                Container(
                                                  padding:EdgeInsets.only(top: 100),
                                                  child: Text(
                                                    'Profile',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.white
                                                    ),
                                                  ),
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.all(
                                                        7.5)),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          10),
                                                      child: Text(
                                                        'Username:',
                                                        style: TextStyle(
                                                            color: Colors.white
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                        padding: const EdgeInsets
                                                            .all(5),
                                                        width: 200,
                                                        // decoration: BoxDecoration(
                                                        //     borderRadius: BorderRadius.circular(5),
                                                        //     border: Border.all(color: Colors.orange)
                                                        // ),
                                                        child: Text(
                                                          obj['resultList'][i]['username'],
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors
                                                                  .white
                                                          ),
                                                          textAlign: TextAlign
                                                              .center,
                                                        )
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          10),
                                                      child: Text(
                                                        'Email:',
                                                        style: TextStyle(
                                                            color: Colors.white
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                        padding: const EdgeInsets
                                                            .all(5),
                                                        width: 200,
                                                        // decoration: BoxDecoration(
                                                        //     borderRadius: BorderRadius.circular(5),
                                                        //     border: Border.all(color: Colors.orange)
                                                        // ),
                                                        child: Text(
                                                          obj['resultList'][i]['email'],
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors
                                                                  .white
                                                          ),
                                                          textAlign: TextAlign
                                                              .center,
                                                        )
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          10),
                                                      child: Text(
                                                        'IC:',
                                                        style: TextStyle(
                                                            color: Colors.white
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                        padding: const EdgeInsets
                                                            .all(5),
                                                        width: 200,
                                                        // decoration: BoxDecoration(
                                                        //     borderRadius: BorderRadius.circular(5),
                                                        //     border: Border.all(color: Colors.orange)
                                                        // ),
                                                        child: Text(
                                                          obj['resultList'][i]['ic'],
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors
                                                                  .white
                                                          ),
                                                          textAlign: TextAlign
                                                              .center,
                                                        )
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          10),
                                                      child: Text(
                                                        'Regdate:',
                                                        style: TextStyle(
                                                            color: Colors.white
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                        padding: const EdgeInsets
                                                            .all(5),
                                                        width: 200,
                                                        // decoration: BoxDecoration(
                                                        //     borderRadius: BorderRadius.circular(5),
                                                        //     border: Border.all(color: Colors.orange)
                                                        // ),
                                                        child: Text(
                                                          obj['resultList'][i]['regdate'],
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors
                                                                  .white
                                                          ),
                                                          textAlign: TextAlign
                                                              .center,
                                                        )
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  child: Center(
                                                    child: TextButton(
                                                      onPressed: () async {
                                                        SharedPreferences prefs = await SharedPreferences
                                                            .getInstance();
                                                        prefs.remove('customer_id');
                                                        Navigator
                                                            .pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (
                                                                    BuildContext ctx) =>
                                                                    SignIn()));
                                                      },
                                                      child: Text('Logout'),
                                                    ),
                                                  ),
                                                ),
                                              ]
                                          ),
                                        ),
                                      ],
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
