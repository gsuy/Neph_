import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:neph/screen/autogenQ1.dart';
import 'package:neph/screen/createtable.dart';
import 'package:neph/screen/home.dart';
import 'package:neph/screen/backend.dart';

class Createplan extends StatefulWidget {
  @override
  _CreateplanState createState() => _CreateplanState();
}

// enum WidgetMarker { add, rest }

class _CreateplanState extends State<Createplan> {
  List<bool> newselectday = new List<bool>.from(isWorkoutDay); //monday , ... , sunday
  
  //Medthod
  @override
  void initState() {
    super.initState();
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

  Widget bluebox(String day, String date, String month, int index) {
    return Container(
        width: 327.0,
        height: 170.0,
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
          Column(
            children: [SizedBox(height: 55,),
              Align(alignment: Alignment.center,
                              child: Text(
            'Rest',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 24,
              color: const Color(0xff394548),
            ),
            textAlign: TextAlign.left,
          ),
              ),
            ],
          ),SizedBox(width: 50,),Column(
            children: [
              Align( alignment: Alignment.topRight,
                                  child: IconButton(
                        icon: Icon(
                          Icons.sync,
                          size: 30,
                          color: Colors.red.shade600,
                        ),
                        color: Colors.teal.shade900,
                        onPressed: () {
                          setState(() {
                            newselectday[index] = !newselectday[index];
                          });
                        }),
                  ),
            ],
          )
          
          
          
        ]));
  }

  Widget blueboxadd(String day, String date, String month, int index) {
    return Container(
        width: 327.0,
        height: 170.0,
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
          
          Column(
            children: [SizedBox(height: 55,),
              Align(alignment: Alignment.center,
                              child: IconButton(
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
                              builder: (BuildContext context) => Createtable(day)));
                    }),
              ),
            ],
          ),SizedBox(width: 50,),Column(
            children: [
              Align( alignment: Alignment.topRight,
                                  child: IconButton(
                        icon: Icon(
                          Icons.sync,
                          size: 30,
                          color: Colors.greenAccent.shade700,
                        ),
                        color: Colors.teal.shade900,
                        onPressed: () {
                          setState(() {
                            newselectday[index] = !newselectday[index];
                          });
                        }),
                  ),
            ],
          ),

        ]));
  }

  Widget show(
      String day, String date, String month, bool isWorkout, int index) {
    if (isWorkout == true) {
      return blueboxadd(day, date, month, index);
    } else {
      return bluebox(day, date, month, index);
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
            isWorkoutDay = new List<bool>.from(newselectday);
            setisWorkoutDay();
            // workoutListday = newWorkoutListday;
            // newWorkoutListday = new a;
            setworkoutListday();
            resetWorkoulist();
            // workoutListday = new List<List<List<dynamic>>>.from(newWorkoutListday);
            newWorkoutListday = new List<List<List<dynamic>>>.from(workoutListday);
            setworkoutListday();
            Navigator.popUntil(context, (route) => false);
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => Home());
            Navigator.of(context).push(materialPageRoute);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }

  Widget autoButton() {
    return Container(
      width: 250,
      height: 40,
      child: RaisedButton(
          color: Colors.red,
          child: Text(
            'Auto generate',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
          onPressed: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => Autoq1());
            Navigator.of(context).push(materialPageRoute);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }

  // WidgetMarker selectedWidgetMarker = WidgetMarker.rest;
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
                  if(user['haveSchedule'] == true) autoButton(),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: show('Mon', '8\n', 'Dec', newselectday[0], 0)),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: show('Tue', '9\n', 'Dec', newselectday[1], 1)),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: show('Wed', '10\n', 'Dec', newselectday[2], 2)),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: show('Thur', '11\n', 'Dec', newselectday[3], 3)),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: show('Fri', '12\n', 'Dec', newselectday[4], 4)),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: show('Sat', '13\n', 'Dec', newselectday[5], 5)),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: show('Sun', '14\n', 'Dec', newselectday[6], 6)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
