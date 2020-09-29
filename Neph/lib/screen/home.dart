import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neph/screen/payment.dart';
import 'package:neph/screen/plansche.dart';
import 'package:neph/screen/plansuccess.dart';
import 'package:neph/screen/profile.dart';
import 'package:neph/screen/signin.dart';
import 'package:neph/screen/stats.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Medthod
  bool check = true;
  @override
  void initState() {
    // print("test : $dbRef");
    super.initState();
    readAllData();
  }

  Future<void> readAllData()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    // final dbRef = FirebaseDatabase.instance.reference().child('Users').child('Schedule').snapshots();
    // AsyncSnapshot<DataSnapshot> snapshot = dbRef;
    // AsyncSnapshot<DataSnapshot> snapshotttt = dbRef;
    CollectionReference collectionReference = firestore.collection('Users').doc('SsAes6slcuBjeetZ9hyr').collection('Schedule');
    
    // List<String> day = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
    // for (var i = 0; i < 20; i++) {
    //   firestore.collection('Users').doc(i.toString()).set({
    //     'Age':i,
    //     'Email': 'jonh_doe'+i.toString()+'@hotmail.com',
    //     'Goal': 'Build muscle',
    //     'Height': 165,
    //     'Weight': 50,
    //     'Name':'Jonh Doe'+i.toString(),
    //     'Password':'abc123',
    //     'Sex':'Male',
    //     'haveSchedule':true
    //   });
    //   for (var ii = 0; ii < 7; ii++) {
    //     firestore.collection('Users').doc(i.toString()).collection('Schedule').doc(day[ii]).set({'isWorkout_Day': true});
    //   }
    // }
      
    await collectionReference.snapshots().listen((res) {
      List<DocumentSnapshot> snapshots = res.docs;
      // List<CollectionReference> ss = res.docs;

      // List<CollectionReference> test = res.
      // print("test ${dbRef.once().data.value}");
      print("Start..................");
      for (var snapshot in snapshots) {
        // print('snapshot $snapshot');
        // print("Name = ${snapshot.data()}");
        // if(snapshot.get('ID')=="neph_1"){
          print("have = ${snapshot.get('Day')}");
        // }
        // list.add(snapshot.get('Name'));
      }
      });
    // }
  }
  
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Profile()));
              }),
        ]);
  }

  Widget nametab() {
    return Column(
      children: [
        InkWell(
          child: Text(
            "John Doe",
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
              "free member",
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 16,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          onTap: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => Payment());
            Navigator.of(context).push(materialPageRoute);
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
                MaterialPageRoute(builder: (BuildContext context) => Plan());
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
              if(check == true){
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
      body: SafeArea(
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
      )),
    );
  }
}
