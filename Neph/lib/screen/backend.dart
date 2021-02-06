import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neph/screen/stats.dart';
String id = '';
List<String> day = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
List<String> part = ['Error','Progress','Reps','Sets','Weight'];
List<String> categoryAll = ['Back','Biceps Arm','Chest','Leg','Shoulder','Triceps Arm'];
Map<String,dynamic> user = {'Name':null,'Age':null,'Gender':null,'Height':null,'Weight':null,'haveSchedule':null,'Health Conditions':null,'Member':null,'Email':null};
List<List<String>> workoutList = [];
List<List<List<dynamic>>> workoutListday =  [];
List<List<List<dynamic>>> newWorkoutListday = [];
List<double> all = [];
List<double> errordata = [];
  List<double> progressdata =[];
  List<double> weightdata = [];
  List<double> repsdata = [];
  List<double> setsdata = [];
  List<double> volumn =[];
  String currenterror ='';
// List<List<List<dynamic>>>  = [];
bool ready = false;
List<bool> isWorkoutDay = [false,false,false,false,false,false,false];


List<List<List<bool>>> memberworkout = [];
List<List<List<String>>> allpartworkout = [];
List<List<String>> allformofweek  = []; 
List<List<List<String>>> mempartworkout = [];

int countdayexercise = 0;
int maxformperday=0;
int repperset=0;
int weight =0;
int sets =0;
String q1 = '';
String q2 = '';

