import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot){
        if(snapshot.hasData){
          if(snapshot.data!.getString('merchant_id') != null) {
            /// Merchant
            return Container(
              height: 60,
              padding: EdgeInsets.only(top: 5, bottom: 30),
              color: Color.fromRGBO(0, 0, 0, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                    },
                    icon: Icon(
                      CupertinoIcons.home,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                      onPressed: ()async{
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/category', (Route<dynamic> route) => false);
                      },
                      icon: Icon(
                        CupertinoIcons.plus,
                        size: 30,
                        color: Colors.white,
                      )
                  ),
                  IconButton(
                      onPressed: ()async{
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil('/profile', (Route<dynamic> route) => false);

                      },
                      icon: Icon(
                        CupertinoIcons.person,
                        size: 30,
                        color: Colors.white,
                      )
                  ),
                ],
              ),
            );
          }else if(snapshot.data!.getString('customer_id') != null) {
            /// Customer
            return Container(
              height: 60,
              padding: EdgeInsets.only(top: 5, bottom: 30),
              color: Color.fromRGBO(0, 0, 0, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                    },
                    icon: Icon(
                      CupertinoIcons.home,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                      onPressed: ()async{
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        if(prefs.getString('customer_id') != null && prefs.getString('customer_id') != ""){
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil('/profile', (Route<dynamic> route) => false);
                        }else{
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil('/sign_in', (Route<dynamic> route) => false);
                        }
                      },
                      icon: Icon(
                        CupertinoIcons.person,
                        size: 30,
                        color: Colors.white,
                      )
                  ),
                ],
              ),
            );
          }else {
            /// No account
            return Container(
              height: 60,
              padding: EdgeInsets.only(top: 5, bottom: 30),
              color: Color.fromRGBO(0, 0, 0, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                    },
                    icon: Icon(
                      CupertinoIcons.home,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                      onPressed: ()async{
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil('/sign_in', (Route<dynamic> route) => false);
                      },
                      icon: Icon(
                        CupertinoIcons.person,
                        size: 30,
                        color: Colors.white,
                      )
                  ),
                ],
              ),
            );
          }
          }else{
          return Container();
        }
      },
    );
  }
}