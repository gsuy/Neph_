import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neph/screen/home.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  //Medthod

  Widget usernamefield() {
    return Container(
        width: 300.0,
        child: new Theme(
          data: new ThemeData(
            primaryColor: Colors.white,
            primaryColorDark: Colors.white,
          ),
          child: new TextField(
              decoration: new InputDecoration(
                enabledBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3.0),
                ),
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.white,
                ),
              ),
              style: new TextStyle(fontFamily: "Poppins", color: Colors.white)),
        ));
  }

  Widget passwordfield() {
    return Container(
        width: 300.0,
        child: new Theme(
          data: new ThemeData(
            primaryColor: Colors.white,
            primaryColorDark: Colors.white,
          ),
          child: new TextField(
              decoration: new InputDecoration(
                enabledBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3.0),
                ),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: const Icon(
                  Icons.https,
                  color: Colors.white,
                ),
              ),
              style: new TextStyle(fontFamily: "Poppins", color: Colors.white)),
        ));
  }

  Widget signinButton() {
    return Container(
      width: 250.0,
      height: 40,
      child: RaisedButton(
          color: const Color(0xffffffff),
          child: Text(
            'SIGN IN',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 20,
              color: const Color(0xff394548),
            ),
            textAlign: TextAlign.left,
          ),
          onPressed: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => Home());
            Navigator.of(context).push(materialPageRoute);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
          )),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: new Container(
                decoration:
                    new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                    ),
                    usernamefield(),
                    SizedBox(
                      height: 15.0,
                    ),
                    passwordfield(),
                    SizedBox(
                      height: 50.0,
                    ),
                    signinButton()
                  ],
                ))),
          ),
        ),
      ),
    );
  }
}
