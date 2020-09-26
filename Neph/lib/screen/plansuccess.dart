import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neph/screen/createplan.dart';
import 'package:neph/screen/home.dart';
import 'package:neph/screen/login.dart';
import 'package:neph/screen/table.dart';

class Sucplan extends StatefulWidget {
  @override
  _SucplanState createState() => _SucplanState();
}

class _SucplanState extends State<Sucplan> {
  //Medthod

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
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => Tableex());
            Navigator.of(context).push(materialPageRoute);
          },
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
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => Profile()));
              }),
        ]));
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
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => Home()));
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
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Createplan()));
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
                  Center(child: bluebox('Mon', '8\n', 'Dec', 'Rest')),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: bluebox('Tue', '9\n', 'Dec', 'Exercise')),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: bluebox('Wed', '10\n', 'Dec', 'Rest')),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: bluebox('Thur', '11\n', 'Dec', 'Rest')),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: bluebox('Fri', '12\n', 'Dec', 'Exercise')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
