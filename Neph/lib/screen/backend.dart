import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
String id = '';
List<String> day = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
List<String> categoryAll = ['Back','Biceps Arm','Chest','Leg','Shoulder','Triceps Arm'];
// List<List<String>> workoutList = [['1111','2222','ne asd a asd'],['12323','asdadad','aas sd sss']];
List<List<String>> workoutList = [];
// List<String> test = ['123','12313','123123'];
List<bool> isWorkoutDay = [false,false,false,false,false,false,false];
// List<QueryDocumentSnapshot> workoutList;
FirebaseFirestore firestore = FirebaseFirestore.instance;
// List<var> test = null;

// @protected
// class Category {
//   String name;
//   String image;
//   String description;

//   Category(String name,String image,String description){
//     this.name = name;
//     this.image = image;
//     this.description = description;
//   }
// }

// List<Category> workoutList = [];
// @protected



  Future<void> setisWorkoutDay()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    for (var i = 0; i < 7; i++) {
      firestore.collection("Users").doc(id).collection('Schedule').doc(day[i]).update({'isWorkout_Day': isWorkoutDay[i]});
    }
  }

  Future<void> loadisWorkoutDay()async{
    for (var i = 0; i < 7; i++) {
      await firestore.collection('Users').doc(id).collection('Schedule').doc(day[i]).get().then((value) => isWorkoutDay[i] = value.get('isWorkout_Day'));
    }
  }

  Future<bool> loadWorkoutList()async{
    // for (var i = 0; i < categoryAll.length; i++) {
    //   firestore.collection('WorkoutList').doc('Category').collection(categoryAll[i]).get().then((value) => value.docs.forEach((element) {
    //     // Category temp = new Category(element.get('Name'),element.get('Image'),element.get('Description'));
    //     print('ttttttt===>${element.get('Name')}');
    //     }));
    // }
    // workoutList = [];
    for (var i = 0; i < categoryAll.length; i++) {
      var a = await firestore.collection('WorkoutList').doc('Category').collection(categoryAll[i]).snapshots().listen((event) {
        List<DocumentSnapshot> snapshots = event.docs;
        List<String> temp = [];
        for (var snapshot in snapshots) {
          temp = [];
          temp.add(snapshot.get('Name'));
          temp.add(snapshot.get('Image'));
          temp.add(snapshot.get('Description'));
          workoutList.add(temp);
        }
      });
    }
    return true;
  }