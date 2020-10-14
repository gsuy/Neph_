import 'package:flutter/material.dart';
import 'package:neph/screen/autogenQ2.dart';
import 'package:neph/screen/autogenQ3.dart';
import 'package:neph/screen/createplan.dart';
import 'package:neph/screen/plansche.dart';
import 'package:neph/screen/plansuccess.dart';
import 'package:neph/screen/signin.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neph/screen/backend.dart';
import 'package:neph/screen/home.dart';

class Daygen extends StatefulWidget {
  @override
  _DaygenState createState() => _DaygenState();
}

class _DaygenState extends State<Daygen> {
  //Medthod
  List<bool> isSelected;
  List<bool> selectDay = [false,false,false,false,false,false,false];
  //Medthod
  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  Widget showAppName() {
    return Text(
      'What days do you want to work out?',
      style: TextStyle(
        fontFamily: 'Trebuchet MS',
        fontSize: 22,
        color: const Color(0xffffffff),
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget mondaybox() {
    return Container(
        child: InkWell(
      onTap: () {
        setState(() {
          selectDay[0] = !selectDay[0];
        });
      },
      child: Container(
        width: 280,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: selectDay[0]
              ? Theme(
                  data: new ThemeData(
                      primaryColor: const Color(0xff2aafaf),
                      primaryColorDark: const Color(0xff2aafaf),
                      hintColor: const Color(0xff2aafaf)),
                  child: new TextField(
                    decoration: new InputDecoration(
                      enabled: false,
                      filled: true,
                      fillColor: const Color(0xffe7f9f9),
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: const Color(0xff2aafaf), width: 5.0),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(15.0)),
                      ),
                      labelText: 'Monday',
                      labelStyle: TextStyle(color: const Color(0xff4f6165)),
                    ),
                  ),
                )
              : Theme(
                  data: new ThemeData(
                      primaryColor: const Color(0xff2aafaf),
                      primaryColorDark: const Color(0xff2aafaf),
                      hintColor: const Color(0xff2aafaf)),
                  child: new TextField(
                    decoration: new InputDecoration(
                      enabled: false,
                      filled: true,
                      fillColor: Colors.teal.shade300,
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: const Color(0xff2aafaf), width: 5.0),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(15.0)),
                      ),
                      labelText: 'Monday',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
        ),
      ),
    ));
  }

  Widget tuesbox() {
    return Container(
        child: InkWell(
      onTap: () {
        setState(() {
          selectDay[1] = !selectDay[1];
        });
      },
      child: Container(
        width: 280,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: selectDay[1]
              ? Theme(
                  data: new ThemeData(
                      primaryColor: const Color(0xff2aafaf),
                      primaryColorDark: const Color(0xff2aafaf),
                      hintColor: const Color(0xff2aafaf)),
                  child: new TextField(
                    decoration: new InputDecoration(
                      enabled: false,
                      filled: true,
                      fillColor: const Color(0xffe7f9f9),
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: const Color(0xff2aafaf), width: 5.0),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(15.0)),
                      ),
                      labelText: 'Tuesday',
                      labelStyle: TextStyle(color: const Color(0xff4f6165)),
                    ),
                  ),
                )
              : Theme(
                  data: new ThemeData(
                      primaryColor: const Color(0xff2aafaf),
                      primaryColorDark: const Color(0xff2aafaf),
                      hintColor: const Color(0xff2aafaf)),
                  child: new TextField(
                    decoration: new InputDecoration(
                      enabled: false,
                      filled: true,
                      fillColor: Colors.teal.shade300,
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: const Color(0xff2aafaf), width: 5.0),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(15.0)),
                      ),
                      labelText: 'Tuesday',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
        ),
      ),
    ));
  }

  Widget wedbox() {
    return Container(
        child: InkWell(
      onTap: () {
        setState(() {
          selectDay[2] = !selectDay[2];
        });
      },
      child: Container(
        width: 280,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: selectDay[2]
              ? Theme(
                  data: new ThemeData(
                      primaryColor: const Color(0xff2aafaf),
                      primaryColorDark: const Color(0xff2aafaf),
                      hintColor: const Color(0xff2aafaf)),
                  child: new TextField(
                    decoration: new InputDecoration(
                      enabled: false,
                      filled: true,
                      fillColor: const Color(0xffe7f9f9),
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: const Color(0xff2aafaf), width: 5.0),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(15.0)),
                      ),
                      labelText: 'Wednesday',
                      labelStyle: TextStyle(color: const Color(0xff4f6165)),
                    ),
                  ),
                )
              : Theme(
                  data: new ThemeData(
                      primaryColor: const Color(0xff2aafaf),
                      primaryColorDark: const Color(0xff2aafaf),
                      hintColor: const Color(0xff2aafaf)),
                  child: new TextField(
                    decoration: new InputDecoration(
                      enabled: false,
                      filled: true,
                      fillColor: Colors.teal.shade300,
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: const Color(0xff2aafaf), width: 5.0),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(15.0)),
                      ),
                      labelText: 'Wednesday',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
        ),
      ),
    ));
  }

  Widget thurbox() {
    return Container(
        child: InkWell(
      onTap: () {
        setState(() {
          selectDay[3] = !selectDay[3];
        });
      },
      child: Container(
        width: 280,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: selectDay[3]
              ? Theme(
                  data: new ThemeData(
                      primaryColor: const Color(0xff2aafaf),
                      primaryColorDark: const Color(0xff2aafaf),
                      hintColor: const Color(0xff2aafaf)),
                  child: new TextField(
                    decoration: new InputDecoration(
                      enabled: false,
                      filled: true,
                      fillColor: const Color(0xffe7f9f9),
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: const Color(0xff2aafaf), width: 5.0),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(15.0)),
                      ),
                      labelText: 'Thursday',
                      labelStyle: TextStyle(color: const Color(0xff4f6165)),
                    ),
                  ),
                )
              : Theme(
                  data: new ThemeData(
                      primaryColor: const Color(0xff2aafaf),
                      primaryColorDark: const Color(0xff2aafaf),
                      hintColor: const Color(0xff2aafaf)),
                  child: new TextField(
                    decoration: new InputDecoration(
                      enabled: false,
                      filled: true,
                      fillColor: Colors.teal.shade300,
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: const Color(0xff2aafaf), width: 5.0),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(15.0)),
                      ),
                      labelText: 'Thursday',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
        ),
      ),
    ));
  }

  Widget fribox() {
    return Container(
        child: InkWell(
      onTap: () {
        setState(() {
          selectDay[4] = !selectDay[4];
        });
      },
      child: Container(
        width: 280,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: selectDay[4]
              ? Theme(
                  data: new ThemeData(
                      primaryColor: const Color(0xff2aafaf),
                      primaryColorDark: const Color(0xff2aafaf),
                      hintColor: const Color(0xff2aafaf)),
                  child: new TextField(
                    decoration: new InputDecoration(
                      enabled: false,
                      filled: true,
                      fillColor: const Color(0xffe7f9f9),
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: const Color(0xff2aafaf), width: 5.0),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(15.0)),
                      ),
                      labelText: 'Friday',
                      labelStyle: TextStyle(color: const Color(0xff4f6165)),
                    ),
                  ),
                )
              : Theme(
                  data: new ThemeData(
                      primaryColor: const Color(0xff2aafaf),
                      primaryColorDark: const Color(0xff2aafaf),
                      hintColor: const Color(0xff2aafaf)),
                  child: new TextField(
                    decoration: new InputDecoration(
                      enabled: false,
                      filled: true,
                      fillColor: Colors.teal.shade300,
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: const Color(0xff2aafaf), width: 5.0),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(15.0)),
                      ),
                      labelText: 'Friday',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
        ),
      ),
    ));
  }

  Widget satbox() {
    return Container(
        child: InkWell(
      onTap: () {
        setState(() {
          selectDay[5] = !selectDay[5];
        });
      },
      child: Container(
        width: 280,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: selectDay[5]
              ? Theme(
                  data: new ThemeData(
                      primaryColor: const Color(0xff2aafaf),
                      primaryColorDark: const Color(0xff2aafaf),
                      hintColor: const Color(0xff2aafaf)),
                  child: new TextField(
                    decoration: new InputDecoration(
                      enabled: false,
                      filled: true,
                      fillColor: const Color(0xffe7f9f9),
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: const Color(0xff2aafaf), width: 5.0),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(15.0)),
                      ),
                      labelText: 'Saturday',
                      labelStyle: TextStyle(color: const Color(0xff4f6165)),
                    ),
                  ),
                )
              : Theme(
                  data: new ThemeData(
                      primaryColor: const Color(0xff2aafaf),
                      primaryColorDark: const Color(0xff2aafaf),
                      hintColor: const Color(0xff2aafaf)),
                  child: new TextField(
                    decoration: new InputDecoration(
                      enabled: false,
                      filled: true,
                      fillColor: Colors.teal.shade300,
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: const Color(0xff2aafaf), width: 5.0),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(15.0)),
                      ),
                      labelText: 'Saturday',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
        ),
      ),
    ));
  }

  Widget sunbox() {
    return Container(
        child: InkWell(
      onTap: () {
        setState(() {
          selectDay[6] = !selectDay[6];
        });
      },
      child: Container(
        width: 280,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: selectDay[6]
              ? Theme(
                  data: new ThemeData(
                      primaryColor: const Color(0xff2aafaf),
                      primaryColorDark: const Color(0xff2aafaf),
                      hintColor: const Color(0xff2aafaf)),
                  child: new TextField(
                    decoration: new InputDecoration(
                      enabled: false,
                      filled: true,
                      fillColor: const Color(0xffe7f9f9),
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: const Color(0xff2aafaf), width: 5.0),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(15.0)),
                      ),
                      labelText: 'Sunday',
                      labelStyle: TextStyle(color: const Color(0xff4f6165)),
                    ),
                  ),
                )
              : Theme(
                  data: new ThemeData(
                      primaryColor: const Color(0xff2aafaf),
                      primaryColorDark: const Color(0xff2aafaf),
                      hintColor: const Color(0xff2aafaf)),
                  child: new TextField(
                    decoration: new InputDecoration(
                      enabled: false,
                      filled: true,
                      fillColor: Colors.teal.shade300,
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: const Color(0xff2aafaf), width: 5.0),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(15.0)),
                      ),
                      labelText: 'Sunday',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
        ),
      ),
    ));
  }

  Widget gonextpage() {
    return Container(
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
            icon: Icon(
              Icons.arrow_forward,
              size: 30,
              color: Colors.white,
            ),
            color: Colors.teal.shade900,
            onPressed: () {
              isWorkoutDay = new List<bool>.from(selectDay);
              autogenfunction();
              print('testtttttt!!!');
              
              setisWorkoutDay();
              resetWorkoutlist();

              workoutListday = [[],[],[],[],[],[],[]];
              int count = 0;
              print('vvvvvvvvvvvvvvvvv');
              print('vvvvvvvvvvvvvvvvv');
              print('vvvvvv NEW vvvvvv');
              print('vvvvvvvvvvvvvvvvv');
              print('vvvvvvvvvvvvvvvvv');
              print('countdayexercise ==> $countdayexercise');
              print('isWorkoutDay.length=>${isWorkoutDay.length}');

              for (var i = 0; i < isWorkoutDay.length; i++) {
                print('i = $i');
                if(isWorkoutDay[i] == true){
                  // List<String> temp = [allformofweek[0],];
                  print('for i = $i then ii = ${allformofweek[count]}');
                  for(var ii in allformofweek[count]){
                    
                    workoutListday[i].add([ii.toString(),weight.toString(),repperset.toString(),sets.toString()]);
                  }
                  // allformofweek.removeAt(0);
                  count += 1;
                }
              }
              setworkoutListday();
              updatehaveSchedule();
              ready = false;
              MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context) => Home());
              Navigator.of(context).pushAndRemoveUntil(materialPageRoute,(Route<dynamic> route) => false);
            }),
      ),
    );
  }

  Widget returnpage() {
    return Container(
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
            color: Colors.teal.shade900,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => Autoq2()));
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff163737),
      body: SafeArea(
          child: Container(
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: [
                returnpage(),
                SizedBox(
                  width: 260.0,
                ),
                gonextpage()
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            showAppName(),
            SizedBox(
              height: 40.0,
            ),
            mondaybox(),
            SizedBox(
              height: 10.0,
            ),
            tuesbox(),
            SizedBox(
              height: 10.0,
            ),
            wedbox(),
            SizedBox(
              height: 10.0,
            ),
            thurbox(),
            SizedBox(
              height: 10.0,
            ),
            fribox(),
            SizedBox(
              height: 10.0,
            ),
            satbox(),
            SizedBox(
              height: 10.0,
            ),
            sunbox(),
          ],
        )),
      )),
    );
  }
}
