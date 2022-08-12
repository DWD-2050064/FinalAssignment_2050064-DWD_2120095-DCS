import 'dart:convert';

import 'package:finalassign/home.dart';
import 'package:finalassign/postApi/web1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    color: Colors.blue,
                    fontSize: 22
                  ),
                )
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: username,
                  cursorColor: Colors.pink,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.pink
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.pink
                          )
                      ),
                      labelText: 'Username'
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
                  fillColor: Colors.pink,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.pink
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.pink
                    )
                  ),
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    color: Colors.pink,
                      onPressed: (){
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      icon: Icon(
                          passwordVisible ? Icons.visibility: Icons.visibility_off
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
                  child: Text('Login')
              )
            ],
          ),
        )
    );
  }
}