void autogenfunction(){
    // loadMemberWorkout();
    allformofweek.clear();
    // loadMemberWorkout();
    resetvalue();
    maxformperday=0;
    repperset=0;
    weight =0;
    sets =0;
    // q1 = '';
    // q2 = '';
    countdayexercise=0;
    print('q1 = $q1');
    print('q2 = $q2');
    for (int countday = 0 ; countday<isWorkoutDay.length;countday++){
      if(isWorkoutDay[countday]==true){
        countdayexercise+=1;
      }
    }
    print('day =  $countdayexercise');
    int part = 2;
    
    if (q1 == 'Beginner'){
      weight = 5;
      sets = 3;
    }else{
      weight = 0;
      sets = 4;
    }
    if (q2 == 'Gain Muscle'){
      repperset=12;
      maxformperday=5;
    }
    else if (q2 == 'Lose weight'){
      repperset=15;
      maxformperday=6;
    }
    else{
      repperset=8;
      maxformperday=3;
      sets = 5;
      part = 3;
    }
    if(countdayexercise <3){
      part = 3;
      maxformperday = 7;
    }else if(countdayexercise<7){
      part = 2;
    }else if(countdayexercise == 7){
      part = 1;
    }
    
    List<String> temp = []; 
    int changeform = 0;
    int saveform = 0;
    int memoryformperday = maxformperday;
    bool member = user['Member'];
    //print('amount day = $countdayexercise');
    if(member){
      for (int i = 1; i<=countdayexercise; i++){
      //print('do it = $i');
      if ( countdayexercise > 5 && q2 != 'Strength'){
        maxformperday = 4;
      }else {
        maxformperday = memoryformperday;
      }
      temp = [];
        for(int x =0;x<2;x++){
          //print('do it x= $x');
          for(int k = 0;k<part;k++){
            //print('do it k= $k');
            if(saveform >=mempartworkout.length){
              saveform = 0;
              resetvalue();
              //print('Why !!!!!!!!!!!!!!!!!!!!!!');
            }
            if  (changeform >= mempartworkout.length){
              changeform = 0;
            }
            if (x == 0){
              changeform=0;
              changeform=saveform+k;
            }else{
              changeform=0;
              changeform=saveform+k;
            }
            
            for(int j =0;j<mempartworkout[changeform].length;j++){
              if(maxformperday <= 0){
                break;
              }
              if (x == 0){
                if( int.parse(mempartworkout[changeform][j][1]) == 3 && mempartworkout[changeform][j][2] != '-1' && maxformperday > 0){
                  temp.add(mempartworkout[changeform][j][0]);
                  mempartworkout[changeform][j][2]='-1';
                  maxformperday--;
                } 
              }
              if(x == 1){
                if( maxformperday > 0 && mempartworkout[changeform][j][2] != '-1' ){
                  temp.add(mempartworkout[changeform][j][0]);
                  mempartworkout[changeform][j][2]='-1';
                  maxformperday--;
                }
              }
            }
          }
        }
        //changeform = part +1;
        saveform += part;
        //changeform ++;
      allformofweek.add(temp);
    }

    }else{
        if(countdayexercise == 7){
        part = 2;
        } /// freeeeeeeeeeeeeeeeeeeeeeeeeeeeee
        for (int i = 1; i<=countdayexercise; i++){
        //print('do it = $i');
        if ( countdayexercise > 5 && q2 != 'Strength'){
          maxformperday = 4;
        }else {
          maxformperday = memoryformperday;
        }
        temp = [];
          for(int x = 0;x<2;x++){
            //print('do it x= $x');
            for(int k = 0;k<part;k++){
              //print('do it k= $k');
              if(saveform >=4){
                saveform = 0;
                resetvalue();
                //print('Why !!!!!!!!!!!!!!!!!!!!!!');
              }
              if  (changeform >= 4){
                changeform = 0;
              }
              if (x == 0){
                changeform=0;
                changeform=saveform+k;
              }else{
                changeform=0;
                changeform=saveform+k;
              }
              
              for(int j =0;j<mempartworkout[changeform].length;j++){
                if(maxformperday <= 0){
                  break;
                }
                if (x == 0){
                  if( int.parse(mempartworkout[changeform][j][1]) == 3 && mempartworkout[changeform][j][2] != '-1' && maxformperday > 0 && !memberworkout[changeform][j][0]){
                    temp.add(mempartworkout[changeform][j][0]);
                    mempartworkout[changeform][j][2]='-1';
                    maxformperday--;
                  } 
                }
                if(x == 1){
                  if( maxformperday > 0 && mempartworkout[changeform][j][2] != '-1' && !memberworkout[changeform][j][0]){
                    temp.add(mempartworkout[changeform][j][0]);
                    mempartworkout[changeform][j][2]='-1';
                    maxformperday--;
                  }
                }
              }
            }
          }
          //changeform = part +1;
          saveform += part;
          //changeform ++;
        allformofweek.add(temp);
            }
     
    }
    print('That finish');
    print('All exercise ===> $allformofweek');
}

  Future<void> loadMemberWorkout()async{
    List<List<bool>> backbool = [];
    List<List<bool>> legbool = [];
    List<List<bool>> biceparmbool = [];
    List<List<bool>> triceparmbool = [];
    List<List<bool>> chestbool = [];
    List<List<bool>> shoulderbool = [];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
      for (var i = 0; i < categoryAll.length; i++) {
        await firestore.collection('WorkoutList').doc('Category').collection(categoryAll[i]).snapshots().listen((event) {
          List<DocumentSnapshot> snapshots = event.docs;
          List<bool> temp = [];
          if(categoryAll[i] == 'Back'){
              for (var snapshot in snapshots) {
                temp = [];
                temp.add(snapshot.get('member'));
                backbool.add(temp);}
            }
            else if(categoryAll[i] == 'Biceps Arm'){
              for (var snapshot in snapshots) {
                temp = [];
                temp.add(snapshot.get('member'));
                biceparmbool.add(temp);
              }
            }
            else if(categoryAll[i] == 'Chest'){
              for (var snapshot in snapshots) {
                temp = [];
                temp.add(snapshot.get('member'));
                chestbool.add(temp);
              }
            }
            else if(categoryAll[i] == 'Leg'){
              for (var snapshot in snapshots) {
                temp = [];
                temp.add(snapshot.get('member'));
                legbool.add(temp);
              }
            }
            else if(categoryAll[i] == 'Shoulder'){
              for (var snapshot in snapshots) {
                temp = [];
                temp.add(snapshot.get('member'));
                shoulderbool.add(temp);

              }
            }
            else if(categoryAll[i] == 'Triceps Arm'){
              for (var snapshot in snapshots) {
                temp = [];
                temp.add(snapshot.get('member'));
                triceparmbool.add(temp);
              } 
            }
        }
      );
  }
    memberworkout.add(backbool);
    memberworkout.add(shoulderbool);
    memberworkout.add(chestbool);
    memberworkout.add(legbool);
    memberworkout.add(triceparmbool);
    memberworkout.add(biceparmbool);
  }

  Future<void> setisWorkoutDay()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    for (var i = 0; i < day.length; i++) {
      firestore.collection("Users").doc(id).collection('Schedule').doc(day[i]).update({'isWorkout_Day': isWorkoutDay[i]});
    }
  }

  Future<void> updatehaveSchedule()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("Users").doc(id).update({'haveSchedule': true});
  }

  Future<void> updateMember()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("Users").doc(id).update({'Member': true});
  }

  Future<void> setworkoutListday()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
      // workoutListday = new List<List<List<dynamic>>>.from(newWorkoutListday);
    for(var i = 0; i < workoutListday.length; i++){
      firestore.collection("Users").doc(id).collection('Schedule').doc(day[i]).set({'isWorkout_Day': isWorkoutDay[i]});
      // firestore.collection("Users").doc(id).collection('Schedule').doc(day[i]).update({'isWorkout_Day': isWorkoutDay[i]});
      for (var ii = 0; ii < workoutListday[i].length;ii++) {
        firestore.collection("Users").doc(id).collection('Schedule').doc(day[i]).update({ii.toString():[workoutListday[i][ii][0],workoutListday[i][ii][1],workoutListday[i][ii][2],workoutListday[i][ii][3]]});
      }
    }
  }

  Future<void> resetWorkoutlist()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    for(var i =0; i< day.length;i++){
      if(isWorkoutDay[i] == false){
        firestore.collection("Users").doc(id).collection('Schedule').doc(day[i]).set({'isWorkout_Day':false});
      }
    }
  }

  Future<void> loadworkoutListday()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
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
    // print('www => $workoutListday');
  }
  void loadtitle(){
    if(errordata.length == 0 ){
      currenterror = '0';
      errordata = [0];
      progressdata =[0];
      weightdata = [0];
      repsdata = [0];
      setsdata = [0];
      //volumn =[0];
      print('cometo zero');
    }
    else{print('como onnnnnnnnnnnnnnn');
      currenterror = (errordata[errordata.length - 1] * 100).toString();}
  }
  Future<void> loadstats()async{
    //all.clear();
    errordata.clear();
    progressdata.clear();
    repsdata.clear();
    setsdata.clear();
    weightdata.clear();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    for (var i = 0; i < part.length; i++) {
      
      await firestore.collection('Users').doc(id).collection('Stats').doc(part[i]).get().then((value){ 
          //List<String> part = ['Error','Progress','Reps','Sets','Weight'];
          if(part[i] == 'Error'){
            errordata.add(value.get('day1').toDouble());
            errordata.add(value.get('day2').toDouble());
            errordata.add(value.get('day3').toDouble());
            errordata.add(value.get('day4').toDouble());
            errordata.add(value.get('day5').toDouble());
            errordata.add(value.get('day6').toDouble());
            errordata.add(value.get('day7').toDouble());
            currenterror = (errordata[errordata.length - 1] * 100).toString();
            print('Error = $errordata');
          }else if(part[i] == 'Progress'){
            
            progressdata.add(value.get('day1').toDouble());
            progressdata.add(value.get('day2').toDouble());
            progressdata.add(value.get('day3').toDouble());
            progressdata.add(value.get('day4').toDouble());
            progressdata.add(value.get('day5').toDouble());
            progressdata.add(value.get('day6').toDouble());
            progressdata.add(value.get('day7').toDouble());
            print('Progress = $progressdata');
          
          
          }else if(part[i] == 'Reps'){
            
            repsdata.add(value.get('day1').toDouble());
            repsdata.add(value.get('day2').toDouble());
            repsdata.add(value.get('day3').toDouble());
            repsdata.add(value.get('day4').toDouble());
            repsdata.add(value.get('day5').toDouble());
            repsdata.add(value.get('day6').toDouble());
            repsdata.add(value.get('day7').toDouble());
            print('Reps = $repsdata');
          
          }else if(part[i] == 'Sets'){
            
            setsdata.add(value.get('day1').toDouble());
            setsdata.add(value.get('day2').toDouble());
            setsdata.add(value.get('day3').toDouble());
            setsdata.add(value.get('day4').toDouble());
            setsdata.add(value.get('day5').toDouble());
            setsdata.add(value.get('day6').toDouble());
            setsdata.add(value.get('day7').toDouble());
            print('Sets = $setsdata');
          
          }else if(part[i] == 'Weight'){
            
            weightdata.add(value.get('day1').toDouble());
            weightdata.add(value.get('day2').toDouble());
            weightdata.add(value.get('day3').toDouble());
            weightdata.add(value.get('day4').toDouble());
            weightdata.add(value.get('day5').toDouble());
            weightdata.add(value.get('day6').toDouble());
            weightdata.add(value.get('day7').toDouble());
            print('Weigth = $weightdata');
          
          }
          
          
          // for (var snapshot in snapshots) {
          //       print('Here ================= ');
          //       
          //     }
          
        
        
      });
    }
    //print('all===$all.length');
    
  }
  // Future<void> loadisWorkoutDay()async{
  //   for (var i = 0; i < day.length; i++) {
  //     await firestore.collection('Users').doc(id).collection('Schedule').doc(day[i]).get().then((value) => isWorkoutDay[i] = value.get('isWorkout_Day'));
  //   }
  // }
  
  Future<void> loadUser()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('Users').doc(id).get().then((value){
      user['Name'] = value.get('Name');
      user['Age'] = value.get('Age');
      user['Gender'] = value.get('Gender');
      user['Height'] = value.get('Height');
      user['Weight'] = value.get('Weight');
      user['haveSchedule'] = value.get('haveSchedule');
      user['Health Conditions'] = value.get('Health Conditions');
      user['Member'] = value.get('Member');
      user['Email'] = value.get('Email');
    });
  }

  Future<void> loadWorkoutList()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
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
          temp.add(snapshot.get('member').toString());
          workoutList.add(temp);
        }
      });
    }
  }

