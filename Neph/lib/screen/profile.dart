import 'dart:ui';
import 'package:neph/screen/backend.dart';
import 'package:flutter/material.dart';
import 'package:neph/screen/auth.dart';
import 'package:neph/screen/Login.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //Medthod
  Widget profileicon() {
    return Container(
      child: Icon(
        Icons.account_circle,
        size: 70,
        color: Colors.grey,
      ),
      //color: Colors.cyan,
    );
  }

  Widget fullnamefield() {
    return Container(
        width: 300.0,
        child: new Theme(
          data: new ThemeData(
              primaryColor: const Color(0xff2aafaf),
              primaryColorDark: const Color(0xff2aafaf),
              hintColor: const Color(0xff2aafaf)),
          child: new TextField(
            decoration: new InputDecoration(
              enabled: false,
              filled: true,
              fillColor: Color(0xffe7f9f9),
              border: new OutlineInputBorder(
                borderSide:
                    new BorderSide(color: const Color(0xff2aafaf), width: 5.0),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(15.0)),
              ),
              labelText: user['Name'],
              labelStyle: TextStyle(color: const Color(0xff2aafaf)),
            ),
          ),
        ));
  }

  Widget fullnamebar() {
    return Container(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 30.0,
          ),
          Align(
            alignment: Alignment(-0.8, 0),
            child: Text(
              'Name',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                color: const Color(0xff2aafaf),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          fullnamefield(),
        ],
      ),
    );
  }

  Widget emailfield() {
    return Container(
        width: 300.0,
        child: new Theme(
          data: new ThemeData(
              primaryColor: const Color(0xff2aafaf),
              primaryColorDark: const Color(0xff2aafaf),
              hintColor: const Color(0xff2aafaf)),
          child: new TextField(
            decoration: new InputDecoration(
              enabled: false,
              filled: true,
              fillColor: Color(0xffe7f9f9),
              border: new OutlineInputBorder(
                borderSide:
                    new BorderSide(color: const Color(0xff2aafaf), width: 5.0),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(15.0)),
              ),
              labelText: user['Email'],
              labelStyle: TextStyle(color: const Color(0xff2aafaf)),
            ),
          ),
        ));
  }

  Widget emailbar() {
    return Container(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 30.0,
          ),
          Align(
            alignment: Alignment(-0.8, 0),
            child: Text(
              'Email',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                color: const Color(0xff2aafaf),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          emailfield(),
        ],
      ),
    );
  }

  // Widget passwordfield() {
  //   return Container(
  //       width: 300.0,
  //       child: new Theme(
  //         data: new ThemeData(
  //             primaryColor: const Color(0xff2aafaf),
  //             primaryColorDark: const Color(0xff2aafaf),
  //             hintColor: const Color(0xff2aafaf)),
  //         child: new TextField(
  //           decoration: new InputDecoration(
  //             enabled: true,
  //             filled: true,
  //             fillColor: Color(0xffe7f9f9),
  //             border: new OutlineInputBorder(
  //               borderSide:
  //                   new BorderSide(color: const Color(0xff2aafaf), width: 5.0),
  //               borderRadius:
  //                   const BorderRadius.all(const Radius.circular(15.0)),
  //             ),
  //             labelText: '*******',
  //             labelStyle: TextStyle(color: const Color(0xff2aafaf)),
  //           ),
  //         ),
  //       ));
  // }

  // Widget passwordbar() {
  //   return Container(
  //     child: Column(
  //       //crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         SizedBox(
  //           width: 30.0,
  //         ),
  //         Align(
  //           alignment: Alignment(-0.8, 0),
  //           child: Text(
  //             'Password',
  //             style: TextStyle(
  //               fontFamily: 'Arial',
  //               fontSize: 14,
  //               color: const Color(0xff2aafaf),
  //               fontWeight: FontWeight.w700,
  //             ),
  //             textAlign: TextAlign.left,
  //           ),
  //         ),
  //         SizedBox(
  //           height: 10.0,
  //         ),
  //         passwordfield(),
  //       ],
  //     ),
  //   );
  // }

  // Widget goalfield() {
  //   return Container(
  //       width: 300.0,
  //       child: new Theme(
  //         data: new ThemeData(
  //             primaryColor: const Color(0xff2aafaf),
  //             primaryColorDark: const Color(0xff2aafaf),
  //             hintColor: const Color(0xff2aafaf)),
  //         child: new TextField(
  //           decoration: new InputDecoration(
  //             enabled: true,
  //             filled: true,
  //             fillColor: Color(0xffe7f9f9),
  //             border: new OutlineInputBorder(
  //               borderSide:
  //                   new BorderSide(color: const Color(0xff2aafaf), width: 5.0),
  //               borderRadius:
  //                   const BorderRadius.all(const Radius.circular(15.0)),
  //             ),
  //             labelText: user['goal'],
  //             labelStyle: TextStyle(color: const Color(0xff2aafaf)),
  //           ),
  //         ),
  //       ));
  // }

  // Widget goalbar() {
  //   return Container(
  //     child: Column(
  //       //crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         SizedBox(
  //           width: 30.0,
  //         ),
  //         Align(
  //           alignment: Alignment(-0.8, 0),
  //           child: Text(
  //             'Goal',
  //             style: TextStyle(
  //               fontFamily: 'Arial',
  //               fontSize: 14,
  //               color: const Color(0xff2aafaf),
  //               fontWeight: FontWeight.w700,
  //             ),
  //             textAlign: TextAlign.left,
  //           ),
  //         ),
  //         SizedBox(
  //           height: 10.0,
  //         ),
  //         goalfield(),
  //       ],
  //     ),
  //   );
  // }

  Widget signoutButton() {
    return Container(
      width: 300,
      height: 40,
      child: RaisedButton(
          color: const Color(0xff2aafaf),
          child: Text(
            'SIGN OUT',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 16,
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
          //elevation: 5,
          onPressed: () {
            ready = false;
            signOut().then((value){
            MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context) => Login());
            Navigator.of(context).pushAndRemoveUntil(materialPageRoute,(Route<dynamic> route) => false);
            }).catchError((onError){
              print('error to signout, please try agian.');
            });
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(25.0))),
    );
  }

  Widget genderfield() {
    return Container(
        width: 300.0,
        child: new Theme(
          data: new ThemeData(
              primaryColor: const Color(0xff2aafaf),
              primaryColorDark: const Color(0xff2aafaf),
              hintColor: const Color(0xff2aafaf)),
          child: new TextField(
            decoration: new InputDecoration(
              enabled: false,
              filled: true,
              fillColor: Color(0xffe7f9f9),
              border: new OutlineInputBorder(
                borderSide:
                    new BorderSide(color: const Color(0xff2aafaf), width: 5.0),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(15.0)),
              ),
              labelText: user['Gender'],
              labelStyle: TextStyle(color: const Color(0xff2aafaf)),
            ),
          ),
        ));
  }

  Widget genderbar() {
    return Container(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 30.0,
          ),
          Align(
            alignment: Alignment(-0.8, 0),
            child: Text(
              'Gender',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                color: const Color(0xff2aafaf),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          genderfield(),
        ],
      ),
    );
  }

  Widget agefield() {
    return Container(
        width: 300.0,
        child: new Theme(
          data: new ThemeData(
              primaryColor: const Color(0xff2aafaf),
              primaryColorDark: const Color(0xff2aafaf),
              hintColor: const Color(0xff2aafaf)),
          child: new TextField(
            decoration: new InputDecoration(
              enabled: false,
              filled: true,
              fillColor: Color(0xffe7f9f9),
              border: new OutlineInputBorder(
                borderSide:
                    new BorderSide(color: const Color(0xff2aafaf), width: 5.0),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(15.0)),
              ),
              labelText: user['Age'],
              labelStyle: TextStyle(color: const Color(0xff2aafaf)),
            ),
          ),
        ));
  }

  Widget agebar() {
    return Container(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 30.0,
          ),
          Align(
            alignment: Alignment(-0.8, 0),
            child: Text(
              'Age',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                color: const Color(0xff2aafaf),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          agefield(),
        ],
      ),
    );
  }

  Widget weightfield() {
    return Container(
        width: 300.0,
        child: new Theme(
          data: new ThemeData(
              primaryColor: const Color(0xff2aafaf),
              primaryColorDark: const Color(0xff2aafaf),
              hintColor: const Color(0xff2aafaf)),
          child: new TextField(
            decoration: new InputDecoration(
              enabled: false,
              filled: true,
              fillColor: Color(0xffe7f9f9),
              border: new OutlineInputBorder(
                borderSide:
                    new BorderSide(color: const Color(0xff2aafaf), width: 5.0),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(15.0)),
              ),
              labelText: user['Weight'],
              labelStyle: TextStyle(color: const Color(0xff2aafaf)),
            ),
          ),
        ));
  }

  Widget weightbar() {
    return Container(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 30.0,
          ),
          Align(
            alignment: Alignment(-0.8, 0),
            child: Text(
              'Weight',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                color: const Color(0xff2aafaf),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          weightfield(),
        ],
      ),
    );
  }

  Widget memberfield() {
    return Container(
        width: 300.0,
        child: new Theme(
          data: new ThemeData(
              primaryColor: const Color(0xff2aafaf),
              primaryColorDark: const Color(0xff2aafaf),
              hintColor: const Color(0xff2aafaf)),
          child: new TextField(
            decoration: new InputDecoration(
              enabled: false,
              filled: true,
              fillColor: Color(0xffe7f9f9),
              border: new OutlineInputBorder(
                borderSide:
                    new BorderSide(color: const Color(0xff2aafaf), width: 5.0),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(15.0)),
              ),
              labelText: user['Member'].toString(),
              labelStyle: TextStyle(color: const Color(0xff2aafaf)),
            ),
          ),
        ));
  }

  Widget memberbar() {
    return Container(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 30.0,
          ),
          Align(
            alignment: Alignment(-0.8, 0),
            child: Text(
              'Neph member',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                color: const Color(0xff2aafaf),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          memberfield(),
        ],
      ),
    );
  }

  Widget healthfield() {
    return Container(
        width: 300.0,
        child: new Theme(
          data: new ThemeData(
              primaryColor: const Color(0xff2aafaf),
              primaryColorDark: const Color(0xff2aafaf),
              hintColor: const Color(0xff2aafaf)),
          child: new TextField(
            decoration: new InputDecoration(
              enabled: false,
              filled: true,
              fillColor: Color(0xffe7f9f9),
              border: new OutlineInputBorder(
                borderSide:
                    new BorderSide(color: const Color(0xff2aafaf), width: 5.0),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(15.0)),
              ),
              labelText: user['Health Conditions'],
              labelStyle: TextStyle(color: const Color(0xff2aafaf)),
            ),
          ),
        ));
  }

  Widget healthbar() {
    return Container(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 30.0,
          ),
          Align(
            alignment: Alignment(-0.8, 0),
            child: Text(
              'Health Conditions',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 14,
                color: const Color(0xff2aafaf),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          healthfield(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  profileicon(),
                  SizedBox(
                    height: 20.0,
                  ),
                  fullnamebar(),
                  SizedBox(
                    height: 20.0,
                  ),
                  emailbar(),
                  // SizedBox(
                  //   height: 20.0,
                  // ),
                  // passwordbar(),
                  // SizedBox(
                  //   height: 20.0,
                  // ),
                  // goalbar(),
                  SizedBox(
                    height: 20.0,
                  ),
                  genderbar(),
                  SizedBox(
                    height: 20.0,
                  ),
                  agebar(),
                  SizedBox(
                    height: 20.0,
                  ),
                  weightbar(),
                  SizedBox(
                    height: 20.0,
                  ),
                  memberbar(),
                  SizedBox(
                    height: 20.0,
                  ),
                  healthbar(),
                  SizedBox(
                    height: 20.0,
                  ),
                  signoutButton(),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ))),
        ),
      ),
    );
  }
}
