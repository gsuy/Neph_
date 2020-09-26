import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Food extends StatefulWidget{
  @override
  FoodState createState() => FoodState();
}

class FoodState extends State<Food>{
  final formKey = GlobalKey<FormState>();
  List<String> list = [];
  Set<String> show = new Set();
  // String value_ = "";
  final input = TextEditingController();
  // final dbRef = FirebaseDatabase.instance.reference().child("Foodlist");
  @override
  void initState() {
    // print("test : $dbRef");
    super.initState();
    readAllData();
  }
  
  Future<void> readAllData()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference collectionReference = firestore.collection('Foodlist');
    // WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp();
    // var db = firebase.firestore();
    await collectionReference.snapshots().listen((res) {
      List<DocumentSnapshot> snapshots = res.docs;
      print("Start..................");
      for (var snapshot in snapshots) {
        // print('snapshot $snapshot');
        // print("Name = ${snapshot.data()}");
        // print("Name = ${snapshot.get('Name')}");
        list.add(snapshot.get('Name'));
      }
    });
  }

  Widget searchPart(){
    return Form(key: formKey,
          child: Container(
          width: 320.0,
          height: 50,
          child: new Theme(
            data: new ThemeData(
                primaryColor: const Color(0xff2aafaf),
                primaryColorDark: const Color(0xff2aafaf),
                hintColor: const Color(0xff2aafaf)),
            child: new TextField(
              controller: input,
              decoration: new InputDecoration(
                hintText: 'Search',
                enabled: true,
                filled: true,
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xff2aafaf),
                  size: 35
                ),
                fillColor: Color(0xffe7f9f9),
                border: new OutlineInputBorder(
                  borderSide:
                      new BorderSide(color: const Color(0xff2aafaf), width: 10.0),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(20.0)),
                ),
                labelText: '   Search for meal...',
                labelStyle: TextStyle(color: const Color(0xff2aafaf)),
              ),
              onChanged: (value){
                // setState(() {
                  // print("value: ${input.text}");

                  // print('value ${formKey.currentContext}');
                  show.clear();
                  for(var i = 0; i < list.length; i++){
                    if(list[i].toLowerCase().contains(input.text.toLowerCase())){
                      show.add(list[i]);

                    // }else if(value == ""){
                    //   show = list;
                    // }
                   }
                  }
                  // print("set: $sshow");
                  setState(() {
                    
                  });
                // );
              },
              // onSubmitted: (value){
              // },
            ),
          )),
    );
  }

  Widget showView(){
    return Expanded(
      child: ListView.builder(
          itemCount: show.length,
          itemBuilder: (BuildContext context, int index){
            return 
            Container(
              height: 50,
              width: 50,
              child: 
              Center(child: Text(show.toList()[index],style: TextStyle(fontSize: 15)))
            );
      })
    );
  }

  Widget foodPart(){
     return Container(
      width:375,
      height:620,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: Colors.white
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 10),
          searchPart(),
          SizedBox(height: 20),
          showView()
        ],
      )
    );
  }

  Widget back(){
    return Container(
      child:
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 25
            ),
              onPressed: (){
                int a = 0;
              }),
          
          SizedBox(
            width: 320.0,
          ),
        ]
      )
    );
  }

  Widget namePage(){
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          SizedBox(
            width: 20.0,
          ),

          Icon(
            Icons.fastfood,
            color: Colors.black,
            size: 35
          ),

          SizedBox(
            width: 10.0,
          ),

          Text('BREAKFAST',style: TextStyle(fontFamily: 'Segoe UI',
            fontSize: 20,fontWeight: FontWeight.bold)),

          SizedBox(
            width: 210.0,
          ),
        ]
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: SingleChildScrollView( 
            child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min, children: <Widget>[

              SizedBox(
                height: 10.0,
              ),

              back(),

              SizedBox(
                height: 5.0,
              ),

              namePage(),

              SizedBox(
                  height: 20.0,
                ),
              Center(child: foodPart()),
            ])
          ),
        ),
        backgroundColor: Color(0xffe7f9f9),
    );
  }
}