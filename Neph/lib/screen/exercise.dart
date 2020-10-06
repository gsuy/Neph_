import 'package:flutter/material.dart';
import 'package:neph/screen/doexercise.dart';
import 'package:neph/screen/table.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Exercise extends StatelessWidget {
  
  void checklink() {
    
    if (name == 'Brench Press') {
              
      _controller.load('rT7DgCr-3pg');
    } else {
    
      _controller.initialVideoId.replaceAll('', 'z1iYIk7Jn-I') ;
    }
  }
 
  
  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'z1iYIk7Jn-I', // id youtube video
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ));

  //Medthod
  final String name;
  final String dayExe;
  // final List<bool> isWorkoutDay;
  Exercise({this.name,this.dayExe});
  Widget showAppName() {
    return Text(
      name,
      style: TextStyle(
        fontFamily: 'Segoe UI',
        fontSize: 24,
        color: const Color(0xedffffff),
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget doButton(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      child: RaisedButton(
          color: const Color(0xff4f6165),
          child: Text(
            'Do Exercise',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
          onPressed: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => MyApp());
            Navigator.of(context).push(materialPageRoute);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }

  Widget closeButton(BuildContext context) {
    return Container(
      child: IconButton(
          icon: Icon(
            Icons.close,
            size: 30,
            color: Colors.white,
          ),
          color: Colors.teal.shade900,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Tableex(dayExe)));
          }),
    );
  }

  Widget exdiscription() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 90),
          child: Text(
            name + ' Description',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 20,
              color: const Color(0xedffffff),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ),SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Leomsad asdxcz, as sadsa zxcxzcxz xczbcas\nzxcsadaszxcxzc cvzvczxcxzcxzcxz cxzc xzcx\nsadsadsadsadsad' ,
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 16,
              color: const Color(0xedffffff),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ),
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
          colors: [const Color(0xff204149), Colors.black.withOpacity(0.9)],
          stops: [0.6, 1],
        )),
        
            child: Align(
              alignment:  Alignment.topCenter,
              child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
              
              SizedBox(
                height: 15.0,
              ),
              Align(alignment: Alignment.topRight, child: closeButton(context)),
              showAppName(),
              SizedBox(
                height: 20.0,
              ),
              YoutubePlayer(
                
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
              ),
              SizedBox(
                height: 20.0,
              ),
              Align(alignment: Alignment.centerLeft,child: exdiscription()),
              SizedBox(
                height: 100.0,
              ),
              doButton(context)
          ],
        ),
            )),
      ),
    );
  }
}
