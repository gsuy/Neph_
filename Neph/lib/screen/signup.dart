import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neph/screen/signup2.dart';
import 'package:neph/screen/auth.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //Medthod
  final inputEmail = TextEditingController();
  final inputPass = TextEditingController();
  final confirmPass = TextEditingController();
  List<String> hint = [];

  void validation(){
    hint = [];
    if(inputEmail.text.trim() == ''){
      hint.add('Please fill your email.');
    }else if(inputEmail.text.trim().contains('@') == false && inputEmail.text.trim().contains('.') == false){
      hint.add('Your email is not correct.');
    }
    if(inputPass.text.trim() == '' || confirmPass.text.trim() == ''){
      hint.add('Please fill your password.');
    }
    if(inputPass.text.trim() != '' && confirmPass.text.trim() != '' && inputPass.text.trim() != confirmPass.text.trim()){
      hint.add('Please make sure your passwords match.');
    }

    if(inputPass.text.trim().length < 6){
      hint.add('Password validation is at least 6 character');
    }

    if(hint.length != 0){
      setState(() {
        
      });
    }
  }

  Widget emailfield() {
    return Container(
        width: 300.0,
        child: new Theme(
          data: new ThemeData(
            primaryColor: Colors.white,
            primaryColorDark: Colors.white,
          ),
          child: new TextField(
            controller: inputEmail,
            decoration: new InputDecoration(
              filled: true,
              hasFloatingPlaceholder: false,
              fillColor: Colors.white,
              enabledBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3.0),
              ),
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.grey),
            ),
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
              filled: true,
              hasFloatingPlaceholder: false,
              fillColor: Colors.white,
              enabledBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3.0),
              ),
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.grey),
            ),
            obscureText: true,
          ),
        ));
  }

  Widget comfirmpasswordfield() {
    return Container(
        width: 300.0,
        child: new Theme(
          data: new ThemeData(
            primaryColor: Colors.white,
            primaryColorDark: Colors.white,
          ),
          child: new TextField(
            controller: confirmPass,
            decoration: new InputDecoration(
              hasFloatingPlaceholder: false,
              filled: true,
              fillColor: Colors.white,
              enabledBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3.0),
              ),
              labelText: 'Confirm Password',
              labelStyle: TextStyle(color: Colors.grey),
            ),
          obscureText: true,
          ),
        ));
  }

  Widget backgroundwhite() {
    return Container(
        width: 327.0,
        height: 517.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),
          color: const Color(0xc7e9e9e9),
          boxShadow: [
            BoxShadow(
              color: const Color(0x20000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            Text(
              'Create an Account',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 20,
                color: const Color(0xff394548),
              ),
              textAlign: TextAlign.left,
            ),
            // SizedBox(
            //   height: 30.0,
            // ),
            // fullnamefield(),
            SizedBox(
              height: 30.0,
            ),
            emailfield(),
            SizedBox(
              height: 30.0,
            ),
            passwordfield(),
            SizedBox(
              height: 30.0,
            ),
            comfirmpasswordfield(),
            SizedBox(
              height: 10.0,
            ),
            if(hint.length != 0) for (var i in hint) Text(i,style: TextStyle(fontFamily: "Poppins", color: Colors.red)),
            SizedBox(
              height: 10.0,
            ),
            continueButton()
          ],
        )));
  }

  Widget continueButton() {
    return Container(
      width: 250.0,
      height: 40,
      child: RaisedButton(
          color: const Color(0xff394548),
          child: Text(
            'CONTINUE',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 20,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.left,
          ),
          onPressed: () {
              validation();
              if(hint.length == 0){
                email = inputEmail.text.trim();
                pass = inputPass.text.trim();
                register().then((value){
                  MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context) => Signup2());
                  Navigator.of(context).push(materialPageRoute);
                }).catchError((onError){
                  hint.add('Something was wrong, please try again.');
                  setState(() {

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
      resizeToAvoidBottomPadding: false,
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
                    backgroundwhite(),
                    SizedBox(
                      height: 30.0,
                    ),
                  ],
                ))),
          ),
        ),
      ),
    );
  }
}
