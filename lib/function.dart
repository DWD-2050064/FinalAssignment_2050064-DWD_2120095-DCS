
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'body.dart';
import 'main.dart';



class function extends StatefulWidget {
  const function({Key? key}) : super(key: key);

  @override
  State<function> createState() => _functionState();
}

class _functionState extends State<function> {
  String title = '';
  Widget widgetForBody = MyApp();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //  // title: Text(title),
      //   actions: [
      //     InkWell(
      //       onTap: (){
      //
      //       },
      //       child: const Icon(Icons.logout,color: Colors.white,),
      //     ),
      //   ],
      // ),

      body: widgetForBody,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(label: 'MyApp',
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Body',
              icon: Icon(Icons.home))
        ],
        currentIndex: index,
        selectedItemColor: Colors.amberAccent,
        backgroundColor: Colors.white,
        selectedFontSize: 20,

        onTap: (int? i){

          index = i!;
          setState((){
            switch(index){
              case 0:
                title = "";
                widgetForBody = MyApp();
                break;
              case 1:
                title = "";
                widgetForBody = Body();
                break;
            }
          });
        },
      ),
    );

  }
}

