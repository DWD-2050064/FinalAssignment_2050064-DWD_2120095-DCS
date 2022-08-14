import 'dart:convert';

import 'package:finalassign/home.dart';
import 'package:finalassign/postApi/web1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bottomnavbar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: BottomNavBar(),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 150, 10, 0),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40
                  ),
                )
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: username,
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.orange
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.orange
                          )
                      ),
                      labelText: 'Username',
                    labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: password,
                obscureText: !passwordVisible,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: Colors.orange,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.orange
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.orange
                    )
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),
                  suffixIcon: IconButton(
                    color: Colors.orange,
                      onPressed: (){
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      icon: Icon(
                          passwordVisible ? Icons.visibility: Icons.visibility_off,
                        color: Colors.white,
                      )
                  ),
                ),
              ),
              ),
              TextButton(
                  onPressed: () async {
                    var response = await LCustomer.lc(
                        username.text,password.text);
                    var obj = jsonDecode(response);
                    if(obj['code'] != 'error') {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Home()));
                      showDialog(
                          context: context,
                          builder: (_) =>
                              CupertinoAlertDialog(
                                title: Text('Insert Sucessfully'),
                              )
                      ).then((value) {
                        setState(() {
                          username.clear();
                          password.clear();
                        });
                      });
                    }
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                  )
              )
            ],
          ),
        )
    );
  }
}
