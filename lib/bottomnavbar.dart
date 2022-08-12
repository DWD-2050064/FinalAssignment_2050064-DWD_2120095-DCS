import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: EdgeInsets.only(top: 5, bottom: 30),
      color: Color.fromRGBO(185, 180, 180, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: Icon(
                Icons.home,
                size: 44,
              ),
          ),
          IconButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/sign_in');
              },
              icon: Icon(
                Icons.person,
                size: 44,
              )
          ),
          IconButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/sign_in');
              },
              icon: Icon(
                Icons.person,
                size: 44,
              )
          ),
          IconButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/sign_in');
              },
              icon: Icon(
                Icons.person,
                size: 44,
              )
          ),
        ],
      ),
    );
  }
}
