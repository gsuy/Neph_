import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Select extends StatefulWidget{
  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select>{
  final formKey = GlobalKey<FormState>();
  List<String> list = [];
  Set<String> show = new Set();
  final input = TextEditingController();

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
                labelText: '   Search for a exercise.',
                labelStyle: TextStyle(color: const Color(0xff2aafaf)),
              ),
              onChanged: (value){
                  show.clear();
                  for(var i = 0; i < list.length; i++){
                    if(list[i].toLowerCase().contains(input.text.toLowerCase())){
                      show.add(list[i]);
                   }
                  }
                  setState(() {
                    
                  });
              },
              // onSubmitted: (value){
              // },
            ),
          )),
    );
  }

Widget showView(){
    // return Expanded(
    //   child: ListView.builder(
    //       itemCount: show.length,
    //       itemBuilder: (BuildContext context, int index){
    //         return 
    //         Container(
    //           height: 50,
    //           width: 50,
    //           child: 
    //           Center(child: Text(show.toList()[index],style: TextStyle(fontSize: 15)))
    //         );
    //   })
    // );
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width:150,
                height:150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white
                ),
              ),

               SizedBox(
                width: 30.0,
              ),

              Container(
                width:150,
                height:150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white
                ),
              ),

            ]),

        ],
      ),
    );
  }

  Widget foodPart(){
     return Container(
      width:375,
      height:620,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(40),
      //     topRight: Radius.circular(40),
      //   ),
      //   color: Colors.white
      // ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 10),
          searchPart(),
          SizedBox(height: 40),
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
              color: Colors.white,
              size: 20
            ),
              onPressed: (){
                int a = 0;
              }),
          
          SizedBox(
            width: 30.0,
          ),
          Text("SELECT EXERCISE",style: TextStyle(fontSize: 20,color: Colors.white))
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff163737),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
              mainAxisSize: MainAxisSize.min, children: <Widget>[

              SizedBox(
                height: 10.0,
              ),

              back(),

              // SizedBox(
              //   height: 5.0,
              // ),

              // namePage(),

              SizedBox(
                  height: 30.0,
                ),
              Center(child: foodPart()),
            ])),
      ),
    );
  }
}