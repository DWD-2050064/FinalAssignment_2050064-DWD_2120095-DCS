import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:finalassign/Input%20Format/ic_formatter.dart';
import 'package:finalassign/Sign_in/login.dart';
import 'package:finalassign/postApi/web1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../bottomnavbar.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  DateTime now = DateTime.now();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController ic = TextEditingController();
  bool passwordVisible = false;
  bool passwordVisible1 = false;
  @override
  Widget build(BuildContext context) {
    String regdate = DateFormat('d MMM y').format(now);
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      backgroundColor: CupertinoColors.black,
      body: Container(
        padding: EdgeInsets.only(left: 10, top: 50),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: const Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 40
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: username,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange
                    ),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.orange
                      ),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    color: Colors.white
                  )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: password,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.orange
                        ),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.orange
                        ),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    labelText: 'password',
                    labelStyle: TextStyle(
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
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: confirm_password,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.orange
                        ),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.orange
                        ),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    labelText: 'confirm password',
                    labelStyle: TextStyle(
                        color: Colors.white
                    ),
                  suffixIcon: IconButton(
                      color: Colors.orange,
                      onPressed: (){
                        setState(() {
                          passwordVisible1 = !passwordVisible1;
                        });
                      },
                      icon: Icon(
                        passwordVisible1 ? Icons.visibility: Icons.visibility_off,
                        color: Colors.white,
                      )
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                validator: (email) => email != null && !EmailValidator.validate(email)
                ? 'Email a valid email'
                :null,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.orange
                        ),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.orange
                        ),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    labelText: 'email',
                    labelStyle: TextStyle(
                        color: Colors.white
                    )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  ICNumberFormatter(),
                  LengthLimitingTextInputFormatter(14),
                ],
                controller: ic,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.orange
                        ),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.orange
                        ),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    labelText: 'ic',
                    labelStyle: TextStyle(
                        color: Colors.white
                    )
                ),
              ),
            ),
            Center(
              child: Text("Today date "+ regdate,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
            TextButton(
                onPressed: () async {
                  if(confirm_password.text == password.text){
                    var response = await RCustomer.rc(
                        username.text,password.text,email.text,ic.text,regdate);
                    var obj = jsonDecode(response);
                    if(obj['code'] != 'error') {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/customer_login', (Route<dynamic> route) => false);
                      showDialog(
                          context: context,
                          builder: (_) =>
                              CupertinoAlertDialog(
                                title: Text('Register Sucessfully'),
                              )
                      ).then((value) {
                        setState(() {
                          username.clear();
                          password.clear();
                          email.clear();
                          ic.clear();
                        });
                      });
                    }else{
                      showDialog(
                        context: context,
                        builder: (_) =>
                            CupertinoAlertDialog(
                              title: Text('Error'),
                              content: Text('Incorrect comfirm password'),
                            ),
                      );
                    }
                  }
                },
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                        fontSize: 20
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
