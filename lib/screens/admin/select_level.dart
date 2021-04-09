import 'package:attendance/screens/admin/coursesList.dart';
import 'package:attendance/screens/admin/select_course.dart';
import 'package:attendance/util/constants.dart';
import 'package:attendance/widgets/users_widget.dart';
import 'package:flutter/material.dart';



class SelectLevel extends StatefulWidget {

  @override
  _SelectLevelState createState() => _SelectLevelState();
}

class _SelectLevelState extends State<SelectLevel> {


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: exAppBar(title: " ", context: context),
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
              padding: const EdgeInsets.only(left: 3.0),
              child: Text(
                'Select Level',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Quando',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
              SizedBox(
              height: 10,
            ),
             Container(
    height: MediaQuery.of(context).size.height * 0.15,
    width: MediaQuery.of(context).size.width,
    child: Card(
      child: InkWell(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('img/class.jpg', fit: BoxFit.fill, height: 98, width: MediaQuery.of(context).size.width,),
          ],
        ),
      ),
    ),
  ),
            SizedBox(height: 30.0,),
            GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                padding: const EdgeInsets.all(4.0),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                shrinkWrap: true,
                children: [
                  chooseLevel(
                    context, 
                    
                    "100-Level", 
                    'img/grad.png', 
                    "Available Courses",
                    () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GetCourse(selectedClass: "1")));
                    },
                  
                    ),
                    chooseLevel(
                    context, 
                    "200-Level", 
                    'img/grad.png',
                    "Available Courses ", 
                    () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GetCourse(selectedClass: "2")));
                    },

                    ),
                    chooseLevel(
                    context, 
                    "300-Level", 
                    'img/grad.png', 
                    "Available Courses",
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GetCourse(selectedClass: "3")));
                    },

                    ),
                    chooseLevel(
                    context, 
                    "400-Level", 
                    'img/grad.png',
                    "Available Courses", 
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GetCourse(selectedClass: "4")));
                    },

                    ),
                ]),
         ], 
        ),
      ),
    );
  }
}


Widget chooseLevel(context, String text, String icon, String title, Function route, ) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.25,
    width: MediaQuery.of(context).size.width * 0.45,
    child: Card(
      child: InkWell(
        highlightColor: Constants.kPrimaryColor.withOpacity(0.3),
        onTap: route,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
              
              ],
            ),
            SizedBox(height: 10,),
            Image.asset(icon,height: 40,),
            SizedBox(
              height: 10.0,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Quando',
                color: Colors.black,
                fontWeight: FontWeight.w600
              ),
            )
          ],
        ),
      ),
    ),
  );
}