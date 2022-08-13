
import 'dart:convert';

import 'package:finalassignment/postApi/web1.dart';

import 'package:flutter/material.dart';

import 'body.dart';
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
      bottomNavigationBar: BottomNavBar(),
      body:FutureBuilder(
          future: VCategory.vc(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot){
            if(snapshot.hasData){
              var response = snapshot.data;
              var obj = jsonDecode(response!);
              if(obj['code'] == 'success'){
                return

                  Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.white, Colors.black])),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,

                      appBar: AppBar(
                        title: Text("NFT ECOM APPS "),
                        backgroundColor: Colors.transparent,
                      ),

                      body:


                      ListView(

                        children: [

                          const Center(

                            child: Text("Welcome to NFT",style: TextStyle(height: 5, fontSize: 30
                                ,color: Colors.white
                            ),
                            ),

                          ),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  width: 105,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black
                                    ),

                                  ),

                                  // child: InkWell(
                                  //   highlightColor: Colors.transparent,
                                  //   splashColor: Colors.transparent,
                                  //   onTap: (){
                                  //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>userprofile()));
                                  //   },
                                  //   child: const Text('User Profile',
                                  //
                                  //
                                  //     style: TextStyle( color: Colors.blueAccent,
                                  //       backgroundColor: Color(0xFF030303),fontSize: 20,
                                  //     ),
                                  //   ),
                                  // ),

                                ),
                                const Padding(padding: EdgeInsets.all(10)),
                                Container(
                                  width: 40,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black
                                    ),

                                  ),

                                  // child: InkWell(
                                  //   highlightColor: Colors.transparent,
                                  //   splashColor: Colors.transparent,
                                  //
                                  //   onTap: (){
                                  //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>userprofile()));
                                  //   },
                                  //   child:Center(
                                  //
                                  //
                                  //     child: const Text('Cart',
                                  //
                                  //
                                  //       style: TextStyle( color: Colors.blueAccent,
                                  //         backgroundColor: Color(0xFF030303),fontSize: 20,
                                  //       ),
                                  //
                                  //     ),
                                  //
                                  //
                                  //   ),
                                  // ),

                                ),
                                // const Padding(padding: EdgeInsets.all(10)),
                                // Container(
                                //   width: 110,
                                //   height: 30,
                                //   decoration: BoxDecoration(
                                //     border: Border.all(
                                //         color: Colors.black
                                //     ),
                                //
                                //   ),
                                //   child: InkWell(
                                //     highlightColor: Colors.transparent,
                                //     splashColor: Colors.transparent,
                                //     onTap: (){
                                //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Body()));
                                //     },
                                //     child: const Text('▶Home page◀',
                                //
                                //
                                //       style: TextStyle( color: Colors.blueAccent
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                const Padding(padding: EdgeInsets.all(10)),
                                // Container(
                                //   width: 200,
                                //   height: 200,
                                //   decoration: BoxDecoration(
                                //     border: Border.all(
                                //         color: Colors.black
                                //     ),
                                //
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          const Text(
                            'Category',


                            style: TextStyle( color: Colors.white,fontSize: 30,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(10)),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black
                                    ),

                                  ),
                                  child: Container(child: ConstrainedBox(
                                      constraints: BoxConstraints.expand(),
                                      child: IconButton(

                                        icon: Image.asset('assets/images/women.png'),
                                        iconSize: 50,
                                        onPressed: (

                                            ) {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Body()));},
                                      )
                                    // child: InkWell(
                                    //
                                    //    // onTap: ,
                                    //     child: Image.asset('assets/women.png',height: 50,
                                    //       width: 50,))

                                  )

                                  ),

                                ),
                                const Padding(padding: EdgeInsets.all(10)),
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black
                                    ),

                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(10)),
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black
                                    ),

                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(10)),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black
                                    ),

                                  ),
                                  child: Container(child: ConstrainedBox(
                                      constraints: BoxConstraints.expand(),
                                      child: IconButton(

                                        icon: Image.asset('assets/women.png'),
                                        iconSize: 50,
                                        onPressed: (

                                            ) {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Body()));},
                                      )
                                    // child: InkWell(
                                    //
                                    //    // onTap: ,
                                    //     child: Image.asset('assets/women.png',height: 50,
                                    //       width: 50,))

                                  )

                                  ),

                                ),
                                const Padding(padding: EdgeInsets.all(10)),
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black
                                    ),

                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(10)),
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black
                                    ),

                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(10)),
                          SizedBox(
                            height: 300,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black
                                      ),

                                    ),

                                  ),
                                  const Padding(padding: EdgeInsets.all(10)),
                                  Container(

                                    height: 200,
                                    decoration: BoxDecoration(

                                      border: Border.all(
                                          color: Colors.black

                                      ),

                                    ),

                                  ),
                                  const Padding(padding: EdgeInsets.all(10)),
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black
                                      ),

                                    ),

                                  ),



                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
