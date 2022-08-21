import 'dart:convert';
import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:finalassign/Input%20Format/phone_number.dart';
import 'package:finalassign/Sign_in/merchant_login.dart';
import 'package:finalassign/postApi/web1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../bottomnavbar.dart';

class MerchantSignup extends StatefulWidget {
  const MerchantSignup({Key? key}) : super(key: key);

  @override
  State<MerchantSignup> createState() => _MerchantSignupState();
}

class _MerchantSignupState extends State<MerchantSignup> {
  DateTime now = DateTime.now();
  // bool visible = false;
  String? filePath;
  String? imageExt;
  ImagePicker picker = ImagePicker();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController companyName = TextEditingController();
  bool passwordVisible = false;
  bool passwordVisible1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      backgroundColor: CupertinoColors.black,
      body: Container(
        padding: EdgeInsets.only(left: 10, top: 20),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: const Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40
                ),
              ),
            ),
            if(filePath == null)
            Container(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: (){
                  showMaterialModalBottomSheet(
                      expand: false,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => Container(
                          decoration: const BoxDecoration(color: Colors.black),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              ListTile(
                                leading: const Icon(Icons.browse_gallery,color: Colors.orange,),
                                onTap: ()async{
                                  XFile? image = await picker.pickImage(source: ImageSource.gallery);
                                  setState(() {
                                    filePath = image!.path;
                                    imageExt = image.path.split('.').last;
                                  });
                                },
                                title: const Text('Upload from gallery',style: TextStyle(color: Colors.white),),
                              ),
                              const Divider(),
                              ListTile(
                                leading: const Icon(Icons.camera,color: Colors.orange,),
                                onTap: ()async{
                                  XFile? image = await picker.pickImage(source: ImageSource.camera);
                                  setState(() {
                                    filePath = image!.path;
                                    imageExt = image.path.split('.').last;
                                  });
                                },
                                title: const Text('Upload from camera',style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          )
                      )
                  );
                },
                child: const Icon(Icons.add_circle_outline_rounded, color: Colors.black,),
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(10)
                ),
              ),
            ),
            if(filePath != null)
              Padding(padding: EdgeInsets.only(left: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 200,
                        child: Image.file(File(filePath!)),
                      ),
                    TextButton(
                      onPressed: (){
                        showMaterialModalBottomSheet(
                            expand: false,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) => Container(
                                decoration: const BoxDecoration(color: Colors.black),
                                child: ListView(
                                  padding:  EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.browse_gallery,color: Colors.orange,),
                                      onTap: ()async{
                                        XFile? image = await picker.pickImage(source: ImageSource.gallery);
                                        setState(() {
                                          filePath = image!.path;
                                          imageExt = image.path.split('.').last;
                                        });
                                      },
                                      title: const Text('Upload from gallery',style: TextStyle(color: Colors.white),),
                                    ),
                                    const Divider(),
                                    ListTile(
                                      leading: const Icon(Icons.camera,color: Colors.orange,),
                                      onTap: ()async{
                                        XFile? image = await picker.pickImage(source: ImageSource.camera);
                                        setState(() {
                                          filePath = image!.path;
                                          imageExt = image.path.split('.').last;
                                        });
                                      },
                                      title: const Text('Upload from camera',style: TextStyle(color: Colors.white),),
                                    ),
                                  ],
                                )
                            )
                        );
                      },
                      child: const Icon(Icons.refresh, color: Colors.orange,),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero
                      ),
                    ),
                  ],
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
                obscureText: !passwordVisible,
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
                    labelText: 'Password',
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
                obscureText: !passwordVisible1,
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
                    labelText: 'Confirm Password',
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
                    labelText: 'Email',
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
                controller: phoneNumber,
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
                controller: description,
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
                    labelText: 'Description',
                    labelStyle: TextStyle(
                        color: Colors.white
                    )
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: companyName,
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
                    labelText: 'Company Name',
                    labelStyle: TextStyle(
                        color: Colors.white
                    )
                ),
              ),
            ),
            TextButton(
                onPressed: () async {
                  if(confirm_password.text == password.text){


                    var response = await RMerchant.rm(
                        filePath,imageExt,username.text,password.text,email.text,phoneNumber.text,description.text,companyName.text);
                    EasyLoading.show(status : 'Uploading');
                    var obj = jsonDecode(response);
                    if(obj['code'] != 'error') {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/merchant_login', (Route<dynamic> route) => false);
                      EasyLoading.dismiss();
                      showDialog(
                          context: context,
                          builder: (_) =>
                              CupertinoAlertDialog(
                                title: Text('Register Sucessfully'),
                              )
                      ).then((value) {
                        setState(() {
                          filePath = null;
                          imageExt = null;
                          username.clear();
                          password.clear();
                          email.clear();
                          phoneNumber.clear();
                          description.clear();
                          companyName.clear();
                        });
                      });
                    }else{
                      EasyLoading.dismiss();
                      showDialog(
                        context: context,
                        builder: (_) =>
                            CupertinoAlertDialog(
                              title: Text('Error'),
                              content: Text(obj['message']),
                            ),
                      );
                    }
                  }else{
                    EasyLoading.dismiss();
                    showDialog(
                      context: context,
                      builder: (_) =>
                          CupertinoAlertDialog(
                            title: Text('Error'),
                            content: Text('Incorrect comfirm password'),
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
