import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:neph/screen/createtable.dart';
import 'package:neph/screen/home.dart';
import 'package:neph/screen/backend.dart';

class Createplan extends StatefulWidget{
  @override
  _CreateplanState createState() => _CreateplanState();
}

class _CreateplanState extends State<Createplan> {
  // List<String> workoutDay = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
  // List<bool> isWorkoutDay = [false,false,false,false,false,false,false]; //monday , ... , sunday
  //Medthod
  
  @override
  void initState() {
    super.initState();
    // loadData().then((value){setState(() {});});
  }

  // Future<void> loadData()async{
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //     for (var i = 0; i < 7; i++) {
  //       await firestore.collection('Users').doc('2').collection('Schedule').doc(workoutDay[i]).get().then((value) => isWorkoutDay[i] = value.get('isWorkout_Day'));
  //   }
  // }

  Widget topicName() {
    return Text(
      'Plan Schedule',
      style: TextStyle(
        fontFamily: 'Segoe UI',
        fontSize: 20,
        color: const Color(0xff394548),
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.left,
    );
  }

  Widget fullnamefield() {
    return Container(
        width: 300.0,
        child: new Theme(
          data: new ThemeData(
            primaryColor: Colors.white,
            primaryColorDark: Colors.white,
          ),
          child: new TextField(
            decoration: new InputDecoration(
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

  Widget emailfield() {
    return Container(
        width: 300.0,
        child: new Theme(
          data: new ThemeData(
            primaryColor: Colors.white,
            primaryColorDark: Colors.white,
          ),
          child: new TextField(
            decoration: new InputDecoration(
              filled: true,
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
            decoration: new InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3.0),
              ),
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.grey),
            ),
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
            decoration: new InputDecoration(
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
          ),
        ));
  }

  Widget whitebackground(String date, String month) {
    return Container(
      width: 90,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.0),
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(3, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text.rich(
          TextSpan(
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 30,
              color: const Color(0xff394548),
              height: 0.8,
            ),
            children: [
              TextSpan(
                text: date,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: month,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget whitebackground2(String day) {
    return Container(
      width: 90,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.0),
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(3, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text.rich(
          TextSpan(
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 30,
              color: const Color(0xff394548),
              height: 0.8,
            ),
            children: [
              TextSpan(
                text: day,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget bluebox(String day, String date, String month) {
    return Container(
        width: 327.0,
        height: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0xffd7f0f0),
          boxShadow: [
            BoxShadow(
              color: const Color(0x20000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              whitebackground2(day),
              SizedBox(
                height: 5.0,
              ),
              whitebackground(date, month),
            ],
          ),
          SizedBox(
            width: 60.0,
          ),
          Text(
            'Rest',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 24,
              color: const Color(0xff394548),
            ),
            textAlign: TextAlign.left,
          ),
        ]));
  }

  Widget blueboxadd(String day, String date, String month) {
    return Container(
        width: 327.0,
        height: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0xffd7f0f0),
          boxShadow: [
            BoxShadow(
              color: const Color(0x20000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              whitebackground2(day),
              SizedBox(
                height: 5.0,
              ),
              whitebackground(date, month),
            ],
          ),
          SizedBox(
            width: 60.0,
          ),
          IconButton(
              icon: Icon(
                Icons.add,
                size: 30,
                color: Colors.black,
              ),
              color: Colors.teal.shade900,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Createtable()));
              }),
        ]));
  }

  Widget show(String day, String date, String month, bool isWorkout){
    if(isWorkout == true){
        return blueboxadd(day, date, month);
    }else{
        return bluebox(day, date, month);
    }
  }

  Widget finishButton() {
    return Container(
      child: RaisedButton(
          color: Colors.white,
          child: Text(
            'FINISH',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 20,
              color: Colors.blue,
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
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            //decoration: BoxDecoration(color: Colors.white),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      topicName(),
                      SizedBox(
                        width: 110,
                      ),
                      finishButton()
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(child: show('Mon', '8\n', 'Dec',isWorkoutDay[0])),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: show('Tue', '9\n', 'Dec',isWorkoutDay[1])),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: show('Wed', '10\n', 'Dec',isWorkoutDay[2])),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: show('Thur', '11\n', 'Dec',isWorkoutDay[3])),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: show('Fri', '12\n', 'Dec',isWorkoutDay[4])),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: show('Sat', '13\n', 'Dec',isWorkoutDay[5])),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: show('Sun', '14\n', 'Dec',isWorkoutDay[6])),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
