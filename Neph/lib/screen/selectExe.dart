import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:neph/screen/backend.dart';
import 'package:neph/screen/table.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Select extends StatefulWidget{
  final int toDay;
  Select(this.toDay);
  @override
  _SelectState createState() => _SelectState(toDay: toDay);
}

class _SelectState extends State<Select>{
  int toDay;
  _SelectState({this.toDay});
  final formKey = GlobalKey<FormState>();
  List<String> list = [];
  Set<String> show = new Set();
  // Map<List<String>,List<String>> show;
  List<Map<List<String>,List<String>>> ss;
  final input = TextEditingController();

@override
void initState() {
  super.initState();
  // loadWorkoutList();
  // loadWorkoutList().then((value){setState(() {});});
  // workoutList.add(new Category(snapshot.get('Name'), snapshot.get('Image'), snapshot.get('Description')));
  // fetchData();
}

Future<void> fetchData() => Future.delayed(Duration(seconds: 1), () {
      if(workoutList.length!=0){
        setState(() {

        });
      }else{
        fetchData();
      }
      });

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
                  // show.clear();
                  // for(var i = 0; i < list.length; i++){
                  //   if(list[i].toLowerCase().contains(input.text.toLowerCase())){
                  //     show.add(list[i]);
                  //  }
                  // }
                  // setState(() {
                    
                  // });
              },
              // onSubmitted: (value){
              // },
            ),
          )),
    );
  }

Widget tip(String des){
  return Align(
    alignment: Alignment.topRight,
    child: Tooltip(
                  child: IconButton(icon: Icon(Icons.info,size: 30,),onPressed: (){}),
                  message: des,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  showDuration: Duration(seconds: 10),
                  decoration: BoxDecoration(
                    color: Colors.teal[100].withOpacity(0.9),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                  ),
                  textStyle: TextStyle(color: Colors.black),
                  // preferBelow: true,
                  verticalOffset: 20,
                )
  );
}

  Widget showView(){
    return Expanded(
      child: ListView.builder(
          itemCount: (workoutList.length/2).floor(),
          itemBuilder: (BuildContext context, int index){
            return 
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        GestureDetector(
                          onDoubleTap: (){
                            bool temp = false;
                            print('cilck left!!!');
                            for (var i in newWorkoutListday[toDay]) {
                              if(i[0] == workoutList[index*2][0]){
                                temp = true;
                              }
                            }
                            if(temp==false){
                              setState(() {
                                newWorkoutListday[toDay].add([workoutList[index*2][0],'0','0','0']);
                                Navigator.pop(context,true);
                              });
                            }else{
                              Navigator.pop(context,true);
                            }
                            // MaterialPageRoute(
                            //   builder: (BuildContext context) => Tableex('Tu'));
                          },
                          child: Container(
                          width:150,
                          height:150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            image:  DecorationImage(
                              image: NetworkImage(workoutList[index*2][1]),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Column(children: [
                            SizedBox(
                              height: 120.0,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(workoutList[index*2][0],style: TextStyle(backgroundColor: Colors.white, fontWeight: FontWeight.w700,fontSize: 13,color: Colors.deepOrangeAccent)),
                            ),
                            ]),
                        ),
                        ),

                        SizedBox(
                              width: 60.0,
                            ),
                            
                          tip(workoutList[index*2][2]),
                      ],
                    ),                    

                    SizedBox(
                      width: 30.0,
                    ),

                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        GestureDetector(
                          onDoubleTap: (){
                            bool temp = false;
                            print('cilck right!!!');
                            for (var i in newWorkoutListday[toDay]) {
                              if(i[0] == workoutList[index*2+1][0]){
                                temp = true;
                              }
                            }
                            if(temp==false){
                              setState(() {
                                newWorkoutListday[toDay].add([workoutList[index*2+1][0],'0','0','0']);
                                Navigator.pop(context,true);
                              });
                            }else{
                              Navigator.pop(context,true);
                            }
                          },
                          child: Container(
                          width:150,
                          height:150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            image:  DecorationImage(
                              image: NetworkImage(workoutList[(index*2)+1][1]),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Column(children: [
                            SizedBox(
                              height: 120.0,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(workoutList[(index*2)+1][0],style: TextStyle(backgroundColor: Colors.white,fontWeight: FontWeight.w700,fontSize: 13,color: Colors.deepOrangeAccent)),
                            ),
                            ]),
                        ),
                        ),

                        SizedBox(
                              width: 60.0,
                            ),
                            
                          tip(workoutList[(index*2)+1][2]),
                      ],
                    ),    
                  ])
              ],
            );
      })
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


Widget backButton(){
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
                Navigator.pop(context);
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

                backButton(),

                SizedBox(
                    height: 30.0,
                  ),
                Center(child: foodPart()),
              ])),
        )
            // return Center(child: CircularProgressIndicator(),
    );
  }
}