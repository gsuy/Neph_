import 'package:flutter/material.dart';
import 'package:neph/screen/autogen.dart';
import 'package:neph/screen/autogenQ1.dart';
import 'package:neph/screen/selectday.dart';

class Plan extends StatefulWidget {
  @override
  _PlanState createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  //Medthod

  Widget showAppName() {
    return Text(
      'How do you want to plan ?',
      style: TextStyle(
        fontFamily: 'Trebuchet MS',
        fontSize: 22,
        color: const Color(0xffffffff),
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget customButton() {
    return Container(
      width: 250,
      height: 40,
      child: RaisedButton(
          color: Colors.white,
          child: Text('Custom',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 20,
                color: const Color(0xff4f6165),
              ),
              textAlign: TextAlign.left),
          onPressed: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => Day());
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
          color: const Color(0xff4f6165),
          child: Text(
            'Auto generate',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 20,
              color: Colors.black,
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

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        customButton(),
        SizedBox(
          width: 5.0,
        ),
        autoButton()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.cyan.shade800, Colors.grey.shade900],
          //colors: [Colors.purple.shade800, Colors.teal.shade600],
        )),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            //showLogo(),
            SizedBox(
              height: 15.0,
            ),
            showAppName(),
            SizedBox(
              height: 100.0,
            ),
            customButton(),
            SizedBox(
              height: 10.0,
            ),
            autoButton()
          ],
        )),
      )),
    );
  }
}
