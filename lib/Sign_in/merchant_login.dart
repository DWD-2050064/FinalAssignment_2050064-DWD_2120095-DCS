import 'dart:convert';

import 'package:finalassign/home.dart';
import 'package:finalassign/postApi/web1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bottomnavbar.dart';

class Merchant_Login extends StatefulWidget {
  const Merchant_Login({Key? key}) : super(key: key);

  @override
  State<Merchant_Login> createState() => _Merchant_LoginState();
}

// ignore: camel_case_types
class _Merchant_LoginState extends State<Merchant_Login> {
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
                  'Merchant Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22
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
                      color: Colors.orange
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
                    color: Colors.orange
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
                    var response = await LMerchant.lmerchant(
                        username.text,password.text);
                    var obj = jsonDecode(response);
                    if(obj['code'] != 'error') {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('merchant_id', obj['merchant_id']);
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                      showDialog(
                          context: context,
                          builder: (_) => const
                              CupertinoAlertDialog(
                                title: Text('Welcome'),
                              )
                      ).then((value) {
                        setState(() {
                          username.clear();
                          password.clear();
                        });
                      });
                    }else{
                      showDialog(
                          context: context,
                          builder: (_) => const
                              CupertinoAlertDialog(
                                title: Text('Invalid User'),
                              )
                      );
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
              ),
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pushNamed('/merchant_sign_up');
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Merchant Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                      ),
                    ),
                  )
              ),
            ],
          ),
        )
    );
  }
}
