import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(

      body:
      ListView(
        children: [
        SingleChildScrollView(child: Column(
        children: [
          Row(
            children: [
              Container(
               // width: SizeConfig.screenWidth * 0.6,
                decoration: BoxDecoration(
                 // color: kSecondaryColor.with0pacity(0.1),
                  borderRadius: BorderRadius.circular(15),
      ),
                  child:TextField(
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Search Product",
                    ),
                  ),

                ),


            ],
          )
        ],
      ),
                ),
],
      ),

    );
  }
}