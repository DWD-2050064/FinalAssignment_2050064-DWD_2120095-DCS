import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.only(top: 5, bottom: 30),
      color: Color.fromRGBO(0, 0, 0, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            onPressed: (){
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/checkout', (Route<dynamic> route) => false);
            },
            icon: Icon(
              CupertinoIcons.home,
              size: 30,
              color: Colors.white,
            ),
          ),
          IconButton(
              onPressed: ()async{
                 SharedPreferences prefs = await SharedPreferences.getInstance();
                 if(prefs.getString('customer_id') != null && prefs.getString('customer_id') != ""){
                   Navigator.of(context)
                       .pushNamedAndRemoveUntil('/profile', (Route<dynamic> route) => false);
                 }else if(prefs.getString('merchant_id') != null && prefs.getString('merchant_id') != ""){
                   Navigator.of(context)
                     .pushNamedAndRemoveUntil('/profile', (Route<dynamic> route) => false);
                 }else{
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/sign_in', (Route<dynamic> route) => false);
                 }
              },
              icon: Icon(
                CupertinoIcons.person,
                size: 30,
                color: Colors.white,
              )
          ),
        ],
      ),
    );
  }
}