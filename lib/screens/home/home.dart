import 'package:attendance/screens/home/login.dart';
import 'package:attendance/screens/student/studentDashboard.dart';
import 'package:attendance/util/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
     return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: screen.height,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          color: Colors.white30,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [

                   Image.asset(
                    'img/test.png',
                    height: 60,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                    'Attendance App',
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Quando',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700),
                  ),
                 ],
              ),
              SizedBox(
                height: 80.0,
              ),
              Image.asset(
                'img/logo.png',
                height: 200,
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: screen.width,
                child: Center(
                  child: Text(
                    'Attendance App ',
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Quando',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                width: screen.width,
                child: Center(
                  child: Text(
                    'This is a flexible mobile app that allows examiner to capture students attendance in an examination hall using barcode scanner',
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'raleway',
                        fontSize: 14,),
                        textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
             
              
              SizedBox(
                height: 10.0,
              ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.45,
                    child: FlatButton(
                color: Constants.kPrimaryColor.withOpacity(0.7),
                child: Text(
                    'STUDENT PORTAL',
                    style: TextStyle(fontSize: 14),
                ),
                shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(5.0),
                ),
                padding: EdgeInsets.all(18),
                textColor: Colors.white,
                onPressed: () {
                     Future.delayed(Duration.zero, () async{
                    await Navigator.push(context, MaterialPageRoute(builder: (context) => StudentLogin()));
                    });
                },
              ),
                  ),

              Container(
                width: MediaQuery.of(context).size.width*0.45,
                child: FlatButton(
                  color: Colors.white,
                  child: Text(
                    'ADMIN LOGIN',
                    style: TextStyle(fontSize: 14),
                  ),
                  splashColor: Constants.kPrimaryColor.withOpacity(0.2),
                  highlightColor: Constants.kPrimaryColor.withOpacity(0.2),
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Constants.kPrimaryColor.withOpacity(0.3), width: 2),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.all(17),
                  textColor: Colors.black54,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminLogin()));
                  },
                ),
              ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}