import 'package:attendance/screens/home/home.dart';
import 'package:attendance/screens/student/getIDCard.dart';
import 'package:attendance/screens/student/notifications.dart';
import 'package:attendance/screens/student/studentDashboard.dart';
import 'package:attendance/util/constants.dart';
import 'package:attendance/widgets/users_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StudentAccount extends StatefulWidget {
  @override
  _StudentAccountState createState() => _StudentAccountState();
}

class _StudentAccountState extends State<StudentAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: singleAppBar(title: " ", context: context),
      body: Container(
        color: Constants.kPrimaryColor.withOpacity(0.03),
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
              SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'My Account',
                style: TextStyle(
                    color: Colors.black54,
                    fontFamily: 'Quando',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 30.0,),
           Container(
    height: MediaQuery.of(context).size.height * 0.22,
    width: MediaQuery.of(context).size.width,
    child: Card(
      child: InkWell(
 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('img/qrcode-technology-scan-with-office-team-people-circle-around-big-smartphone-apps_25147-17.jpg', height: 120, width: MediaQuery.of(context).size.width, fit: BoxFit.cover,),
          ],
        ),
      ),
    ),
  ),
      SizedBox(height: 15.0,),
      myMenu(
              icon1: FontAwesomeIcons.bookOpen, 
              title: "STUDENT ID-CARD", 
              icon2: Icons.arrow_forward_ios, 
              route: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => GetIDCard()));
              }
              ),
      myMenu(
              icon1: FontAwesomeIcons.bell, 
              title: "Notifications", 
              icon2: Icons.arrow_forward_ios, 
              route: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GetNotifications()));
              }
              ),
      myMenu(
              icon1: FontAwesomeIcons.signOutAlt, 
              title: "Log Out", 
              icon2: Icons.arrow_forward_ios, 
              route: () {
                    Constants.sharedPref.clear();
                             Constants.sharedPref.commit();
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()), (Route<dynamic> route) => false);
              }
              ),
         ], 
        ),
      ),
    );
  }
}