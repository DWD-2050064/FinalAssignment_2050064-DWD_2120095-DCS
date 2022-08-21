import '../bottomnavbar.dart';
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
        image: AssetImage("assets/images/img_2.png"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.black,
            bottomNavigationBar: BottomNavBar(),
          body: Container(
            padding: EdgeInsets.fromLTRB(10,100,10,0),
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
                  Container(
                    padding: EdgeInsets.all(10),
                    child: const Text(
                      'Sign In',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Welcome to join as our customer.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed('/customer_login');
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
                        'Customer Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
                    )
                  ),
                  const Divider(
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.orange,
                    height: 100,
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Welcome one of our Merchant.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed('/merchant_login');
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
                          'Merchant Login',
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
            )
          )
        )
    );
  }
}
