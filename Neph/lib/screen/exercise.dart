import 'dart:io';

import 'package:flutter/material.dart';
import 'package:neph/screen/doexercise.dart';
import 'package:neph/screen/table.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:neph/screen/backend.dart';

class Exercise extends StatefulWidget {
  @override
  final String name;
  final String dayExe;
  // final List<bool> isWorkoutDay;

  const Exercise ({ Key key, this.name ,this.dayExe}): super(key: key);

  _ExerciseState createState() => _ExerciseState();
}
class _ExerciseState extends State<Exercise>{
  String videoURL;
  String description;
  YoutubePlayerController _controller;
  @override
  void initState() {
    
      loadCategory();
      for(int i = 0 ; i< workoutList.length; i++){
      if (widget.name == workoutList[i][0]) {
        description = workoutList[i][2];
        print(workoutList[i][3]) ;
        if(workoutList[i][3] == null){videoURL = '';}
        else{
          videoURL = workoutList[i][3];
        }
        

    }}
      
    
      _controller = YoutubePlayerController(
      initialVideoId: videoURL, // id youtube video
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ));
    
    super.initState();
    // loadWorkoutList().then((value){setState(() {});});
    // workoutList.add(new Category(snapshot.get('Name'), snapshot.get('Image'), snapshot.get('Description')));
      
  
  
  }
  
  
  
  

  //Medthod
  
  Widget showAppName() {
    return Text(
      widget.name,
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
                    builder: (BuildContext context) => Tableex(widget.dayExe)));
          }),
    );
  }

  Widget exdiscription() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 90),
          child: Text(
            widget.name + ' Description',
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
             child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
                  child: Container( height: 120,
              child: Text(
                description,
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 16,
                  color: const Color(0xedffffff),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
               SafeArea(
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
                  height: 80.0,
                ),
                doButton(context),SizedBox(
                  height: 20.0,
                ),

            ],
          ),
              )),
        ),
      
    );
  }
}
