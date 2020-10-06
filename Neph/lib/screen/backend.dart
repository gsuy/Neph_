import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
String id = '';
List<String> day = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
List<String> categoryAll = ['Back','Biceps Arm','Chest','Leg','Shoulder','Triceps Arm'];
Map<String,dynamic> user = {'Age':null,'Email':null,'Goal':null,'Height':null,'Name':null,'Password':null,'Sex':null,'Weight':null,'haveSchedule':null};
List<List<String>> workoutList = [];
List<List<List<dynamic>>> workoutListday,newWorkoutListday = [];
// List<List<List<dynamic>>>  = [];
bool ready = false;
List<bool> isWorkoutDay = [false,false,false,false,false,false,false];
FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> setisWorkoutDay()async{
    for (var i = 0; i < day.length; i++) {
      firestore.collection("Users").doc(id).collection('Schedule').doc(day[i]).update({'isWorkout_Day': isWorkoutDay[i]});
    }
  }

  Future<void> setworkoutListday()async{
      for(var i = 0; i < workoutListday.length; i++){
        firestore.collection("Users").doc(id).collection('Schedule').doc(day[i]).set({'isWorkout_Day': isWorkoutDay[i]});
        // firestore.collection("Users").doc(id).collection('Schedule').doc(day[i]).update({'isWorkout_Day': isWorkoutDay[i]});
        for (var ii = 0; ii < workoutListday[i].length;ii++) {
          firestore.collection("Users").doc(id).collection('Schedule').doc(day[i]).update({ii.toString():[workoutListday[i][ii][0],workoutListday[i][ii][1],workoutListday[i][ii][2],workoutListday[i][ii][3]]});
        }
      }
  }

  Future<void> resetWorkoulist()async{
    for(var i =0; i< day.length;i++){
      if(isWorkoutDay[i] == false){
        firestore.collection("Users").doc(id).collection('Schedule').doc(day[i]).set({'isWorkout_Day':false});
      }
    }
  }

  Future<void> loadworkoutListday()async{
    workoutListday = [];
    List<List<dynamic>> temp = [];
    for (var i = 0; i < day.length; i++) {
      temp = [];
      await firestore.collection('Users').doc(id).collection('Schedule').doc(day[i]).get().then((value) => value.data().forEach((key, value) { 
        if(key != 'isWorkout_Day'){
          temp.add(value);
        }else{
          isWorkoutDay[i] = value;
        }
      }));
      workoutListday.add(temp);
    }
  }

  // Future<void> loadisWorkoutDay()async{
  //   for (var i = 0; i < day.length; i++) {
  //     await firestore.collection('Users').doc(id).collection('Schedule').doc(day[i]).get().then((value) => isWorkoutDay[i] = value.get('isWorkout_Day'));
  //   }
  // }

  Future<void> loadUser()async{
      await firestore.collection('Users').doc(id).get().then((value){
        user['Age'] = value.get('Age');
        user['Email'] = value.get('Email');
        user['Goal'] = value.get('Goal');
        user['Height'] = value.get('Height');
        user['Name'] = value.get('Name');
        user['Password'] = value.get('Password');
        user['Sex'] = value.get('Sex');
        user['Weight'] = value.get('Weight');
        user['haveSchedule'] = value.get('haveSchedule');
      });
  }

  Future<void> loadWorkoutList()async{
    workoutList = [];
    for (var i = 0; i < categoryAll.length; i++) {
      await firestore.collection('WorkoutList').doc('Category').collection(categoryAll[i]).snapshots().listen((event) {
        List<DocumentSnapshot> snapshots = event.docs;
        List<String> temp = [];
        for (var snapshot in snapshots) {
          temp = [];
          temp.add(snapshot.get('Name'));
          temp.add(snapshot.get('Image'));
          temp.add(snapshot.get('Description'));
          temp.add(snapshot.get('Link'));
          workoutList.add(temp);
        }
      });
    }
  }