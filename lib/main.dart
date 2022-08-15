import 'Sign_in/sign_in.dart';
import 'package:flutter/material.dart';
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
      initialRoute: '/  ',
      routes: {
        '/': (context) => Home(),
        '/sign_in': (context) => SignIn(),
      },
    );
  }
}
