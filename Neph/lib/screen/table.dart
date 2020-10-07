import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neph/screen/exercise.dart';
import 'package:neph/screen/plansuccess.dart';
import 'package:neph/screen/backend.dart';

class Tableex extends StatefulWidget {
  // final List<bool> isWorkoutDay;
  final String day_;
  Tableex(this.day_);
  // const Tableex(this.isWorkoutDay);
  @override
  _TableexState createState() => _TableexState(thisDay: day_);
}
// @protected
class Data {
  String text;
  String dayExe;
  Data({this.text,this.dayExe});
}

class _TableexState extends State<Tableex> {
  String thisDay;
  _TableexState({this.thisDay});
  List<String> dayOf = ['Mon','Tue','Wed','Thur','Fri','Sat','Sun'];
  int indexDay;
  Map<String,String> link = new Map();
  List<List<dynamic>> todayWorkout;
  // List<String> test = ['Brench Press','Leg Press','Leg Press','Leg Press','Leg Press','Leg Press','Leg Press','Leg Press','Leg Press','Leg Press','Leg Press','Leg Press'];
  //Medthod

  @override
  void initState() {
    super.initState();
    // Data data = Data(text: 'name',dayExe: thisDay);

    // link['Name'] = '3';
    // print('asdsad ====>>> $link');

    for (var i = 0; i < dayOf.length ;i++) {
      if(dayOf[i] == thisDay){
        indexDay = i;
      }
    }
    
    todayWorkout = new List<List<dynamic>>.from(workoutListday[indexDay]);
    link = new Map();

    for(var ii = 0; ii < todayWorkout.length; ii++)
      for (var j = 0; j < workoutList.length; j++) {
        if(todayWorkout[ii][0] == workoutList[j][0]){
          link[workoutList[j][0]] = workoutList[j][1];
        }
      }
  }

  Widget returnpage() {
    return Container(
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: const Color(0xff394548),
            ),
            color: Colors.teal.shade900,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }

  Widget whitebackground(String date, String month) {
    return Container(
      width: 90,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.0),
        color: Colors.lightBlue.shade50,
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
        color: Colors.lightBlue.shade50,
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

  Widget exercisename(String name) {
    return Container(
      width: 170,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.0),
        color: Colors.white,
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
                text: name,
                style: TextStyle(
                  fontSize: 20,
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
  
  
  Widget exercisebackground(String name, String status, String lbs, String rep,
      String sets, String linkpic) {
        
    return GestureDetector( 
        onTap: (){
          Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Exercise(name : name,dayExe : thisDay)));
        },child: Container(
        width: 327,
        height: 175,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21.0),
          color: Colors.lightBlue.shade50,
          boxShadow: [
            BoxShadow(
              color: const Color(0x29000000),
              offset: Offset(3, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 50, top: 13),
                  child: exercisename(name),
                ),
                // Text(
                //   status,
                //   style: TextStyle(
                //     fontFamily: 'Segoe UI',
                //     fontSize: 18,
                //     color: const Color(0x7d394548),
                //     fontWeight: FontWeight.w700,
                //     height: 1.8461538461538463,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                imageex(linkpic),
                Column(
                  children: [
                    Row(
                      children: [
                        valuebox(lbs),
                        SizedBox(
                          width: 15,
                        ),
                        Text('lbs.',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff394548),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        valuebox(rep),
                        SizedBox(
                          width: 15,
                        ),
                        Text('reps',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff394548),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        valuebox(sets),
                        SizedBox(
                          width: 15,
                        ),
                        Text('sets',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff394548),
                            ))
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        )));
  }

  Widget imageex(String linkpic) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Image(
        image: NetworkImage(linkpic),
        width: 180,
        height: 100,
      ),
    );
  }

  Widget valuebox(String value) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Container(
        width: 55,
        height: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21.0),
          color: Colors.white,
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
                fontSize: 16,
                color: const Color(0xff394548),
                height: 0.8,
              ),
              children: [
                TextSpan(
                  text: value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget topic(String day, String date, String month, String type) {
    return Row(children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: whitebackground2(day),
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: whitebackground(date, month),
          ),
        ],
      ),
      SizedBox(
        width: 40.0,
      ),
      Column(
        children: [
          Text(
            'Workout',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: const Color(0xff394548),
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            type,
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontWeight: FontWeight.w700,
              fontSize: 36,
              color: const Color(0xff394548),
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    ]);
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
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => Profile()));
              }),
        ]));
  }

  Widget box(String i,String status, String lbs, String rep,
      String sets, String linkpic){
    return Column(
      children: [
        exercisebackground(i, status, lbs, rep, sets, linkpic),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            //decoration: BoxDecoration(color: Colors.white),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  returnpage(),
                  topic(
                    thisDay,
                    '9\n',
                    'Dec',
                    'Day 12',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if(link.length!=0) for ( var i in todayWorkout) box(i[0], 'Done', i[1], i[2], i[3], link[i[0]]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
