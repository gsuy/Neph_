import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neph/screen/home.dart';
import 'package:neph/screen/auth.dart';

class Signup2 extends StatefulWidget {
  @override
  _Signup2State createState() => _Signup2State();
}

bool _value = false;
bool _value2 = false;
List<String> hint = [];

class _Signup2State extends State<Signup2> {
  //Medthod
  final inputName = TextEditingController();
  // final inputGender = TextEditingController();
  String inputGender = '';
  final inputAge = TextEditingController();
  final inputWeight = TextEditingController();
  final inputHeight = TextEditingController();
  // final inputGoal = TextEditingController();
  final inputHealthCon = TextEditingController();

  void validation(){
    hint = [];

    if(inputAge.text.trim() == ''){
      hint.add('Please fill your age.');
    }else{
      try { int.parse(inputAge.text.trim()); } catch (e) { hint.add('Age fill must be integer.'); }
    }

    if(inputWeight.text.trim() == ''){
      hint.add('Please fill your weight.');
    }else{
      try { int.parse(inputWeight.text.trim()); } catch (e) { hint.add('Weight fill must be integer.'); }
    }

    if(inputHeight.text.trim() == ''){
      hint.add('Please fill your height.');
    }else{
      try { int.parse(inputHeight.text.trim()); } catch (e) { hint.add('Height fill must be integer.'); }
    }

    if(_value == false && _value2 == false){
      hint.add('Please select your gender.');
    }else{
       _value ? inputGender = 'Female': inputGender = 'Male';
    }

    if(hint.length != 0){
      setState(() {
        
      });
    }
  }

  Widget fullnamefield() {
    return Container(
        width: 300.0,
        height: 40,
        child: new Theme(
          data: new ThemeData(
            primaryColor: Colors.white,
            primaryColorDark: Colors.white,
          ),
          child: new TextField(
            controller: inputName,
            decoration: new InputDecoration(
              hasFloatingPlaceholder: false,
              filled: true,
              fillColor: Colors.white,
              enabledBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3.0),
              ),
              labelText: 'Full name',
              labelStyle: TextStyle(color: Colors.grey),
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
              'Full Name',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: const Color(0xff394548),
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


  // Widget goalfield() {
  //   return Container(
  //       width: 300.0,
  //       height: 40,
  //       child: new Theme(
  //         data: new ThemeData(
  //           primaryColor: Colors.white,
  //           primaryColorDark: Colors.white,
  //         ),
  //         child: new TextField(
  //           controller: inputGoal,
  //           decoration: new InputDecoration(
  //             filled: true,
  //             fillColor: Colors.white,
  //             enabledBorder: new OutlineInputBorder(
  //                 borderSide: new BorderSide(color: Colors.white)),
  //             focusedBorder: OutlineInputBorder(
  //               borderSide: BorderSide(color: Colors.white, width: 3.0),
  //             ),
  //             labelText: 'Goal',
  //             labelStyle: TextStyle(color: Colors.grey),
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
  //               fontFamily: 'Segoe UI',
  //               fontSize: 15,
  //               color: const Color(0xff394548),
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

  Widget weightfield() {
    return Container(
        width: 300.0,
        height: 40,
        child: new Theme(
          data: new ThemeData(
            primaryColor: Colors.white,
            primaryColorDark: Colors.white,
          ),
          child: new TextField(

            controller: inputWeight,
            decoration: new InputDecoration(
              hasFloatingPlaceholder: false,
              filled: true,
              fillColor: Colors.white,
              enabledBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3.0),
              ),
              labelText: 'Weight (Kg)',
              labelStyle: TextStyle(color: Colors.grey),
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
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: const Color(0xff394548),
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

  Widget heightfield() {
    return Container(
        width: 300.0,
        height: 40,
        child: new Theme(
          data: new ThemeData(
            primaryColor: Colors.white,
            primaryColorDark: Colors.white,
          ),
          child: new TextField(
            controller: inputHeight,
            decoration: new InputDecoration(
              hasFloatingPlaceholder: false,
              filled: true,
              fillColor: Colors.white,
              enabledBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3.0),
              ),
              labelText: 'Height (cm)',
              labelStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ));
  }

  Widget heightbar() {
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
              'Height',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: const Color(0xff394548),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          heightfield(),
        ],
      ),
    );
  }

  Widget healthfield() {
    return Container(
        width: 300.0,
        height: 40.0,
        child: new Theme(
          data: new ThemeData(
            primaryColor: Colors.white,
            primaryColorDark: Colors.white,
          ),
          child: new TextField(
            controller: inputHealthCon,
            decoration: new InputDecoration(
              hasFloatingPlaceholder: false,
              filled: true,
              fillColor: Colors.white,
              enabledBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3.0),
              ),
              labelText: '',
              labelStyle: TextStyle(color: Colors.grey),
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
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: const Color(0xff394548),
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

  Widget circlebox() {
    return Container(
        child: InkWell(
      onTap: () {
        setState(() {
          _value = !_value;
          _value2 = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: _value
              ? Icon(
                  Icons.lens,
                  size: 15.0,
                  color: Colors.black,
                )
              : Icon(
                  Icons.check_box_outline_blank,
                  size: 15.0,
                  color: Colors.white,
                ),
        ),
      ),
    ));
  }

  Widget circlebox2() {
    return Container(
        child: InkWell(
      onTap: () {
        setState(() {
          _value = false;
          _value2 = !_value2;
        });
      },
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: _value2
              ? Icon(
                  Icons.lens,
                  size: 15.0,
                  color: Colors.black,
                )
              : Icon(
                  Icons.check_box_outline_blank,
                  size: 15.0,
                  color: Colors.white,
                ),
        ),
      ),
    ));
  }

  Widget agebar() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 30.0,
              ),
              Align(
                alignment: Alignment(-0.8, 0),
                child: Text(
                  'Age',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 15,
                    color: const Color(0xff394548),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              agefield(),
            ],
          ),
        ],
      ),
    );
  }

