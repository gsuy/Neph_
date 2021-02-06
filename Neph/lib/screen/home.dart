import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:neph/screen/calculatorcal.dart';
import 'package:neph/screen/payment.dart';
import 'package:neph/screen/plansche.dart';
import 'package:neph/screen/plansuccess.dart';
import 'package:neph/screen/profile.dart';
import 'package:neph/screen/stats.dart';
import 'package:neph/screen/backend.dart';
import 'package:neph/screen/auth.dart';
import 'package:neph/screen/testgraph.dart';
import 'package:adobe_xd/pinned.dart';
  
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String isNephmember = '';
  
  
  //Medthod
  @override
  void initState() {
    super.initState();
    id = uid;
    print('Connect Home!!!.');
    print('id ====>>>> $id');
    loadstats();
    loadUser();
    loadWorkoutList();
    loadworkoutListday();
    loadCategory();
    loadMemberWorkout();
    loadtitle();
    //loadcatastats();
    fetchData();
    

    
  }

  Future<void> fetchData() => Future.delayed(Duration(seconds: 3), () {
        if (workoutList.length != 0) {
          ready = true;
          print('user ===> $user');
          user['Member']
              ? isNephmember = 'neph member'
              : isNephmember = 'free member';
        } else {
          fetchData();
        }
      });

  Widget iconprofile() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.account_circle,
                size: 50,
                color: Colors.lightBlue.shade50,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Profile()));
              }),
        ]);
  }

  Widget iconsetting() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.settings,
                size: 40,
                color: Colors.white,
              ),
              onPressed: () {
                //loadstats();
                loadtitle();
                //allformofweek=[];
                // autogenfunction();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Crart()));
              }),
        ]);
  }

  Widget nametab() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 120),
          child: InkWell(
            child: Text(
              user['Name'],
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 36,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
                height: 0.75,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              MaterialPageRoute materialPageRoute =
                  MaterialPageRoute(builder: (BuildContext context) => Profile());
              Navigator.of(context).push(materialPageRoute);
            },
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              if(isNephmember == 'neph member')crown(),
              InkWell(
                child:  Text(
                    isNephmember,
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 16,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.left,
                  ),
                
                onTap: () {
                  if (user['Member'] == false) {
                    MaterialPageRoute materialPageRoute = MaterialPageRoute(
                        builder: (BuildContext context) => Payment());
                    Navigator.of(context).push(materialPageRoute);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget planimg(){
    return Container(width: 40,height: 40,
      child: SvgPicture.string(
            '<svg viewBox="48.0 340.8 32.0 29.8" ><path transform="translate(48.0, 340.8)" d="M 3.995849609375 9.30882453918457 L 3.995849609375 26.0647087097168 L 27.970947265625 26.0647087097168 L 27.970947265625 9.30882453918457 L 3.995849609375 9.30882453918457 Z M 25.9730224609375 3.723529815673828 L 29.9688720703125 3.723529815673828 C 31.16762733459473 3.723529815673828 31.966796875 4.468235969543457 31.966796875 5.585294723510742 L 31.966796875 27.92647361755371 C 31.966796875 29.04353332519531 31.16762733459473 29.78823852539063 29.9688720703125 29.78823852539063 L 1.9979248046875 29.78823852539063 C 0.7991698980331421 29.78823852539063 0 29.04353332519531 0 27.92647361755371 L 0 5.585294723510742 C 0 4.468235969543457 0.7991699576377869 3.723529815673828 1.9979248046875 3.723529815673828 L 5.9937744140625 3.723529815673828 L 5.9937744140625 1.861764907836914 C 5.9937744140625 0.7447059154510498 6.792944431304932 0 7.99169921875 0 C 9.190454483032227 0 9.9896240234375 0.7447059750556946 9.9896240234375 1.861764907836914 L 9.9896240234375 3.723529815673828 L 21.9771728515625 3.723529815673828 L 21.9771728515625 1.861764907836914 C 21.9771728515625 0.7447059154510498 22.77634239196777 0 23.97509765625 0 C 25.17385292053223 0 25.9730224609375 0.7447059750556946 25.9730224609375 1.861764907836914 L 25.9730224609375 3.723529815673828 Z M 23.97509765625 22.34117889404297 L 19.979248046875 22.34117889404297 L 19.979248046875 18.61764907836914 L 23.97509765625 18.61764907836914 L 23.97509765625 22.34117889404297 Z M 17.9813232421875 22.34117889404297 L 13.9854736328125 22.34117889404297 L 13.9854736328125 18.61764907836914 L 17.9813232421875 18.61764907836914 L 17.9813232421875 22.34117889404297 Z M 23.97509765625 16.75588417053223 L 19.979248046875 16.75588417053223 L 19.979248046875 13.0323543548584 L 23.97509765625 13.0323543548584 L 23.97509765625 16.75588417053223 Z M 17.9813232421875 16.75588417053223 L 13.9854736328125 16.75588417053223 L 13.9854736328125 13.0323543548584 L 17.9813232421875 13.0323543548584 L 17.9813232421875 16.75588417053223 Z M 11.987548828125 22.34117889404297 L 7.99169921875 22.34117889404297 L 7.99169921875 18.61764907836914 L 11.987548828125 18.61764907836914 L 11.987548828125 22.34117889404297 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
    );
  }

  Widget planButton() {
    return Container(
      width: 160,
      height: 90,
      child: RaisedButton(
          color: const Color(0xff394548),
          child: Row(
            children: [
              planimg(),
              SizedBox(width: 5,),
              Text(
                'Plan\nSchedule',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 20,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          elevation: 5,
          onPressed: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => Sucplan());
            Navigator.of(context).push(materialPageRoute);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }
  
  Widget calimg(){
    return Container(width: 35,height: 45,
      child: Stack(
          children: <Widget>[
            Pinned.fromSize(
              bounds: Rect.fromLTWH(1.2, 11.2, 18.6, 26.5),
              size: Size(32.7, 37.6),
              child: SvgPicture.string(
                '<svg viewBox="227.2 204.5 18.6 26.5" ><path transform="translate(208.15, 52.53)" d="M 27.72463226318359 167.0017242431641 C 26.85995864868164 166.4308166503906 26.27569770812988 165.3582153320313 26.27569770812988 164.1305541992188 C 26.27569770812988 159.0633544921875 29.85686874389648 154.9409790039063 34.25880432128906 154.9409790039063 L 37.54858779907227 154.9409790039063 L 37.70351409912109 152.0003051757813 L 19.06295776367188 152.0003051757813 L 20.40187072753906 177.4301605224609 C 20.43255615234375 178.0122680664063 20.85142135620117 178.4662780761719 21.35810089111328 178.4662780761719 L 27.23616409301758 178.4662780761719 C 26.63343811035156 177.5441589355469 26.27569580078125 176.3983459472656 26.27569580078125 175.1580200195313 C 26.27569580078125 173.7281951904297 27.06801986694336 172.5074157714844 28.17368125915527 172.0465087890625 C 27.78176116943359 171.3547058105469 27.55299377441406 170.5299377441406 27.55299377441406 169.644287109375 C 27.55299377441406 168.7577819824219 27.78226089477539 167.9321594238281 28.17492866516113 167.2397766113281 C 27.86258888244629 167.1587982177734 27.68920707702637 167.0792541503906 27.72463226318359 167.001708984375 Z M 27.72463226318359 167.0017242431641" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Pinned.fromSize(
              bounds: Rect.fromLTWH(0.0, 0.0, 21.1, 9.0),
              size: Size(32.7, 37.6),
              child: SvgPicture.string(
                '<svg viewBox="226.0 193.4 21.1 9.0" ><path transform="translate(226.0, 193.36)" d="M 10.53550624847412 8.969409942626953 C 10.5362548828125 8.969409942626953 10.53700351715088 8.969121932983398 10.53775119781494 8.969121932983398 L 20.11620330810547 8.969121932983398 C 20.64533233642578 8.969121932983398 21.07417678833008 8.475469589233398 21.07417678833008 7.866373062133789 C 21.07417678833008 7.257275581359863 20.64533233642578 6.763623237609863 20.11620330810547 6.763623237609863 L 12.30495738983154 6.763623237609863 L 14.88724327087402 2.205591201782227 L 18.20023345947266 2.205591201782227 C 18.72936248779297 2.205591201782227 19.15820503234863 1.711938500404358 19.15820503234863 1.102841258049011 C 19.15820503234863 0.4937441051006317 18.72936248779297 9.1552734375e-05 18.20023345947266 9.1552734375e-05 L 14.36834049224854 9.1552734375e-05 C 14.04452610015869 9.1552734375e-05 13.7426643371582 0.1881905049085617 13.56603908538818 0.5003495216369629 L 10.01754760742188 6.763621807098389 L 0.9567216038703918 6.763621807098389 C 0.4275910556316376 6.763621807098389 -0.001251220586709678 7.257274627685547 -0.001251220586709678 7.866371631622314 C -0.001251220586709678 8.475468635559082 0.4275910556316376 8.969121932983398 0.9567216038703918 8.969121932983398 L 10.53197765350342 8.969121932983398 C 10.53322505950928 8.969121932983398 10.53447246551514 8.969408988952637 10.5354700088501 8.969408988952637 Z M 10.53550624847412 8.969409942626953" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Pinned.fromSize(
              bounds: Rect.fromLTWH(10.3, 16.3, 22.4, 8.1),
              size: Size(32.7, 37.6),
              child: SvgPicture.string(
                '<svg viewBox="236.3 209.7 22.4 8.1" ><path transform="translate(74.35, -12.32)" d="M 162 228.9840698242188 C 162 229.5931701660156 162.4288330078125 230.0868225097656 162.9579620361328 230.0868225097656 L 183.3947143554688 230.0868225097656 C 183.9238586425781 230.0868225097656 184.3526916503906 229.5931701660156 184.3526916503906 228.9840698242188 C 184.3526916503906 225.1330718994141 181.6309509277344 222 178.2855224609375 222 L 168.0671539306641 222 C 164.7217407226563 222 162 225.1330718994141 162 228.9840698242188 Z M 162 228.9840698242188" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Pinned.fromSize(
              bounds: Rect.fromLTWH(11.6, 26.6, 19.8, 4.4),
              size: Size(32.7, 37.6),
              child: SvgPicture.string(
                '<svg viewBox="237.6 220.0 19.8 4.4" ><path transform="translate(55.62, -142.03)" d="M 183.9159393310547 362 C 182.8576812744141 362 182 362.9873046875 182 364.2055053710938 C 182 365.4237060546875 182.8576812744141 366.4110107421875 183.9159393310547 366.4110107421875 L 199.8821563720703 366.4110107421875 C 200.9404144287109 366.4110107421875 201.798095703125 365.4237060546875 201.798095703125 364.2055053710938 C 201.798095703125 362.9873046875 200.9404144287109 362 199.8821563720703 362 L 183.9159393310547 362 Z M 183.9159393310547 362" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Pinned.fromSize(
              bounds: Rect.fromLTWH(10.3, 33.2, 22.4, 4.4),
              size: Size(32.7, 37.6),
              child: SvgPicture.string(
                '<svg viewBox="236.3 226.6 22.4 4.4" ><path transform="translate(74.35, -225.41)" d="M 183.3947143554688 452 L 162.9579620361328 452 C 162.4288330078125 452 162 452.49365234375 162 453.1027526855469 C 162 454.9268798828125 163.2892608642578 456.4110107421875 164.8739166259766 456.4110107421875 L 181.4787750244141 456.4110107421875 C 183.0634155273438 456.4110107421875 184.3526916503906 454.9268798828125 184.3526916503906 453.1027526855469 C 184.3526916503906 452.49365234375 183.9238586425781 452 183.3947143554688 452 Z M 183.3947143554688 452" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ));
  }

  Widget calButton() {
    return Container(
      width: 160,
      height: 90,
      child: RaisedButton(
          color: const Color(0xff394548),
          child: Row(
            children: [calimg(),
              Text(
                'Calories\nCalculator',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 20,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          elevation: 5,
          onPressed: () {
            MaterialPageRoute materialPageRoute = MaterialPageRoute(
                builder: (BuildContext context) => Calculate());
            Navigator.of(context).push(materialPageRoute);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }
  Widget crown(){
    return  Stack(
                      children: <Widget>[
                        SvgPicture.string(
                          '<svg viewBox="0.0 0.0 20.0 15.2" ><path transform="translate(-87.45, -288.33)" d="M 90.99999237060547 299.9999694824219 L 90.99999237060547 303.4999084472656 L 103.8846893310547 303.4999084472656 L 103.8846893310547 299.9999694824219 L 90.99999237060547 299.9999694824219 Z M 90.99999237060547 299.9999694824219" fill="#ff9f00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-246.0, -288.33)" d="M 256 299.9999694824219 L 262.4423217773438 299.9999694824219 L 262.4423217773438 303.4999084472656 L 256 303.4999084472656 L 256 299.9999694824219 Z M 256 299.9999694824219" fill="#ff7816" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-86.01, -86.5)" d="M 102.502197265625 93.07968902587891 L 101.5534057617188 94.92290496826172 L 90.44920349121094 94.92290496826172 L 89.50039672851563 93.07968902587891 C 90.89424133300781 91.15472412109375 93.31897735595703 89.99978637695313 96.00131225585938 89.99978637695313 C 98.68363952636719 89.99978637695313 101.1083679199219 91.15472412109375 102.5022354125977 93.07968902587891 Z M 102.502197265625 93.07968902587891" fill="#ff4b00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-246.0, -86.5)" d="M 262.5011291503906 93.07929992675781 L 261.5522766113281 94.92254638671875 L 256.0002746582031 94.92254638671875 L 256.0002746582031 89.99939727783203 C 258.6824951171875 89.99939727783203 261.1072998046875 91.15434265136719 262.5011291503906 93.07928466796875 Z M 262.5011291503906 93.07929992675781" fill="#cc1e0d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-33.54, -68.62)" d="M 52.1644401550293 74.03443145751953 L 49.97396850585938 81.45432281494141 L 37.08926391601563 81.45432281494141 L 34.8988037109375 74.03443145751953 L 36.37471771240234 73.47453308105469 C 37.04243850708008 74.74612426757813 38.31916809082031 75.49274444580078 39.36163711547852 75.62107849121094 L 39.97079467773438 75.62107849121094 C 41.31782913208008 75.41117095947266 42.32505416870117 73.35785675048828 42.73517227172852 71.39779663085938 L 44.32821655273438 71.39779663085938 C 44.73818588256836 73.35782623291016 45.74557495117188 75.41114044189453 47.09245300292969 75.62107849121094 L 47.70161437988281 75.62107849121094 C 48.74406814575195 75.49274444580078 50.02080917358398 74.74612426757813 50.68852233886719 73.47453308105469 L 52.1644401550293 74.03443145751953 Z M 52.1644401550293 74.03443145751953" fill="#ffcf3a" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-246.01, -68.62)" d="M 264.6332702636719 74.03463745117188 L 262.4428405761719 81.45449066162109 L 256.0004577636719 81.45449066162109 L 256.0004577636719 71.39800262451172 L 256.796875 71.39800262451172 C 257.2070007324219 73.35804748535156 258.2142333984375 75.41135406494141 259.5613098144531 75.62131500244141 L 260.17041015625 75.62131500244141 C 261.212890625 75.49295806884766 262.4896240234375 74.74633026123047 263.1573486328125 73.47473907470703 L 264.6332702636719 74.03463745117188 Z M 264.6332702636719 74.03463745117188" fill="#fdb53e" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(0.0, -57.67)" d="M 1.79604959487915 63.49991226196289 C 0.8272565007209778 63.49991226196289 8.805088214103307e-09 62.71485900878906 8.805088214103307e-09 61.74995422363281 C 8.805088214103307e-09 60.7850456237793 0.8272565007209778 59.99999618530273 1.79604959487915 59.99999618530273 C 2.764842748641968 59.99999618530273 3.553054809570313 60.7850456237793 3.553054809570313 61.74995422363281 C 3.553054809570313 62.71485900878906 2.764842748641968 63.49991226196289 1.79604959487915 63.49991226196289 Z M 1.79604959487915 63.49991226196289" fill="#ff9f00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-404.56, -57.67)" d="M 422.7569580078125 63.49991226196289 C 421.7882080078125 63.49991226196289 420.9999694824219 62.71485900878906 420.9999694824219 61.74995422363281 C 420.9999694824219 60.7850456237793 421.7882080078125 59.99999618530273 422.7569580078125 59.99999618530273 C 423.7257690429688 59.99999618530273 424.5530700683594 60.7850456237793 424.5530700683594 61.74995422363281 C 424.5530700683594 62.71485900878906 423.7257690429688 63.49991226196289 422.7569580078125 63.49991226196289 Z M 422.7569580078125 63.49991226196289" fill="#ff7816" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-202.76, 0.0)" d="M 212.7570190429688 -5.796361435272956e-08 C 211.7847137451172 -5.796361435272956e-08 211 0.7815589308738708 211 1.749959230422974 C 211 2.718207120895386 211.7847137451172 3.499918460845947 212.7570190429688 3.499918460845947 C 213.7293395996094 3.499918460845947 214.5140380859375 2.718207120895386 214.5140380859375 1.749959230422974 C 214.5140380859375 0.7815589308738708 213.7293395996094 -5.796361435272956e-08 212.7570190429688 -5.796361435272956e-08 Z M 212.7570190429688 -5.796361435272956e-08" fill="#fdb53e" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-196.71, -166.94)" d="M 206.7022552490234 173.6989898681641 L 204.6992797851563 175.6939849853516 L 206.7022552490234 177.6889495849609 L 208.7052917480469 175.6939849853516 L 206.7022552490234 173.6989898681641 Z M 206.7022552490234 173.6989898681641" fill="#ff4b00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-312.11, -224.69)" d="M 325.6172790527344 233.7849273681641 L 326.4454956054688 234.6097412109375 L 325.6172790527344 235.4346618652344 L 324.7891845703125 234.6097412109375 L 325.6172790527344 233.7849273681641 Z M 325.6172790527344 233.7849273681641" fill="#cc1e0d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-139.14, -224.69)" d="M 145.6172943115234 233.7849273681641 L 146.4454650878906 234.6097412109375 L 145.6172943115234 235.4346618652344 L 144.7890777587891 234.6097412109375 L 145.6172943115234 233.7849273681641 Z M 145.6172943115234 233.7849273681641" fill="#ff4b00" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-246.0, 0.0)" d="M 256 3.499918460845947 L 256 0 C 256.9723205566406 0 257.7570190429688 0.7815589308738708 257.7570190429688 1.749959230422974 C 257.7570190429688 2.718207120895386 256.9723205566406 3.499918460845947 256 3.499918460845947 Z M 256 3.499918460845947" fill="#ff7816" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-246.0, -166.94)" d="M 258.0032653808594 175.6937866210938 L 256.0002746582031 177.6887512207031 L 256.0002746582031 173.6987762451172 L 258.0032653808594 175.6937866210938 Z M 258.0032653808594 175.6937866210938" fill="#cc1e0d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                          allowDrawingOutsideViewBox: true,
                        ),
                      ],
                    );
  }

  Widget statButton() {
    return Container(
      width: 340,
      height: 150,
      child: RaisedButton(
          color: const Color(0xffffffff),
          child: Padding(
            padding: EdgeInsets.only(top: 40),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'CurrentError',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 16,
                        color: const Color(0xff374f51),
                      ),
                      textAlign: TextAlign.left,
                    ),SizedBox(height: 10,),
                    Text(
                      currenterror + '%',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 35,
                        color: const Color(0xff374f51),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),SizedBox(width: 25,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: graphshow(),
                )
              ],
            ),
          ),
          onPressed: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => Stats());
            Navigator.of(context).push(materialPageRoute);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }

  Widget graphshow() {
    return // Adobe XD layer: 'graph' (group)
        Stack(
      children: <Widget>[
        Transform.translate(
          offset: Offset(0.0, 33.0),
          child: Container(
            width: 28.0,
            height: 68.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.0),
              color: const Color(0xff2aafaf),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(37.0, 4.0),
          child: SvgPicture.string(
            '<svg viewBox="112.0 224.2 27.0 96.0" ><path transform="translate(112.0, 224.22)" d="M 9 0 L 18 0 C 22.97056198120117 0 27 4.029437065124512 27 9 L 27 87 C 27 91.97056579589844 22.97056198120117 96 18 96 L 9 96 C 4.029437065124512 96 0 91.97056579589844 0 87 L 0 9 C 0 4.029437065124512 4.029437065124512 0 9 0 Z" fill="#374f51" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
            allowDrawingOutsideViewBox: true,
          ),
        ),
        Transform.translate(
          offset: Offset(74.0, 19.0),
          child: Container(
            width: 27.0,
            height: 81.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.0),
              color: const Color(0xff2aafaf),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(111.0, 0.0),
          child: Container(
            width: 27.0,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.0),
              color: const Color(0xff2aafaf),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(148.0, 45.0),
          child: Container(
            width: 27.0,
            height: 55.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.0),
              color: const Color(0xff2aafaf),
            ),
          ),
        ),
      ],
    );
  }

  Widget workoutButton() {
    return Container(
      width: 340,
      height: 65,
      child: RaisedButton(
          color: const Color(0xff394548),
          child: Text(
            'GO WORKOUT',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 20,
              color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.start,
          ),
          elevation: 5,
          onPressed: () {
            Widget go = Plan();
            if (user['haveSchedule'] == true) {
              go = Sucplan();
            }
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) => go);
            Navigator.of(context).push(materialPageRoute);
          },
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(45.0))),
    );
  }

  Widget whiteback() {
    return Align(
      alignment: Alignment(0.0, 5.0),
      child: Container(
        height: 600,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          color: Colors.lightBlue.shade50,
          boxShadow: [
            BoxShadow(
              color: const Color(0x29000000),
              offset: Offset(2, 2),
              blurRadius: 3,
            ),
          ],
        ),
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          workoutButton(),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              planButton(),
              SizedBox(
                width: 20,
              ),
              calButton()
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 35),
              child: Text('STATS',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 21,
                    color: const Color(0xff000000),
                    letterSpacing: 2.1,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.start),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          statButton(),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (ready == true) {
              return SafeArea(
                  child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(color: const Color(0xff394548)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            iconsetting(),
                            SizedBox(width: 250),
                            iconprofile()
                          ],
                        ),
                        SizedBox(height: 70),
                        Align(alignment: Alignment(0, 0), child: nametab()),
                      ],
                    ),
                  ),
                  whiteback()
                ],
              ));
            } else {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                  strokeWidth: 6,
                ),
              );
            }
          }),
    );
  }
}
