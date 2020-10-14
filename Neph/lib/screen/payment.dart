import 'package:flutter/material.dart';
import 'package:neph/screen/backend.dart';
import 'package:neph/screen/home.dart';

class Payment extends StatefulWidget {
  @override
  PaymentState createState() => PaymentState();
}

class PaymentState extends State<Payment> {
  int a = 0;
  Widget getmemberButton() {
    return Container(
      width: 270,
      height: 60,
      child: RaisedButton(
          color: const Color(0xff4f6165),
          child: Text(
            'GET MEMBERSHIP',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 20,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            updateMember().then((value){
              ready = false;
              MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context) => Home());
              Navigator.of(context).push(materialPageRoute);
            });
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      SizedBox(
        height: 25.0,
      ),
      Center(
          child: Text(
        'LOREM IPSUM DOLOR SIT AMET',
        style: TextStyle(fontFamily: 'Segoe UI', fontSize: 25),
        textAlign: TextAlign.center,
      )),
      SizedBox(
        height: 30.0,
      ),
      Image.asset("images/Payment_image.png"),
      SizedBox(
        height: 30.0,
      ),
      Text('฿169/month.',
          style: TextStyle(fontFamily: 'Segoe UI', fontSize: 40)),
      SizedBox(
        height: 30.0,
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.star,
            color: Colors.yellow[500],
          ),
          SizedBox(
            height: 30.0,
          ),
          Text('Lorem ipsum dolor sit amet',
              style: TextStyle(fontFamily: 'Segoe UI', fontSize: 20)),
        ],
      ),
      SizedBox(
        height: 30.0,
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.star,
            color: Colors.yellow[500],
          ),
          SizedBox(
            height: 30.0,
          ),
          Text('Lorem ipsum dolor sit amet',
              style: TextStyle(fontFamily: 'Segoe UI', fontSize: 20)),
        ],
      ),
      SizedBox(
        height: 30.0,
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.star,
            color: Colors.yellow[500],
          ),
          SizedBox(
            height: 30.0,
          ),
          Text('Lorem ipsum dolor sit amet',
              style: TextStyle(fontFamily: 'Segoe UI', fontSize: 20)),
        ],
      ),
      SizedBox(
        height: 30.0,
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.star,
            color: Colors.yellow[500],
          ),
          SizedBox(
            height: 30.0,
          ),
          Text('Lorem ipsum dolor sit amet',
              style: TextStyle(fontFamily: 'Segoe UI', fontSize: 20)),
        ],
      ),
      SizedBox(
        height: 30.0,
      ),
      getmemberButton()
    ]))));
  }
}
