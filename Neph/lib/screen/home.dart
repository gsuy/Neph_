import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neph/screen/calculatorcal.dart';
import 'package:neph/screen/payment.dart';
import 'package:neph/screen/plansche.dart';
import 'package:neph/screen/plansuccess.dart';
import 'package:neph/screen/profile.dart';
import 'package:neph/screen/stats.dart';
import 'package:neph/screen/backend.dart';
import 'package:neph/screen/auth.dart';
import 'package:neph/screen/testgraph.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String isNephmember = '';
  //Medthod
  @override
  void initState() {
    super.initState();
    id = uid;
    print('Connect Home!!!.');
    print('id ====>>>> $id');
    loadUser();
    loadWorkoutList();
    loadworkoutListday();
    loadCategory();
    loadMemberWorkout();
    fetchData();
  }

  Future<void> fetchData() => Future.delayed(Duration(seconds: 3), () {
    if(workoutList.length != 0){
      ready = true;
      print('user ===> $user');
      user['Member'] ? isNephmember = 'neph member':isNephmember = 'free member';
    }else{
      fetchData();
    }
  });
  
  Widget iconprofile() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.account_circle,
                size: 50,
                color: Colors.lightBlue.shade50,
              ),
              onPressed: () {
               
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Profile()));
              }),
        ]);
  }

  Widget iconsetting() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.settings,
                size: 40,
                color: Colors.white,
              ),
              onPressed: () {
                //allformofweek=[];
                // autogenfunction();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Crart()));
              }),
        ]);
  }

  Widget nametab() {
    return Column(
      children: [
        InkWell(
          child: Text(
            user['Name'],
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 36,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w700,
              height: 0.75,
            ),
            textAlign: TextAlign.center,
          ),
          onTap: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => Profile());
            Navigator.of(context).push(materialPageRoute);
          },
        ),
        SizedBox(
          height: 15,
        ),
        InkWell(
          child: Padding(padding: EdgeInsets.only(right: 50),
                      child: Text(
              isNephmember,
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          onTap: () {
            if(user['Member'] == false){
              MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context) => Payment());
              Navigator.of(context).push(materialPageRoute);
            }
          },
        ),
      ],
    );
  }

  Widget planButton() {
    return Container(
      width: 160,
      height: 90,
      child: RaisedButton(
          color: const Color(0xff394548),
          child: Text(
            'Plan Schedule',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 20,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.left,
          ),elevation: 5,
          onPressed: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => Sucplan());
            Navigator.of(context).push(materialPageRoute);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }

  Widget calButton() {
    return Container(
      width: 160,
      height: 90,
      child: RaisedButton(
          color: const Color(0xff394548),
          child: Text(
            'Calories Calculator',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 20,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.left,
          ),elevation: 5,
          onPressed: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => Calculate());
            Navigator.of(context).push(materialPageRoute);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }

  Widget statButton() {
    return Container(
      width: 340,
      height: 150,
      child: RaisedButton(
          color: const Color(0xffffffff),
          child: Padding( padding: EdgeInsets.only(right: 190,top: 40),
                      child: Column(
              children: [
                Text(
                                  'CurrentError',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 16,
                                    color: const Color(0xff374f51),
                                  ),
                                  textAlign: TextAlign.left,
                                ),Text(
                              '20%',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 35,
                                color: const Color(0xff374f51),
                              ),
                              textAlign: TextAlign.left,
                            ),
              ],
            ),
          ),
          onPressed: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => Stats());
            Navigator.of(context).push(materialPageRoute);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }

  Widget workoutButton() {
    return Container(
      width: 340,
      height: 65,
      child: RaisedButton(
          color: const Color(0xff394548),
          child: Text(
            'GO WORKOUT',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 20,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.start,
          ),elevation: 5,
          onPressed: () {
              Widget go = Plan();
              if(user['haveSchedule'] == true){
                go = Sucplan();
              }
              MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context) => go);
              Navigator.of(context).push(materialPageRoute);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(45.0))),
    );
  }

  Widget whiteback() {
    return Align(
      alignment: Alignment(0.0, 5.0),
      child: Container(
        height: 600,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          color: Colors.lightBlue.shade50,
          boxShadow: [
            BoxShadow(
              color: const Color(0x29000000),
              offset: Offset(2, 2),
              blurRadius: 3,
            ),
          ],
        ),
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          workoutButton(),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              planButton(),
              SizedBox(
                width: 20,
              ),
              calButton()
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Align(alignment: Alignment.bottomLeft,
                      child: Padding(padding: EdgeInsets.only(left: 35),
                                              child: Text('STATS',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 21,
                color: const Color(0xff000000),
                letterSpacing: 2.1,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.start
            ),
                      ),
          ),SizedBox(height: 10,),
          statButton(),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchData(),
        builder: (context,snapshot){
          if(ready==true){
            return SafeArea(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(color: const Color(0xff394548)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            iconsetting(),
                            SizedBox(width: 250),
                            iconprofile()
                          ],
                        ),
                        SizedBox(height: 70),
                        Align(alignment: Alignment(-0.7, 0), child: nametab()),
                      ],
                    ),
                  ),
                  whiteback()
                ],
              ));
          }else{
            return Center(child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              strokeWidth: 6,
            ),
            );
          }
        }
      ),
    );
  }
}