Future<void> loadCategory()async{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<List<String>> back = [];
  List<List<String>> leg = [];
  List<List<String>> biceparm = [];
  List<List<String>> triceparm = [];
  List<List<String>> chest = [];
  List<List<String>> shoulder = [];
  allpartworkout.clear();
  mempartworkout.clear();
    for (var i = 0; i < categoryAll.length; i++) {
      await firestore.collection('WorkoutList').doc('Category').collection(categoryAll[i]).snapshots().listen((event) {
        List<DocumentSnapshot> snapshots = event.docs;
        List<String> temp = [];
         if(categoryAll[i] == 'Back'){
            for (var snapshot in snapshots) {
              temp = [];
              temp.add(snapshot.get('Name'));
              temp.add(snapshot.get('priority'));
              temp.add('1');
              //back.add(new List.of(temp));}
              back.add(temp);}
          }
          else if(categoryAll[i] == 'Biceps Arm'){
            for (var snapshot in snapshots) {
              temp = [];
              temp.add(snapshot.get('Name'));
              temp.add(snapshot.get('priority'));
              temp.add('1');
              //biceparm.add(new List.of(temp));
              biceparm.add(temp);
            }
          }
          else if(categoryAll[i] == 'Chest'){
            for (var snapshot in snapshots) {
              temp = [];
              temp.add(snapshot.get('Name'));
              temp.add(snapshot.get('priority'));
              temp.add('1');
              //chest.add(new List.of(temp));
              chest.add(temp);
            }
          }
          else if(categoryAll[i] == 'Leg'){
            for (var snapshot in snapshots) {
              temp = [];
              temp.add(snapshot.get('Name'));
              temp.add(snapshot.get('priority'));
              temp.add('1');
              //leg.add(new List.of(temp));
              leg.add(temp);
            }
          }
          else if(categoryAll[i] == 'Shoulder'){
            for (var snapshot in snapshots) {
              temp = [];
              temp.add(snapshot.get('Name'));
              temp.add(snapshot.get('priority'));
              temp.add('1');
              //shoulder.add(new List.of(temp));
              shoulder.add(temp);
              
            }
          }
          else if(categoryAll[i] == 'Triceps Arm'){
            for (var snapshot in snapshots) {
              temp = [];
              temp.add(snapshot.get('Name'));
              temp.add(snapshot.get('priority'));
              temp.add('1');
              //triceparm.add(new List.of(temp));
              triceparm.add(temp);
              // print('Temp in tricep = $temp');
              // print('tricep = $triceparm');
            } 
          }
      }
    );
    
  }
    //print('tricep out main = $triceparm');
    // allpartworkout.add(new List.of(back));
    // allpartworkout.add(new List.of(shoulder));
    // allpartworkout.add(new List.of(chest));
    // allpartworkout.add(new List.of(leg));
    // allpartworkout.add(new List.of(triceparm));
    // allpartworkout.add(new List.of(biceparm));
    allpartworkout.add(back);
    allpartworkout.add(shoulder);
    allpartworkout.add(chest);
    allpartworkout.add(leg);
    allpartworkout.add(triceparm);
    allpartworkout.add(biceparm);
    mempartworkout = new List.of(allpartworkout);
    // print('load time mempartworkout = $mempartworkout');
    // print('load time allpartworkout = $allpartworkout');
}

void resetvalue(){
  for (int i = 0 ; i<mempartworkout.length;i++){
    for (int j = 0 ; j<mempartworkout[i].length;j++){
        mempartworkout[i][j][2]='1';
        //print('This is my change $mempartworkout[i][j][2]');
    }
  }
}