  Widget genderbar() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment(-0.8, 0),
            child: Text(
              'Gender',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: const Color(0xff394548),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 40.0,
              ),
              circlebox(),
              SizedBox(
                width: 5.0,
              ),
              Text(
                'Female',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: const Color(0xff394548),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                width: 30.0,
              ),
              circlebox2(),
              SizedBox(
                width: 5.0,
              ),
              Text(
                'Male',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: const Color(0xff394548),
                ),
                textAlign: TextAlign.left,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget agefield() {
    return Container(
        width: 45.0,
        height: 30.0,
        child: new Theme(
          data: new ThemeData(
            primaryColor: Colors.white,
            primaryColorDark: Colors.white,
          ),
          child: new TextField(
            controller: inputAge,
            decoration: new InputDecoration(
              hasFloatingPlaceholder: false,
              filled: true,
              fillColor: Colors.white,
              enabledBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white)),
              labelText: '',
              labelStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ));
  }

  Widget backgroundwhite() {
    return Container(
        width: 327.0,
        height: 700.0,
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
              height: 10.0,
            ),
            fullnamebar(),
            SizedBox(
              height: 5.0,
            ),
            genderbar(),
            SizedBox(
              height: 5.0,
            ),
            agebar(),
            SizedBox(
              height: 5.0,
            ),
            weightbar(),
            SizedBox(
              height: 5.0,
            ),
            heightbar(),
            SizedBox(
              height: 5.0,
            ),
            healthbar(),
            // SizedBox(
            //   height: 5.0,
            // ),
            // goalbar(),
            SizedBox(
              height: 5.0,
            ),
            if(hint.length != 0) for (var i in hint) Text(i,style: TextStyle(fontFamily: "Poppins", color: Colors.red)),
            SizedBox(
              height: 5.0,
            ),
            submitButton()
          ],
        )));
  }

  Widget submitButton() {
    return Container(
      width: 250.0,
      height: 40,
      child: RaisedButton(
          color: const Color(0xff394548),
          child: Text(
            'SUBMIT',
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
              createUser(inputName.text,inputAge.text.trim(),inputWeight.text.trim(),inputHeight.text.trim(),inputGender,inputHealthCon.text).then((value){
              MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context) => Home());
              Navigator.of(context).pushAndRemoveUntil(materialPageRoute,(Route<dynamic> route) => false);
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
      body: SingleChildScrollView(
        child: SafeArea(
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
      ),
    );
  }
}
