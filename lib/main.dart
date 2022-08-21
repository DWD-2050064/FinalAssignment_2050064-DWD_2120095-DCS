import 'package:finalassign/Checkout/checkout.dart';
import 'package:finalassign/Sign_in/login.dart';
import 'package:finalassign/Sign_in/merchant_login.dart';
import 'package:finalassign/Sign_in/merchant_sign_up.dart';
import 'package:finalassign/profile.dart';

import 'Sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'Sign_in/sign_up.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFT',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme: TextTheme(
          subtitle1: TextStyle(
          color: Colors.orange
          )
        )
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/sign_in': (context) => SignIn(),
        '/profile': (context) => Profile(),
        '/merchant_login': (context) => Merchant_Login(),
        '/customer_login': (context) => Login(),
        '/sign_up': (context) => Signup(),
        '/merchant_sign_up': (context) => MerchantSignup(),
        '/checkout': (context) => Checkout(),

      },
    );
  }
}
