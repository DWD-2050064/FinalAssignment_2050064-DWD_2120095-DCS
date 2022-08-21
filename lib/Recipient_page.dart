import 'dart:convert';

import 'package:finalassign/postApi/web3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Input Format/phone_number.dart';

class RecipientPage extends StatefulWidget {
  const RecipientPage({Key? key}) : super(key: key);

  @override
  State<RecipientPage> createState() => _RecipientPageState();
}

class _RecipientPageState extends State<RecipientPage> {
TextEditingController full_name = TextEditingController();
TextEditingController phone_number = TextEditingController();
TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: full_name,
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
                  labelText: 'Full Name',
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
                PhoneNumberFormatter(),
                LengthLimitingTextInputFormatter(12),
              ],
              controller: phone_number,
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
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                      color: Colors.white
                  )
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: address,
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
                  labelText: 'Address',
                  labelStyle: TextStyle(
                      color: Colors.white
                  )
              ),
            ),
          ),
          TextButton(
              onPressed: () async {
                  var response = await ARecipient.ar(
                      address.text,phone_number.text,full_name.text);
                  var obj = jsonDecode(response);
                  if(obj['code'] != 'error') {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Merchant_Login()));
                    showDialog(
                        context: context,
                        builder: (_) =>
                            CupertinoAlertDialog(
                              title: Text('Insert Sucessfully'),
                            )
                    ).then((value) {
                      setState(() {
                        full_name.clear();
                        phone_number.clear();
                        address.clear();
                      });
                    });
                  }else{
                    showDialog(
                      context: context,
                      builder: (_) =>
                          CupertinoAlertDialog(
                            title: Text('Error'),
                            content: Text(obj['message']),
                          ),
                    );
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
                  'Add Recipient',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                ),
              )
          ),
        ]
      ),

    );
  }
}
