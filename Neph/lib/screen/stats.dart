import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:neph/screen/payment.dart';

class Stats extends StatefulWidget{
  @override
  StatsState createState() => StatsState();
}

class StatsState extends State<Stats>{

  Widget showProfile(){
    return Container(
      child: Icon(
          Icons.account_circle,
          size: 100,
          color: Colors.white,
          ),
    );

  }

  Widget showName(){
    return Container(
      child: Center(
        child: Text(
          'John Doe',
          style: TextStyle(fontFamily: 'Segoe UI',color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )),
    );
  }

  Widget showLocation(){
    return Container(
      child: Center(
        child: Text(
          'San Francisco, CA',
          style: TextStyle(fontFamily: 'Segoe UI',color: Colors.white, fontSize: 20),
          textAlign: TextAlign.center,
          )),
    );
  }

  Widget showButton(){
    return Container(
      child: RaisedButton(
      color: Colors.white,
      child: 
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

            Text('free member',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 15,
                color: const Color(0xff4f6165),
              ),
              textAlign: TextAlign.left),

            SizedBox(
              width: 5.0,
            ),
            Icon(
              Icons.fitness_center,
              size: 30,
              color: Colors.yellow,
            ),

          ]),
          
      onPressed: () {
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Payment());
        Navigator.of(context).push(materialPageRoute);
        int a = 0;
      },
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0)))
    );
  }

    
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: 
        
        SingleChildScrollView(
        child: SafeArea(
          child: 
          Center(
            child:
              Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                SizedBox(
                height: 300.0,
                child: 
                  new Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/Stats.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[

                          SizedBox(
                            height: 30.0,
                          ),
                          showProfile(),

                          SizedBox(
                            height: 10.0,
                          ),
                          showName(),
                         
                          SizedBox(
                            height: 5.0,
                          ),
                          showLocation(),

                          SizedBox(
                            height: 10.0,
                          ),
                          showButton(),

                        ])
                      )
                  )
                ),
                
                SizedBox(
                  height: 25.0,
                ),
                Center(
                  child: Text(
                  'STATS',
                  style: TextStyle(fontFamily: 'Segoe UI', fontSize: 30,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
                
                
                
                
              ])
          )
        )
      )
    );
  }
}