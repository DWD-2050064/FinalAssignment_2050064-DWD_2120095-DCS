import 'dart:convert';

import 'package:finalassign/postApi/web3.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  TextEditingController total_payment = TextEditingController();
  String bank = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            DropdownButtonFormField(
              hint: const Text("FPX"),
              value: bank,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              onChanged: (String? newValue) {
                setState(() {
                  bank = newValue!;
                });
              },
              items: <String>['','Affin Bank', 'Alliance Bank', 'AmBank', 'Bank Islam',
                'Bank Rakyat', 'Bank Muamalat', 'BSN', 'CIMB Bank', 'Hong Leong Bank', 'HSBC',
                'Kuwait Finance House Bank','Maybank 2E','Maybank','OCBC Bank', 'Public Bank',
                'RHB Bank','Standard Chartered','UOB']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Column(
              children: [
                Container(
                  child: Text('Total Payment')
                ),
              ],
            ),
            TextButton(
                onPressed: ()async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.getString("customer_id");
                  var response = await APayment.apayment(bank,total_payment.text,'customer_id');
                  var obj = jsonDecode(response);
                  if(obj['code'] != 'error') {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ()));
                  };
                },
                child: Text('Make Payment')
            )
          ],
        ),
      ),
    );
  }
}
