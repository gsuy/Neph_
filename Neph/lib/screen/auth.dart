import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neph/screen/home.dart';
import 'package:neph/screen/login.dart';
String email = '';
String pass = '';
String uid = '';
List<String> day = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];

Future<void> register()async{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  await firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass)
  .then((res){
    print('Register success for email $email.');
    signIn();
  })
  .catchError((onError){
    String title = onError.code;
    String err = onError.message;
    print('title = $title, message = $err');
  });
}

Future<void> signIn()async{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  await firebaseAuth.signInWithEmailAndPassword(email: email, password: pass).then((value){
    uid = value.user.uid;
  });
}

Future<void> signOut()async{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  await firebaseAuth.signOut();
}

Future<void> createUser(String name,String age,String weight,String height,String gender,String goal,String heal)async{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  await firestore.collection("Users").doc(uid).set({
    'Name': name,
    'Age': age,
    'Weight': weight,
    'Height': height,
    'Gender': gender,
    'Goal': goal,
    'Health Conditions' : heal,
    'haveSchedule': false,
    'Member' : false,
    });
  for (var i in day) {
    await firestore.collection("Users").doc(uid).collection('Schedule').doc(i).set({
    'isWorkout_Day': false
    });
  }
}