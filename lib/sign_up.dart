import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:finalassign/Input%20Format/ic_formatter.dart';
import 'package:finalassign/login.dart';
import 'package:finalassign/postApi/web1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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

  @override
  Widget build(BuildContext context) {
    String regdate = DateFormat('d MMM y').format(now);
    return Scaffold(
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
                  fontWeight: FontWeight.bold,
                  fontSize: 20
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
                    borderRadius: BorderRadius.circular(5)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  labelText: 'Username'
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: password,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    labelText: 'password'
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: confirm_password,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    labelText: 'confirm password'
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
                        borderRadius: BorderRadius.circular(5)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    labelText: 'email'
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  ICNumberFormatter(),
                  LengthLimitingTextInputFormatter(
                      14),
                ],
                controller: ic,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    labelText: 'ic'
                ),
              ),
            ),
            Center(
              child: Text("Today date "+ regdate,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Login()));
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
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
