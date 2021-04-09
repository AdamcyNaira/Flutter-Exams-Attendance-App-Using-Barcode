import 'package:attendance/screens/admin/chooseLevel.dart';
import 'package:attendance/screens/admin/getLevel.dart';
import 'package:attendance/screens/admin/manageNotification.dart';
import 'package:attendance/screens/admin/marked_student.dart';
import 'package:attendance/screens/admin/select_level.dart';
import 'package:attendance/screens/admin/staffList.dart';
import 'package:attendance/screens/admin/studentList.dart';
import 'package:attendance/screens/home/home.dart';
import 'package:attendance/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
           top: 0.0,
           left: 0.0,
           right: 0.0,
           child:  Container(
             height: MediaQuery.of(context).size.height*.22,
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
                 gradient: LinearGradient(
                   begin: Alignment.topCenter,
                   end:   Alignment.bottomCenter, 
                   colors: [
                     const Color(0xff7cd8a0),
                     const Color(0xff00923f)
                   ]
                 ),
               ),
             child: Padding(
             padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 20.0),
             child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                             'Hi Admin,',
                             style: TextStyle(
                                 color: Colors.white,
                                 fontFamily: 'Quando',
                                 fontSize: 18.0,
                                 fontWeight: FontWeight.w700),
                       ),
                       SizedBox(height: 5.0,),
                        Text(
                         'Welcome back!',
                         style: TextStyle(
                           color: Colors.white,
                           fontFamily: 'raleway',
                           fontSize: 14,
                         ),
                       ),
                          ],
                        ),
                        CircleAvatar(
                       radius: 20,
                       backgroundImage: AssetImage('img/user-icon.jpg'),
                     ),
                      ],
                    ),
           ),
            ),
          ),
           Positioned(
            top: MediaQuery.of(context).size.height*.14,
            left: 15,
            right: 15,
            child:  GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      padding: const EdgeInsets.all(0.0),
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      shrinkWrap: true,
                      primary: false,
                      children: [
                         chooseMenu(
                          context, 
                          "Courses", 
                          'img/book.png', 
                          () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseLevel()));
                          },
                          ),  
                          chooseMenu(
                          context, 
                          "Students", 
                          'img/student.png', 
                          () {
                              Navigator.push( 
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GetStudentList()));
                          },
                          ),  
                         
                          chooseMenu(
                          context, 
                          "Mark Attendance", 
                          'img/test.png', 
                          () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectLevel()));
                          },
                          ), 
                           chooseMenu(
                          context, 
                          " Attendance List", 
                          'img/test.png', 
                          () {
                               Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectLevelList()));
                          },
                          ),   
                          chooseMenu(
                          context, 
                          "Announcement", 
                          'img/png.png', 
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ManageAnnouncement()));
                          },
                          ),  
                          chooseMenu(
                          context, 
                          "Logout", 
                          'img/powerr.png', 
                          () {
                             Constants.sharedPref.clear();
                             Constants.sharedPref.commit();
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()), (Route<dynamic> route) => false);
                          },
                          ),  

                          
 
                      ]
   ),
          ),
        ],
      ),
    );
  }
}

class AdminBottomNav extends StatefulWidget {
  @override
  _AdminBottomNavState createState() => _AdminBottomNavState();
}

class _AdminBottomNavState extends State<AdminBottomNav> {
  int _selectedIndex = 0;
  final menu = [
    new AdminDashboard(),
    new AdminDashboard(),
    new AdminDashboard(),
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


Widget chooseMenu(context, String text, String icon, Function route) {
  return Container(
    height: MediaQuery.of(context).size.height ,
    width: MediaQuery.of(context).size.width,
    child: Card(
      child: InkWell(
        highlightColor: Constants.kPrimaryColor.withOpacity(0.3),
        onTap: route,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon,height: 40,),
            SizedBox(
              height: 20.0,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 10.0,
                fontFamily: 'Quando',
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
    ),
  );
}