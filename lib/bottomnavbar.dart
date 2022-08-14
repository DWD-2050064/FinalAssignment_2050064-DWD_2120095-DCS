import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: Icon(
              CupertinoIcons.home,
              size: 30,
              color: Colors.white,
            ),
          ),
          IconButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/sign_in');
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