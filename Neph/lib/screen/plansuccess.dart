// import 'dart:html';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:neph/screen/createplan.dart';
import 'package:neph/screen/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neph/screen/table.dart';
import 'package:neph/screen/backend.dart';

class Sucplan extends StatefulWidget {
  @override
  _SucplanState createState() => _SucplanState();
}

class _SucplanState extends State<Sucplan> {
  // List<String> workoutDay = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
  // List<bool> isWorkoutDay = [false,false,false,false,false,false,false];
  //Medthod

  @override
  void initState() {
    super.initState();
    // newWorkoutListday = new List<List<List<dynamic>>>.of(workoutListday);
    // loadisWorkoutDay().then((value){setState(() {});});
  }

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

  Widget whitebackground(String day) {
    return Container(
      width: 80,
      height: 80,
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

  Widget bluebox(String day, String date, String month, String type) {
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
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: whitebackground(day),
              ),
            ],
          ),
          SizedBox(
            width: 60.0,
          ),
          InkWell(
            child: Text(
              type,
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 24,
                color: const Color(0xff394548),
              ),
              textAlign: TextAlign.left,
            ),
            onTap: () {
              if (type == 'Exercise') {
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                    builder: (BuildContext context) => Tableex(day));
                Navigator.of(context).push(materialPageRoute);
                // Navigator.of(context).pop();
              }
            },
          ),
        ]));
  }

  Widget show(String day, String date, String month, bool isWorkout) {
    if (isWorkout == true) {
      return bluebox(day, date, month, 'Exercise');
    } else {
      return bluebox(day, date, month, 'Rest');
    }
  }

  Widget closeButton() {
    return Container(
      child: IconButton(
          icon: Icon(
            Icons.close,
            size: 30,
            color: Colors.black,
          ),
          color: Colors.teal.shade900,
          onPressed: () {
            // Navigator.popUntil(context, (route) => false);
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (BuildContext context) => Home()));
            Navigator.pop(context);
          }),
    );
  }

  Widget editButton() {
    return Container(
      child: IconButton(
          icon: Icon(
            Icons.edit,
            size: 30,
            color: Colors.black,
          ),
          color: Colors.teal.shade900,
          onPressed: () async {
            bool reset = await Navigator.push(
                context,
                MaterialPageRoute<bool>(
                    builder: (BuildContext context) => Createplan()));
            // print('reset====>>>>$reset');
            if (reset == null) {
              setState(() {
                // newWorkoutListday = new List<List<List<dynamic>>>.of(workoutListday);
              });
            }
          }),
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
                        width: 10,
                      ),
                      editButton(),
                      SizedBox(
                        width: 110,
                      ),
                      closeButton()
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(child: show('Mon', '8\n', 'Dec', isWorkoutDay[0])),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: show('Tue', '9\n', 'Dec', isWorkoutDay[1])),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: show('Wed', '10\n', 'Dec', isWorkoutDay[2])),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: show('Thur', '11\n', 'Dec', isWorkoutDay[3])),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: show('Fri', '12\n', 'Dec', isWorkoutDay[4])),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: show('Sat', '13\n', 'Dec', isWorkoutDay[5])),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: show('Sun', '14\n', 'Dec', isWorkoutDay[6])),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
