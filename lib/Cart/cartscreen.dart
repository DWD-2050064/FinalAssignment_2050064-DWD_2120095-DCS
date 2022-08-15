import 'package:flutter/material.dart';


import 'Cart.dart';
import 'cbody.dart';




class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: buildAppBar(context),
      
      body: Body(),
     // bottomNavigationBar: CheckoutCard(),
    );

  }

  AppBar buildAppBar(BuildContext context) {

    return AppBar(
      backgroundColor: Color(0xFFFF5C09),
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.orange),
          ),
          Text(
            "${demoCarts.length} items",
            style:
              TextStyle (color: Colors.deepPurpleAccent),
           // Theme.of(context).textTheme.caption,


          ),
        ],
      ),
    );
  }
}