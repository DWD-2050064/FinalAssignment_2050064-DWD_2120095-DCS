
import 'dart:convert';
import 'dart:ui' as ui;

import 'package:finalassignment/Product/myproduct/pdetails..dart';
import 'package:finalassignment/Product/product.dart';
import 'package:finalassignment/postApi/web1.dart';

import 'package:flutter/material.dart';

import 'Cart/cartscreen.dart';
import 'Product/details_screen.dart';

import 'Product/mainproduct.dart';
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
      appBar: AppBar(title:
      Text(
        'Welcome to NFT',
        style: TextStyle(
            fontSize: 40,
            foreground: Paint()
              ..shader = ui.Gradient.linear(
                const Offset(0, 20),
                const Offset(150, 20),
                <Color>[
                  Colors.black,
                  Colors.white,
                ],
              )
        ),
      ),
        backgroundColor: Colors.black45,),
      bottomNavigationBar: BottomNavBar(),

      body:
      FutureBuilder(
          future: VCategory.vc(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot){
            if(snapshot.hasData){
              var response = snapshot.data;
              var obj = jsonDecode(response!);
              if(obj['code'] == 'success'){
                return

                  Container(
                    decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bgbody2.jpg',

                        ),

                        fit: BoxFit.fill),
                  ),
                    // decoration: const BoxDecoration(
                    //     gradient: LinearGradient(
                    //         begin: Alignment.topLeft,
                    //         end: Alignment.bottomRight,
                    //
                    //         colors: [Colors.orange, Colors.black]
                    //
                    //     )
                    // ),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,

                      // appBar: AppBar(
                      //   title: Text("NFT ECOM APPS "),
                      //   backgroundColor: Colors.transparent,
                      // ),

                      body:
                      ListView(

                        children: [

                          // Text(
                          //   'Welcome to NFT',
                          //   style: TextStyle(
                          //       fontSize: 40,
                          //       foreground: Paint()
                          //         ..shader = ui.Gradient.linear(
                          //           const Offset(0, 20),
                          //           const Offset(150, 20),
                          //           <Color>[
                          //             Colors.black,
                          //             Colors.white,
                          //           ],
                          //         )
                          //   ),
                          // ),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.orangeAccent
                                    ),

                                  ),

                                  child: InkWell(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
                                    },
                                    child: const Text('Cart',


                                      style: TextStyle( color: Colors.blueAccent,
                                        backgroundColor: Color(0xFF030303),fontSize: 20,
                                      ),
                                    ),
                                  ),

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
                          Center(
                         child: Text(
                            'Category',
                            style: TextStyle(
                                fontSize: 40,
                                foreground: Paint()
                                  ..shader = ui.Gradient.linear(
                                    const Offset(0, 20),
                                    const Offset(150, 20),
                                    <Color>[
                                      Colors.deepOrange,
                                      Colors.yellow,

                                    ],
                                  )
                            ),
                          ),
                          ),
                          const Padding(padding: EdgeInsets.all(10)),
                          SizedBox(
                            height: 300,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                              const Text(
                                'NFT-ARTS',


                                style: TextStyle( color: Colors.white,fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                ),
                              ),
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black
                                      ),

                                    ),
                                    child: Container(child: ConstrainedBox(
                                        constraints: BoxConstraints.expand(),
                                        child: IconButton(

                                          icon: Image.asset('assets/images/NFTARTS.png'),
                                          iconSize: 50,
                                          onPressed: (

                                              ) {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>product()));},
                                        )
                                      // child: InkWell(
                                      //
                                      //    // onTap: ,
                                      //     child: Image.asset('assets/women.png',height: 50,
                                      //       width: 50,))

                                    )

                                    ),
                                  ),
                                  const Text(
                                    'NFT-MUSICS',


                                    style: TextStyle( color: Colors.white,fontSize: 30,
                                      fontWeight: FontWeight.bold,
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
                                    child: Container(child: ConstrainedBox(
                                        constraints: BoxConstraints.expand(),
                                        child: IconButton(

                                          icon: Image.asset('assets/images/musicnft.jpg',width: 600,height: 900,),
                                          onPressed: (

                                              ) {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>details()));},
                                        )
                                      // child: InkWell(
                                      //
                                      //    // onTap: ,
                                      //     child: Image.asset('assets/women.png',height: 50,
                                      //       width: 50,))

                                    )

                                    ),
                                  ),
                                  const Text(
                                    'NFT-IN-GAMES',


                                    style: TextStyle( color: Colors.white,fontSize: 30,
                                      fontWeight: FontWeight.bold,
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
                                    child: Container(child: ConstrainedBox(
                                        constraints: BoxConstraints.expand(),
                                        child: IconButton(

                                          icon: Image.asset('assets/images/nftgames.jpg',width: 600,height: 900,),
                                          // iconSize: 50,
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



                                ],
                              ),
                            ),
                          ),
                    // const Padding(padding: EdgeInsets.all(10)),
                    // SizedBox(
                    //   height: 300,
                    //   child: SingleChildScrollView(
                    //     scrollDirection: Axis.vertical,
                    //         child: Row(
                    //           children: [
                    //             const Text(
                    //               'NFT-ART',
                    //
                    //
                    //               style: TextStyle( color: Colors.white,fontSize: 30,
                    //               ),
                    //             ),
                    //             Container(
                    //               width: 200,
                    //               height: 200,
                    //               decoration: BoxDecoration(
                    //                 border: Border.all(
                    //                     color: Colors.orangeAccent
                    //                 ),
                    //
                    //               ),
                    //
                    //               child: Container(
                    //
                    //                 child: ConstrainedBox(
                    //                   constraints: BoxConstraints.expand(),
                    //
                    //                    child: IconButton(
                    //
                    //                      icon: Image.asset('assets/images/NFTARTS.png'),
                    //                      iconSize: 50,
                    //                      onPressed: (
                    //
                    //                          ) {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsScreen()));},
                    //                    ),
                    //
                    //                   ),
                    //
                    //                 // child: InkWell(
                    //                 //
                    //                 //    // onTap: ,
                    //                 //     child: Image.asset('assets/women.png',height: 50,
                    //                 //       width: 50,))
                    //
                    //
                    //
                    //       ),
                    //
                    //
                    //             ),
                    //             const Text(
                    //               'NFT-MUSIC',
                    //
                    //
                    //               style: TextStyle( color: Colors.white,fontSize: 30,
                    //               ),
                    //             ),
                    //             const Padding(padding: EdgeInsets.all(10)),
                    //             Container(
                    //               width: 200,
                    //               height: 200,
                    //               decoration: BoxDecoration(
                    //                 border: Border.all(
                    //                     color: Colors.orangeAccent
                    //                 ),
                    //
                    //               ),
                    //               child: Container(child: ConstrainedBox(
                    //                 constraints: BoxConstraints.expand(),
                    //                 child: IconButton(
                    //
                    //                   icon: Image.asset('assets/images/musicnft.jpg',width: 600,height: 900,),
                    //                  // iconSize: 50,
                    //                   onPressed: (
                    //
                    //                       ) {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Body()));},
                    //                 ),
                    //
                    //
                    //                 // child: InkWell(
                    //                 //
                    //                 //    // onTap: ,
                    //                 //     child: Image.asset('assets/women.png',height: 50,
                    //                 //       width: 50,))
                    //
                    //               ),
                    //
                    //               ),
                    //             ),
                    //             const Text(
                    //               'NFT-In-Games',
                    //
                    //
                    //               style: TextStyle( color: Colors.white,fontSize: 30,
                    //               ),
                    //             ),
                    //             const Padding(padding: EdgeInsets.all(10)),
                    //             Container(
                    //               width: 200,
                    //               height: 200,
                    //               decoration: BoxDecoration(
                    //                 border: Border.all(
                    //                     color: Colors.orangeAccent
                    //                 ),
                    //
                    //               ),
                    //               child: Container(child: ConstrainedBox(
                    //                 constraints: BoxConstraints.expand(),
                    //                 child: IconButton(
                    //
                    //                   icon: Image.asset('assets/images/nftgames.jpg',width: 600,height: 900,),
                    //                   // iconSize: 50,
                    //                   onPressed: (
                    //
                    //                       ) {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Body()));},
                    //                 ),
                    //
                    //
                    //                 // child: InkWell(
                    //                 //
                    //                 //    // onTap: ,
                    //                 //     child: Image.asset('assets/women.png',height: 50,
                    //                 //       width: 50,))
                    //
                    //               ),
                    //
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    // ),
                    //       const Padding(padding: EdgeInsets.all(10)),
                    //       SingleChildScrollView(
                    //         scrollDirection: Axis.horizontal,
                    //         child: Row(
                    //           children: [
                    //             Container(
                    //               width: 200,
                    //               height: 200,
                    //               decoration: BoxDecoration(
                    //                 border: Border.all(
                    //                     color: Colors.black
                    //                 ),
                    //
                    //               ),
                    //               child: Container(child: ConstrainedBox(
                    //                   constraints: BoxConstraints.expand(),
                    //                   child: IconButton(
                    //
                    //                     icon: Image.asset('assets/images/addproduct.jpg'),
                    //                     iconSize: 50,
                    //                     onPressed: (
                    //
                    //                         ) {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Body()));},
                    //                   )
                    //                 // child: InkWell(
                    //                 //
                    //                 //    // onTap: ,
                    //                 //     child: Image.asset('assets/women.png',height: 50,
                    //                 //       width: 50,))
                    //
                    //               )
                    //
                    //               ),
                    //
                    //             ),
                    //             const Padding(padding: EdgeInsets.all(10)),
                    //             Container(
                    //               width: 200,
                    //               height: 200,
                    //               decoration: BoxDecoration(
                    //                 border: Border.all(
                    //                     color: Colors.black
                    //                 ),
                    //
                    //               ),
                    //               child: Container(child: ConstrainedBox(
                    //                   constraints: BoxConstraints.expand(),
                    //                   child: IconButton(
                    //
                    //                     icon: Image.asset('assets/images/addproduct.jpg'),
                    //                     iconSize: 50,
                    //                     onPressed: (
                    //
                    //                         ) {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Body()));},
                    //                   )
                    //                 // child: InkWell(
                    //                 //
                    //                 //    // onTap: ,
                    //                 //     child: Image.asset('assets/women.png',height: 50,
                    //                 //       width: 50,))
                    //
                    //               )
                    //
                    //               ),
                    //             ),
                    //             const Padding(padding: EdgeInsets.all(10)),
                    //             Container(
                    //               width: 200,
                    //               height: 200,
                    //               decoration: BoxDecoration(
                    //                 border: Border.all(
                    //                     color: Colors.black
                    //                 ),
                    //
                    //               ),
                    //               child: Container(child: ConstrainedBox(
                    //                   constraints: BoxConstraints.expand(),
                    //                   child: IconButton(
                    //
                    //                     icon: Image.asset('assets/images/addproduct.jpg'),
                    //                     iconSize: 50,
                    //                     onPressed: (
                    //
                    //                         ) {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Body()));},
                    //                   )
                    //                 // child: InkWell(
                    //                 //
                    //                 //    // onTap: ,
                    //                 //     child: Image.asset('assets/women.png',height: 50,
                    //                 //       width: 50,))
                    //
                    //               )
                    //
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       const Padding(padding: EdgeInsets.all(10)),
                    //       SizedBox(
                    //         height: 300,
                    //         child: SingleChildScrollView(
                    //           scrollDirection: Axis.vertical,
                    //           child: Column(
                    //             children: [
                    //               Container(
                    //                 height: 200,
                    //                 decoration: BoxDecoration(
                    //                   border: Border.all(
                    //                       color: Colors.black
                    //                   ),
                    //
                    //                 ),
                    //                 child: Container(child: ConstrainedBox(
                    //                     constraints: BoxConstraints.expand(),
                    //                     child: IconButton(
                    //
                    //                       icon: Image.network('https://miro.medium.com/max/1400/1*SNOwGBmvP12qQA-NA4FXmg.gif'),
                    //                       iconSize: 50,
                    //                       onPressed: (
                    //
                    //                           ) {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Body()));},
                    //                     )
                    //                   // child: InkWell(
                    //                   //
                    //                   //    // onTap: ,
                    //                   //     child: Image.asset('assets/women.png',height: 50,
                    //                   //       width: 50,))
                    //
                    //                 )
                    //
                    //                 ),
                    //               ),
                    //               const Padding(padding: EdgeInsets.all(10)),
                    //               Container(
                    //
                    //                 height: 200,
                    //                 decoration: BoxDecoration(
                    //
                    //                   border: Border.all(
                    //                       color: Colors.black
                    //
                    //                   ),
                    //
                    //                 ),
                    //                 child: Container(child: ConstrainedBox(
                    //                     constraints: BoxConstraints.expand(),
                    //                     child: IconButton(
                    //
                    //                       icon: Image.asset('assets/images/addproduct.jpg'),
                    //                       iconSize: 50,
                    //                       onPressed: (
                    //
                    //                           ) {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Body()));},
                    //                     )
                    //                   // child: InkWell(
                    //                   //
                    //                   //    // onTap: ,
                    //                   //     child: Image.asset('assets/women.png',height: 50,
                    //                   //       width: 50,))
                    //
                    //                 )
                    //
                    //                 ),
                    //               ),
                    //               const Padding(padding: EdgeInsets.all(10)),
                    //               Container(
                    //                 height: 200,
                    //                 decoration: BoxDecoration(
                    //                   border: Border.all(
                    //                       color: Colors.black
                    //                   ),
                    //
                    //                 ),
                    //                 child: Container(child: ConstrainedBox(
                    //                     constraints: BoxConstraints.expand(),
                    //                     child: IconButton(
                    //
                    //                       icon: Image.asset('assets/images/addproduct.jpg'),
                    //                       iconSize: 50,
                    //                       onPressed: (
                    //
                    //                           ) {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Body()));},
                    //                     )
                    //                   // child: InkWell(
                    //                   //
                    //                   //    // onTap: ,
                    //                   //     child: Image.asset('assets/women.png',height: 50,
                    //                   //       width: 50,))
                    //
                    //                 )
                    //
                    //                 ),
                    //               ),
                    //
                    //
                    //
                    //             ],
                    //           ),
                    //         ),
                    //       )
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
