import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:neph/screen/createplan.dart';
import 'package:neph/screen/home.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neph/screen/table.dart';

class Calculate extends StatefulWidget {
  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  // List<bool> isWorkout = [false,false,false,false,false,false,false];
  //Medthod
  TextEditingController goal = new TextEditingController();
  TextEditingController food = new TextEditingController();
  //var goalcal = int.parse(goal.text);
  //int remaining = goal.text
  Widget topicName() {
    return Text(
      'CALORIES CALCULATOR',
      style: TextStyle(
        fontFamily: 'Segoe UI',
        fontSize: 20,
        color: const Color(0xff394548),
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.left,
    );
  }

  Widget daytab(String day, String date) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          thisdayicon(day, date),
          SizedBox(
            width: 13,
          ),
          dayicon('Tue', '9'),
          SizedBox(
            width: 13,
          ),
          dayicon('Wed', '10'),
          SizedBox(
            width: 13,
          ),
          dayicon('Thu', '11'),
          SizedBox(
            width: 13,
          ),
          dayicon('Fri', '12'),
          SizedBox(
            width: 13,
          ),
          dayicon('Sat', '13'),
          SizedBox(
            width: 13,
          ),
          dayicon('Sun', '14'),
          SizedBox(
            width: 13,
          ),
          dayicon('Mon', '15'),
          SizedBox(
            width: 13,
          ),
          dayicon('Tue', '16'),
        ],
      ),
    );
  }

  Widget dayicon(String day, String date) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 29.0),
          child: Text(
            day,
            style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 12,
                color: const Color(0xff2aafaf),
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.left,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 23, left: 5),
            child: Text(
              date,
              style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 12,
                  color: const Color(0xff2aafaf),
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }

  Widget thisdayicon(String day, String date) {
    return Container(
      width: 35,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.0),
        color: const Color(0xff2aafaf),
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text(
                  day,
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 12,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: whitebackground2(date),
              )
            ],
          )),
    );
  }

  Widget whitebackground2(String day) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.0),
        color: const Color(0xffffffff),
      ),
      child: Align(
          alignment: Alignment.center,
          child: Text(
            day,
            style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 12,
                color: const Color(0xff2aafaf),
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.left,
          )),
    );
  }

  Widget goalfield() {
    return Container(
        width: 65.0,
        height: 30,
        child: new Theme(
          data: new ThemeData(
            primaryColor: Colors.white,
            primaryColorDark: Colors.white,
          ),
          child: new TextField(
            controller: goal,
            decoration: new InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: const Color(0xff2aafaf), width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: const Color(0xff2aafaf), width: 1.0),
              ),
              labelText: '2880',
              labelStyle: TextStyle(color: const Color(0xff2aafaf)),
            ),
          ),
        ));
  }

  Widget foodfield() {
    return Container(
        width: 60.0,
        height: 30,
        child: new Theme(
          data: new ThemeData(
            primaryColor: Colors.white,
            primaryColorDark: Colors.white,
          ),
          child: new TextField(
            controller: food,
            decoration: new InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: const Color(0xff2aafaf), width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: const Color(0xff2aafaf), width: 1.0),
              ),
              labelText: '535',
              labelStyle: TextStyle(color: const Color(0xff2aafaf)),
            ),
          ),
        ));
  }

  Widget totalfield() {
    return Container(
        width: 65.0,
        height: 30,
        child: new Theme(
          data: new ThemeData(
            primaryColor: Colors.white,
            primaryColorDark: Colors.white,
          ),
          child: new TextField(
            decoration: new InputDecoration(
              filled: true,
              fillColor: const Color(0xff2aafaf),
              border: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: const Color(0xff2aafaf), width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: const Color(0xff2aafaf), width: 1.0),
              ),
              labelText: '535',
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }

  Widget calbox(String day, String date, String month, String type) {
    return Container(
        width: 327.0,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),
          color: Colors.white,
        ),
        child: Row(children: [
          SizedBox(
            width: 40,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Goal',
                style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 18,
                    color: const Color(0xff2aafaf),
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10,
              ),
              goalfield()
            ],
          ),
          SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Text(
              '-',
              style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 18,
                  color: const Color(0xff2aafaf),
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Food',
                style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 18,
                    color: const Color(0xff2aafaf),
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10,
              ),
              foodfield()
            ],
          ),
          SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Text(
              '=',
              style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 18,
                  color: const Color(0xff2aafaf),
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Remaining',
                style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 18,
                    color: const Color(0xff2aafaf),
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10,
              ),
              totalfield(),
            ],
          )
        ]));
  }

  Widget mealbox(String meal, String cal, String month, String type) {
    return Container(
        width: 327.0,
        height: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),
          color: Colors.white,
        ),
        child: Row(children: [
          SizedBox(
            width: 40,
          ),
          Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      meal,
                      style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 26,
                          color: const Color(0xff2aafaf),
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                    ),
                    // Adobe XD layer: 'surface1' (group)
                    Row(
                      children: [
                        Container(width: 30,height: 35,
                          child: SvgPicture.string(
                                  '<svg viewBox="0.0 0.0 15.5 17.7" ><path transform="translate(0.0, 0.0)" d="M 4.058868885040283 17.65739440917969 C 1.484559535980225 11.18947982788086 6.923995971679688 8.827893257141113 6.923995971679688 8.827893257141113 C 6.543421745300293 12.27921104431152 9.115695953369141 14.96806526184082 9.115695953369141 14.96806526184082 C 10.06174850463867 14.75034332275391 11.86746692657471 13.73325061798096 11.86746692657471 13.73325061798096 C 11.86746692657471 14.96806526184082 10.91467571258545 17.65581321716309 10.91467571258545 17.65581321716309 C 10.91467571258545 17.65581321716309 14.25013542175293 15.68933010101318 15.3000955581665 12.42326641082764 C 16.34870910644531 9.157176971435547 13.30273342132568 5.878232955932617 13.30273342132568 5.878232955932617 C 13.48627471923828 8.189911842346191 12.46060276031494 10.4635124206543 10.45109748840332 12.2004861831665 C 10.55163669586182 12.11198806762695 10.63598728179932 12.01371669769287 10.70076656341553 11.90721225738525 C 11.06176853179932 11.35670280456543 11.64141368865967 9.925858497619629 11.30198669433594 6.612430572509766 C 10.82424449920654 1.961294174194336 5.297086238861084 -4.415610703745187e-07 5.297086238861084 -4.415610703745187e-07 C 5.773481369018555 2.83389687538147 4.344968795776367 3.486814498901367 0.9987149834632874 8.865972518920898 C -2.347542762756348 14.24416732788086 4.058868885040283 17.65739440917969 4.058868885040283 17.65739440917969 Z M 4.058868885040283 17.65739440917969" fill="#394548" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                        ),SizedBox(width: 10,),
                      Text(
                      cal,
                      style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 30,
                          color: const Color(0xff394548),
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                    ),SizedBox(width: 10,),Text(
                      'kcal',
                      style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 20,
                          color: const Color(0xff394548),
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.left,
                    )],
                    ),
                  ],
                ),SizedBox(width: 60,),addButton()
              ],
            )
          ])
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
              //whitebackground(date, month),
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

               
  Widget addButton() {
    return CircleAvatar(
                radius: 25,
                backgroundColor: const Color(0xffc0e7e7),
      child: IconButton(
          icon: Icon(
            Icons.add,
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
      backgroundColor: const Color(0xffe7f9f9),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 60),
                        child: topicName(),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  daytab('Mon', '7'),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: calbox('Mon', '8\n', 'Dec', 'Rest')),
                  SizedBox(
                    height: 20,
                  ),mealbox('BREAKFAST', '200', 'month', 'type')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
