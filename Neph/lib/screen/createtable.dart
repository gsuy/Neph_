import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neph/screen/exercise.dart';
import 'package:neph/screen/backend.dart';
import 'package:neph/screen/plansuccess.dart';
import 'package:neph/screen/selectExe.dart';

class Createtable extends StatefulWidget {
  // final List<bool> isWorkoutDay;
  final String toDay;
  Createtable(this.toDay);
  // const Tableex(this.isWorkoutDay);
  @override
  _CreatetableState createState() => _CreatetableState(toDay: toDay);
}
class Data {
  String text;
  Data({this.text});
}

class _CreatetableState extends State<Createtable> {
  String toDay;
  _CreatetableState({this.toDay});
  List<String> dayOf = ['Mon','Tue','Wed','Thur','Fri','Sat','Sun'];
  int indexDay;
  Map<String,String> link = new Map();
  List<List<dynamic>> todayWorkout;
  //Medthod

  @override
  void initState() {
    super.initState();
    print('here initSate!!!');
    start();
  }

  void start(){
    for (var i = 0; i < dayOf.length ;i++) {
      if(dayOf[i] == toDay){
        indexDay = i;
      }
    }
    
    todayWorkout = new List<List<dynamic>>.of(newWorkoutListday[indexDay]);
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
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => Sucplan()));
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
      String sets, String namepic,int inDex) {
        
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [

        Container(
            width: 300,
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
                    imageex(namepic),
                    Column(
                      children: [
                        Row(
                          children: [
                            valuebox(1,lbs,inDex),
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
                            valuebox(2,rep,inDex),
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
                            valuebox(3,sets,inDex),
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
            )),

            IconButton(icon: Icon(Icons.delete,size: 30,color: Colors.red),onPressed: (){
              newWorkoutListday[indexDay].removeAt(inDex);
              link.remove(name);
              
              setState(() {
                print('new=>${newWorkoutListday}');
              print('main=>${workoutListday}');
                start();
              });
            }),

      ],
    );
  }
  Widget emptyexercisebackground() {
        
    return Container(
        width: 300,
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
        child: IconButton(
              icon: Icon(
                Icons.add,
                size: 50,
                color: Colors.black,
              ),
              onPressed: () async{
                bool reset = await Navigator.push(
                    context,
                    MaterialPageRoute<bool>(
                        builder: (BuildContext context) => Select(indexDay)));
                if(reset==true){
                  setState(() {
                    start();
                  });
                }
              }),);
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

  Widget valuebox(int name,String value,int inDex) {
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
          child: TextField(
            decoration: new InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3.0),
              ),
              labelText: value,
              labelStyle: TextStyle(color: Colors.grey, fontSize: 16,
                    fontWeight: FontWeight.w700),
            ),
            onChanged: (value){
              newWorkoutListday[indexDay][inDex][name] = value;
            },
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
            Navigator.pop(context);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }

  Widget box(String i,String status, String lbs, String rep,
      String sets, String linkpic, int inDex){
    return Column(
      children: [
        exercisebackground(i, status, lbs, rep, sets, linkpic,inDex),
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
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      returnpage(),
                      SizedBox(
                        width: 170,
                      ),
                      finishButton()
                    ],
                  ),
                  
                  topic(
                    'Tue',
                    '9\n',
                    'Dec',
                    'Day 12',
                  ),
                  SizedBox(
                    height: 20,
                  ),emptyexercisebackground()
                   ,SizedBox(
                   height: 20,
                   ),
                    if(link.length!=0) for ( var i=0;i<todayWorkout.length;i++) box(todayWorkout[i][0], 'Doing', todayWorkout[i][1], todayWorkout[i][2], todayWorkout[i][3], link[todayWorkout[i][0]],i),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
