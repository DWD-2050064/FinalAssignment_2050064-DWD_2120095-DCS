import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:convert';
import 'function.dart';
void main() {
  runApp(
      MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              color: const Color(0xFF263238),
            )),
        // theme: new ThemeData(scaffoldBackgroundColor: const Color(w)),
        home: const MyTest(),
      )
  );
}

class MyTest extends StatefulWidget {
  const MyTest({Key? key}) : super(key: key);

  @override

  State<MyTest> createState() => _MyTestState();
}

class _MyTestState extends State<MyTest> {
  // TextEditingController username = TextEditingController();
  // TextEditingController password = TextEditingController();
  @override

  Widget build(BuildContext context) {



    return Scaffold(


      body:
      Center(

        child:

        Container(

          height:MediaQuery.of(context).size.height / 2.5,
          width: MediaQuery.of(context).size.width / 1.1,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0)),
          ),
          child:ListView(
            children: [
              Image.asset('assets/logo2.png',height: 50,width: 50,),
              TextFormField(
            //    controller: username,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Username',
                  prefixIcon: Icon(Icons.account_box),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.grey),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),

              TextFormField(
          //      controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),

                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.grey),
                  ),
                ),
              ),

              TextButton(
                onPressed: () async{
                 // var response = await take.Apitake(username.text,password.text);
              //    var obj = jsonDecode(response);
                 // if(obj['code'] == "success"){

                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>function()));

                 // }

                },


                child: const Text('Done'),
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.all(10)

                ),
              ),




            ],


          ),

        ),


      ),

    );
  }
}

