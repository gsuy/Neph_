import 'package:flutter/material.dart';
import 'package:neph/screen/signin.dart';
import 'package:neph/screen/signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Medthod

  Widget showLogo() {
    return Container(
      width: 150.0,
      height: 150.0,
      child: Image.asset('images/CMULOGO.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Neph',
      style: TextStyle(
        fontFamily: 'Trebuchet MS',
        fontSize: 77,
        color: const Color(0xffffffff),
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget signinButton() {
    return Container(
      width: 250,
      height: 40,
      child: RaisedButton(
          color: Colors.white,
          child: Text('Sign In',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 20,
                color: const Color(0xff4f6165),
              ),
              textAlign: TextAlign.left),
          onPressed: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => Signin());
            Navigator.of(context).push(materialPageRoute);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }

  Widget signupButton() {
    return Container(
      width: 250,
      height: 40,
      child: RaisedButton(
          color: const Color(0xff4f6165),
          child: Text(
            'Create Account',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 20,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.left,
          ),
          onPressed: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => Signup());
            Navigator.of(context).push(materialPageRoute);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        signinButton(),
        SizedBox(
          width: 5.0,
        ),
        signupButton()
      ],
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
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            //showLogo(),
            SizedBox(
              height: 15.0,
            ),
            showAppName(),
            SizedBox(
              height: 100.0,
            ),
            signinButton(),
            SizedBox(
              height: 10.0,
            ),
            signupButton()
          ],
        )),
      )),
    );
  }
}
