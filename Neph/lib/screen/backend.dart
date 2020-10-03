import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
String id = '';
String testtttt = "I am Guy.";
List<String> day = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
List<bool> isWorkoutDay = [false,false,false,false,false,false,false];

  Future<void> setisWorkoutDay()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    for (var i = 0; i < 7; i++) {
      firestore.collection("Users").doc(id).collection('Schedule').doc(day[i]).update({'isWorkout_Day': isWorkoutDay[i]});
    }
  }

  Future<void> loadisWorkoutDay()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
      for (var i = 0; i < 7; i++) {
        await firestore.collection('Users').doc(id).collection('Schedule').doc(day[i]).get().then((value) => isWorkoutDay[i] = value.get('isWorkout_Day'));
    }
  }