import 'dart:async';

import 'package:attendance/screens/home/home.dart';
import 'package:attendance/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  var spinkit = SpinKitThreeBounce(
  color: Constants.kPrimaryColor.withOpacity(0.8),
  size: 30.0,
);

var ss =  SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : Colors.green,
      ),
    );
  },
);

bool  isActive ;



   @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Home(),
      ));
    });
  }
  
   @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]
    );
    return Scaffold(
   backgroundColor: Constants.kPrimaryColor.withOpacity(.03),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
         decoration: BoxDecoration(
                 color: Colors.white
                ),
        child: Stack(
        children: <Widget>[
          // Opacity(
          //   opacity: 0.3,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(8.0),
          //       image: DecorationImage(
          //         image: AssetImage('images/team.png'),
          //         fit: BoxFit.fill
          //       ),
          //     ),
          //   ),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center, 
            mainAxisAlignment: MainAxisAlignment.center, 
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:160.0),
                child:  Image.asset('img/logo.png'),
              ), 

              SizedBox(
                height: 34.0,
              ),
                Center(
                  child: Text(
                    'Attendance App ',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Quando',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),   
               SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top:180.0),
                child: Container(
                  child: Center(
                   child: Text("ATTENDANCE APP FOR DEPARTMENT OF COMPUTER SCIENCE \n KADUNA STATE UNIVERSITY",
                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.black, fontFamily: 'Raleway'),textAlign: TextAlign.center,
                   ),
                  ),
                ),
              ),
               SizedBox(
                height: 20.0,
              ),
              Container(
                child: spinkit,
              ),
            
            ],
          )
        ],
      ),
      ),  
    );
  }
} 