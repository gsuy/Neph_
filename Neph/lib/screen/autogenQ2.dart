import 'package:flutter/material.dart';
import 'package:neph/screen/autogenQ3.dart';
import 'package:neph/screen/signin.dart';
import 'package:neph/screen/signup.dart';

class Autoq2 extends StatefulWidget {
  @override
  _Autoq2State createState() => _Autoq2State();
}

class _Autoq2State extends State<Autoq2> {
  //Medthod

  Widget showAppName() {
    return Column(children: [
      Text(
        'Question 2',
        style: TextStyle(
          fontFamily: 'Trebuchet MS',
          fontSize: 22,
          color: const Color(0xffffffff),
        ),
        textAlign: TextAlign.center,
      ),
      Text(
        'What are your goals?',
        style: TextStyle(
          fontFamily: 'Trebuchet MS',
          fontSize: 22,
          color: const Color(0xffffffff),
        ),
        textAlign: TextAlign.center,
      )
    ]);
  }

  Widget customButton() {
    return Container(
      width: 250,
      height: 40,
      child: RaisedButton(
          color: Colors.white,
          child: Text('Lose Fat',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 20,
                color: const Color(0xff4f6165),
              ),
              textAlign: TextAlign.left),
          onPressed: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => Autoq3());
            Navigator.of(context).push(materialPageRoute);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }

  Widget bulkButton() {
    return Container(
      width: 250,
      height: 40,
      child: RaisedButton(
          color: const Color(0xff4f6165),
          child: Text(
            'Bulk Up',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 20,
              color: Colors.black,
            ),
            textAlign: TextAlign.left,
          ),
          onPressed: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => Autoq3());
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
            'Build Muscle',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 20,
              color: Colors.black,
            ),
            textAlign: TextAlign.left,
          ),
          onPressed: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => Autoq3());
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
            bulkButton(),
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
