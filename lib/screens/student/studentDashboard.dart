import 'package:attendance/screens/student/about.dart';
import 'package:attendance/screens/student/getIDCard.dart';
import 'package:attendance/screens/student/notifications.dart';
import 'package:attendance/screens/student/studentAccount.dart';
import 'package:flutter/material.dart';
import 'package:attendance/util/constants.dart';
import 'package:attendance/widgets/users_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StudentDashboard extends StatefulWidget {
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  final int hnd2 = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: buildAppBar(context),
      body: Container(
        color: Constants.kPrimaryColor.withOpacity(0.03),
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: Colors.orange[400],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('img/user-icon.jpg'),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome Back! ',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: 'Quando',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Student Portal',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: 'raleway',
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 5.0),
                      child: Text(
                          'Smart Attendance App that allows examiner to capture students attendance in an examination hall using barcode scanner',
                          style: TextStyle(
                           color: Colors.black54
                          ),
                          textAlign: TextAlign.center,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left:5.0, right: 5.0),
              child: Container(
                child: Text(
                  'Choose your class ',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Quando',
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(height: 10.0,),
           ListView( 
             shrinkWrap: true,
             children: [
               chooseLevel(
                    context, 
                    "STUDENT ID-CARD", 
                    'img/grad.png', 
                    () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GetIDCard()));
                    },
                    ),
                    SizedBox(height: 15,),
                    chooseLevel(
                    context, 
                    "NOTIFICATIONS", 
                    'img/png.png', 
                    () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GetNotifications()));
                    },
                    ),
             ],
           ),
          ],
        ),
      ),
    );
  }
}

Widget chooseLevel(context, String text, String icon, Function route) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.20,
    width: MediaQuery.of(context).size.width * 0.45,
    child: Card(
      child: InkWell(
        highlightColor: Constants.kPrimaryColor.withOpacity(0.3),
        onTap: route,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon,height: 70,),
            SizedBox(
              height: 20.0,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Quando',
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    ),
  );
}

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  final menu = [
    new StudentDashboard(),
    new About(),
    new StudentAccount(),
  ];
  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menu.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.home,
              size: 15.0,
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.infoCircle,
              size: 15.0,
            ),
            title: Text(
              'About',
              style: TextStyle(fontSize: 12.0),
            ),
          ),
         
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.userCircle,
              size: 15.0,
            ),
            title: Text(
              'Account',
              style: TextStyle(fontSize: 12.0),
            ),
          ),
        ],
        fixedColor: Constants.kPrimaryColor.withOpacity(0.5),
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        elevation: 5,
        backgroundColor: Colors.white,
      ),
    );
  }
}
