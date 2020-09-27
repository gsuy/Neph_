import 'package:flutter/material.dart';
import 'package:neph/screen/table.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Exercise extends StatelessWidget {
  var link='dsxz';
  void checklink() {
    if (data == 'Brench Press') {
      link = 'rT7DgCr-3pg';
    } else {
      link = 'z1iYIk7Jn-I';
    }
  }

  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'z1iYIk7Jn-I', // id youtube video
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ));

  //Medthod
  String data;
  Exercise({this.data});
  Widget showAppName() {
    return Text(
      data,
      style: TextStyle(
        fontFamily: 'Segoe UI',
        fontSize: 20,
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
                MaterialPageRoute(builder: (BuildContext context) => Tableex());
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
                    builder: (BuildContext context) => Tableex()));
          }),
    );
  }

  Widget exdiscription() {
    return Column(
      children: [
        Text(
          data + ' Description',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 20,
            color: const Color(0xedffffff),
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Leomsad asdxcz, as',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 20,
            color: const Color(0xedffffff),
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color(0xff204149), Colors.black.withOpacity(0.9)],
          stops: [0.6, 1],
        )),
        child: Center(
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
            exdiscription(),
            SizedBox(
              height: 100.0,
            ),
            doButton(context)
          ],
        )),
      )),
    );
  }
}
