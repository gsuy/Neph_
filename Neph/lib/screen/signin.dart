import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neph/screen/home.dart';
import 'package:neph/screen/auth.dart';

class Signin extends StatefulWidget {
  final bool isFail;
  Signin(this.isFail);
  @override
  _SigninState createState() => _SigninState(this.isFail);
}

class _SigninState extends State<Signin> {
  bool isFail;
  _SigninState(this.isFail);
  final inputEmail = TextEditingController();
  final inputPass = TextEditingController();
  List<String> hint = [];
  //Medthod
  

  Widget usernamefield() {
    return Container(
        width: 300.0,
        child: new Theme(
          data: new ThemeData(
            primaryColor: Colors.white,
            primaryColorDark: Colors.white,
          ),
          // child: TextFormField
          child: TextFormField(
              controller: inputEmail,
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
              style: new TextStyle(fontFamily: "Poppins", color: Colors.white)
              
              ),
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
              controller: inputPass,
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
              obscureText: true,
              style: new TextStyle(fontFamily: "Poppins", color: Colors.white)),
        ));
  }
  void validation(){
    hint = [];
    if(inputEmail.text.trim() == ''){
      hint.add('Please fill your email.');
    }else if(inputEmail.text.trim().contains('@') == false && inputEmail.text.trim().contains('.') == false){
      hint.add('Your email is not correct.');
    }
    if(inputPass.text.trim() == ''){
      hint.add('Please fill your password.');
    }
    if(hint.length != 0){
      setState(() {
        
      });
    }
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
              validation();
              if(hint.length == 0){
                email = inputEmail.text.trim();
                pass = inputPass.text.trim();
                signIn().then((value){
                  MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context) => Home());
                  Navigator.of(context).pushAndRemoveUntil(materialPageRoute,(Route<dynamic> route) => false);
                }).catchError((onError){
                  setState(() {
                    isFail = true;
                  });
                });
              }
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
                      height: 20.0,
                      ),
                    if(isFail == true)(
                      Text('Something went wrong, Please try again.',style: TextStyle(fontFamily: "Poppins", color: Colors.red))
                    ),
                    if(hint.length != 0) for (var i in hint) Text(i,style: TextStyle(fontFamily: "Poppins", color: Colors.red)),
                    SizedBox(
                      height: 20.0,
                    ),
                    signinButton(),
                  ],
                ))),
          ),
        ),
      ),
    );
  }
}
