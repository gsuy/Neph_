import 'package:flutter/material.dart';
import 'package:neph/screen/backend.dart';
import 'package:neph/screen/payment.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

  List<double> errordata = [0.5,0.47,0.49,0.43,0.45,0.39,0.4,0.35,0.33,0.37,0.3,0.33,0.25,0.2,0.1];
  List<double> progressdata = [0.5,0.6,0.7,0.75];
  List<double> weightdata = [12,12,15,15,14,15,13,17,18];
  List<double> repsdata = [12,12,12,15,12,15,8,8,8];
  List<double> setsdata = [3,3,3,3,4,4,3,4,4];
  List<double> volumn =[];
class Stats extends StatefulWidget{
  @override
  StatsState createState() => StatsState();
}

class StatsState extends State<Stats>{
  
  var currentprogress;
  var currenterror;
  var currentvolumn;
  String isNephmember = '';
   void initState() {
    super.initState();
    user['Member'] ? isNephmember = 'neph member':isNephmember = 'free member';
    for (int i =0;i<weightdata.length;i++){
        volumn.add(weightdata[i]*repsdata[i]*setsdata[i]);
    }
    currentprogress = progressdata[progressdata.length-1] - progressdata[0];
    currenterror = errordata[errordata.length-1] - errordata[0];
    currentvolumn = volumn[volumn.length-1] - volumn[0];

  }

  Material mychart1Items(String priceVal,String subtitle,List<double> data) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(priceVal, style: TextStyle(
                      fontSize: 28.0,
                    ),),
                  ),
                  
                    Text(subtitle, style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blueGrey,
                    ),),
                  

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: new Sparkline(
                      data: data,
                      fillMode: FillMode.below,
                      fillGradient: new LinearGradient(
                        begin: Alignment.topCenter,
                        end:Alignment.bottomCenter,
                        colors: [Colors.blue.shade200,Colors.blue.shade100]
                      ),
                      //lineColor: Color(0xffff6101),
                      pointsMode: PointsMode.all,
                      pointSize: 5.0,
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

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
          user['Name'],
          style: TextStyle(fontFamily: 'Segoe UI',color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
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

            Text(isNephmember,
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
                          
                          showButton(),
                          SizedBox(
                            height: 10.0,
                          )

                        ])
                      )
                  )
                ),
                
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Text(
                  'STATS',
                  style: TextStyle(fontFamily: 'Segoe UI', fontSize: 30,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )), SizedBox(
                            height: 20.0,
                          ),mychart1Items("Current Percent Error","$currenterror%",errordata)
                          , SizedBox(
                            height: 20.0,
                          ),mychart1Items("Current Percent Progress","+ $currentprogress%",progressdata)
                          , SizedBox(
                            height: 20.0,
                          ),mychart1Items("Current Volumn","+ $currentvolumn",volumn)
                          , SizedBox(
                            height: 20.0,)
                
                
                
                
              ])
          )
        )
      )
    );
  }
}