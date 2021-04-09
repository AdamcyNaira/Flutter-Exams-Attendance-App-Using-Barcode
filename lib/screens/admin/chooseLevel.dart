import 'dart:convert';

import 'package:attendance/screens/admin/coursesList.dart';
import 'package:attendance/util/constants.dart';
import 'package:attendance/widgets/users_widget.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;


List countCourse1 = [];
List countCourse2 = [];
List countCourse3 = [];
List countCourse4 = [];

class ChooseLevel extends StatefulWidget {

  @override
  _ChooseLevelState createState() => _ChooseLevelState();
}

class _ChooseLevelState extends State<ChooseLevel> {


   Future<List> countCourse() async {
      String fileName = "countCourses.json";
      var dir = await getTemporaryDirectory();
      File file = new File(dir.path + "/" + fileName); 

      if (file.existsSync()) {
        var jsonData = file.readAsStringSync();
       setState(() {
         countCourse1 = json.decode(jsonData);
       });
        final response =
            await http.post('https://teamcoded.com.ng/attendance.php', body: {
          "request": "COUNT ALL COURSES",
          "class" : "1",
    });

      var convertDateToJson = jsonDecode(response.body);
      setState(() {
        countCourse1 = convertDateToJson;
        file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
         });
      return countCourse1;
      }else{
         final response =
            await http.post('https://teamcoded.com.ng/attendance.php', body: {
          "request": "COUNT ALL COURSES",
          "class" : "1",
    });

      var convertDateToJson = jsonDecode(response.body);
      setState(() {
        countCourse1 = convertDateToJson;
        file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
         });
       return countCourse1;
      }
      }

       Future<List> countCourses2() async {
      String fileName = "countCourses2.json";
      var dir = await getTemporaryDirectory();
      File file = new File(dir.path + "/" + fileName); 

      if (file.existsSync()) {
        var jsonData = file.readAsStringSync();
       setState(() {
         countCourse2 = json.decode(jsonData);
       });
        final response =
            await http.post('https://teamcoded.com.ng/attendance.php', body: {
          "request": "COUNT ALL COURSES",
          "class" : "2",
    });

      var convertDateToJson = jsonDecode(response.body);
      setState(() {
        countCourse2 = convertDateToJson;
        file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
         });
      return countCourse2;
      }else{
         final response =
            await http.post('https://teamcoded.com.ng/attendance.php', body: {
          "request": "COUNT ALL COURSES",
          "class" : "2",
    });

      var convertDateToJson = jsonDecode(response.body);
      setState(() {
        countCourse2 = convertDateToJson;
        file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
         });
       return countCourse2;
      }
      }


       Future<List> countCourses3() async {
      String fileName = "countCourses3.json";
      var dir = await getTemporaryDirectory();
      File file = new File(dir.path + "/" + fileName); 

      if (file.existsSync()) {
        var jsonData = file.readAsStringSync();
       setState(() {
         countCourse3 = json.decode(jsonData);
       });
        final response =
            await http.post('https://teamcoded.com.ng/attendance.php', body: {
          "request": "COUNT ALL COURSES",
          "class" : "3",
    });

      var convertDateToJson = jsonDecode(response.body);
      setState(() {
        countCourse2 = convertDateToJson;
        file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
         });
      return countCourse3;
      }else{
         final response =
            await http.post('https://teamcoded.com.ng/attendance.php', body: {
          "request": "COUNT ALL COURSES",
          "class" : "3",
    });

      var convertDateToJson = jsonDecode(response.body);
      setState(() {
        countCourse3 = convertDateToJson;
        file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
         });
       return countCourse3;
      }
      }



          Future<List> countCourses4() async {
      String fileName = "countCourses4.json";
      var dir = await getTemporaryDirectory();
      File file = new File(dir.path + "/" + fileName); 

      if (file.existsSync()) {
        var jsonData = file.readAsStringSync();
       setState(() {
         countCourse4 = json.decode(jsonData);
       });
        final response =
            await http.post('https://teamcoded.com.ng/attendance.php', body: {
          "request": "COUNT ALL COURSES",
          "class" : "4",
    });

      var convertDateToJson = jsonDecode(response.body);
      setState(() {
        countCourse4 = convertDateToJson;
        file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
         });
      return countCourse4;
      }else{
         final response =
            await http.post('https://teamcoded.com.ng/attendance.php', body: {
          "request": "COUNT ALL COURSES",
          "class" : "4",
    });

      var convertDateToJson = jsonDecode(response.body);
      setState(() {
        countCourse4 = convertDateToJson;
        file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
         });
       return countCourse4;
      }
      }


@override
  void initState() {
    countCourse();
    countCourses2();
    countCourses3();
    countCourses4();
    super.initState();
  }
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
                'Choose Level',
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
                            builder: (context) => GetCourseList(selectedClass: "1")));
                    },
                    countCourse1.isNotEmpty 
                    ? "${countCourse1[0]['count(*)'].toString()}"
                    : "0",
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
                            builder: (context) => GetCourseList(selectedClass: "2")));
                    },
                     countCourse2.isNotEmpty 
                    ? "${countCourse2[0]['count(*)'].toString()}"
                    : "0",
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
                            builder: (context) => GetCourseList(selectedClass: "3")));
                    },
                     countCourse3.isNotEmpty 
                    ? "${countCourse3[0]['count(*)'].toString()}"
                    : "0",
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
                            builder: (context) => GetCourseList(selectedClass: "4")));
                    },
                     countCourse4.isNotEmpty 
                    ? "${countCourse4[0]['count(*)'].toString()}"
                    : "0",
                    ),
                ]),
         ], 
        ),
      ),
    );
  }
}


Widget chooseLevel(context, String text, String icon, String title, Function route, String count) {
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
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Quando',
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(width: 5,),
                CircleAvatar(
                  radius: 15,
                 child: Text(count), 
                )
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