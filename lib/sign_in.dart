import 'package:finalassign/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'bottomnavbar.dart';
import 'login.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/img.png"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
            bottomNavigationBar: BottomNavBar(),
          body: Container(
            padding: EdgeInsets.fromLTRB(10,200,10,0),
            child: Container(
              padding: EdgeInsets.all(10),
              height: 500,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ListView(
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Login()));
                    },
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                    )
                  ),
                  TextButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Signup()));
                      },
                      child: Container(
                        width: 300,
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
                  Container(
                    padding: EdgeInsets.only(left: 90),
                      child: Row(
                        children: [
                          Text(
                            'are u a Merchant?',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          TextButton(
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Login()));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  'Merchant',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.blue
                                  ),
                                ),
                              )
                          ),
                        ],
                      )
                  )
                ],
              ),
            )
          )
        )
    );
  }
}
