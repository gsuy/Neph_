import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
String id = '';
List<String> day = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
List<String> categoryAll = ['Back','Biceps Arm','Chest','Leg','Shoulder','Triceps Arm'];
Map<String,dynamic> user = {'Age':null,'Email':null,'Goal':null,'Height':null,'Name':null,'Password':null,'Sex':null,'Weight':null,'haveSchedule':null};
List<List<String>> workoutList = [];
List<List<List<dynamic>>> workoutListday =  [];
List<List<List<dynamic>>> newWorkoutListday = [];
// List<List<List<dynamic>>>  = [];
bool ready = false;
List<bool> isWorkoutDay = [false,false,false,false,false,false,false];

List<List<String>> back = [];
List<List<String>> leg = [];
List<List<String>> biceparm = [];
List<List<String>> triceparm = [];
List<List<String>> chest = [];
List<List<String>> shoulder = [];
List<List<List<String>>> allpartworkout = [];

List<String> formgen  = []; 
List<List<String>> allformofweek  = []; 
List<List<List<String>>> mempartworkout = [];

int countdayexercise = 4;
int maxformperday=0;
int repperset=0;
int weigth =0;
String q1 = 'Beginner';
String q2 = 'Gain Muscle';

FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> setisWorkoutDay()async{
    for (var i = 0; i < day.length; i++) {
      firestore.collection("Users").doc(id).collection('Schedule').doc(day[i]).update({'isWorkout_Day': isWorkoutDay[i]});
    }
  }

  Future<void> setworkoutListday()async{
      workoutListday = new List<List<List<dynamic>>>.from(newWorkoutListday);
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
    newWorkoutListday = [];
    List<List<dynamic>> temp = [];
    // List<List<dynamic>> temp2 = [];
    for (var i = 0; i < day.length; i++) {
      temp = [];
      await firestore.collection('Users').doc(id).collection('Schedule').doc(day[i]).get().then((value) => value.data().forEach((key, value) { 
        if(key != 'isWorkout_Day'){
          temp.add(value);
          // temp2.add(value);
        }else{
          isWorkoutDay[i] = value;
        }
      }));
      workoutListday.add(new List<List<dynamic>>.from(temp));
      newWorkoutListday.add(new List<List<dynamic>>.from(temp));
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


void autogenfunction(){

    if (q1 == 'Beginner'){
      weigth = 5;
    }else{
      weigth = 0;
    }

    if (q2 == 'Gain Muscle'){
      repperset=12;
      maxformperday=6;
    }
    else if (q2 == 'Lose weight'){
      repperset=15;
      maxformperday=6;
    }
    else{
      repperset=8;
      maxformperday=3;
    }

    List<String> temp = []; 
    int k = 0; 
    int memoryformperday = maxformperday;
    for (var i = 0;i<countdayexercise;i++){
      if ( countdayexercise > 5 && q2 != 'Strength'){
        maxformperday = 4;
        memoryformperday = maxformperday;
      }else {
        maxformperday = memoryformperday;
      }
      int cout = 0;
      temp = [];
      while (maxformperday != 0) {
          print('current maxformperday ==>$maxformperday');
          print('current mempartworkout ==>$maxformperday');
          print('current k ===> $k');
          print('cout==> $cout');
          cout += 1;
          print(mempartworkout[k]);
          for (var l =0;i<mempartworkout[k].length;l++){
            print('test');
            // if (int.parse(mempartworkout[k][l][1]) > 1){
              temp.add(mempartworkout[k][l][0]);
              mempartworkout.remove(mempartworkout[k][l]);
              //removeform
              maxformperday--;
            // }
            // else if(maxformperday < 3){
            //   temp.add(allpartworkout[k][l][0]);
            //   mempartworkout.remove(mempartworkout[k][l]);
            //   maxformperday--;
            // }

               if(k%2 == 0 && maxformperday != 0 && k != 0){
                 k -=2;
               }
          }
            k++;
      }
         k++;
      allformofweek.add(temp);
    }
    print('sadasd4 ===> $allformofweek');
}

Future<void> loadCategory()async{
    for (var i = 0; i < categoryAll.length; i++) {
      await firestore.collection('WorkoutList').doc('Category').collection(categoryAll[i]).snapshots().listen((event) {
        List<DocumentSnapshot> snapshots = event.docs;
        List<String> temp = [];
         if(categoryAll[i] == 'Back'){
            for (var snapshot in snapshots) {
              temp = [];
              temp.add(snapshot.get('Name'));
              temp.add(snapshot.get('priority'));
              back.add(temp);}
          }
          else if(categoryAll[i] == 'Biceps Arm'){
            for (var snapshot in snapshots) {
              temp = [];
              temp.add(snapshot.get('Name'));
              temp.add(snapshot.get('priority'));
              biceparm.add(temp);
            }
          }
          else if(categoryAll[i] == 'Chest'){
            for (var snapshot in snapshots) {
              temp = [];
              temp.add(snapshot.get('Name'));
              temp.add(snapshot.get('priority'));
              chest.add(temp);
            }
          }
          else if(categoryAll[i] == 'Leg'){
            for (var snapshot in snapshots) {
              temp = [];
              temp.add(snapshot.get('Name'));
              temp.add(snapshot.get('priority'));
              leg.add(temp);
            }
          }
          else if(categoryAll[i] == 'Shoulder'){
            for (var snapshot in snapshots) {
              temp = [];
              temp.add(snapshot.get('Name'));
              temp.add(snapshot.get('priority'));
              shoulder.add(temp);
            }
          }
          else if(categoryAll[i] == 'Triceps Arm'){
            for (var snapshot in snapshots) {
              temp = [];
              temp.add(snapshot.get('Name'));
              temp.add(snapshot.get('priority'));
              triceparm.add(temp);
        }
            
          }
      });
    }
    allpartworkout.add(back);
    allpartworkout.add(shoulder);
    allpartworkout.add(chest);
    allpartworkout.add(leg);
    allpartworkout.add(triceparm);
    allpartworkout.add(biceparm);
    mempartworkout = new List<List<List<String>>>.from(allpartworkout);
  }