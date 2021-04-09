import 'dart:async';
import 'dart:convert';

import 'package:attendance/screens/admin/addCourse.dart';
import 'package:attendance/util/constants.dart';
import 'package:attendance/widgets/users_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

List courseData =[];
List countCourse = [];



class GetCourseList extends StatefulWidget {
  GetCourseList({this.selectedClass});
  final String selectedClass;
  @override
  _GetCourseListState createState() => _GetCourseListState();
}

class _GetCourseListState extends State<GetCourseList> {


 var spinkit = SpinKitThreeBounce(
  color: Constants.kPrimaryColor.withOpacity(0.8),
  size: 30.0,
);

 Future<List> fetchCourseData() async {
        final response =
        await http.post("https://teamcoded.com.ng/attendance.php", body: {
        "request": "FETCH ALL COURSES",
        "class" : widget.selectedClass,
          });
        setState(() {
        var convertDateToJson = jsonDecode(response.body);
        courseData = convertDateToJson;
      });
      return courseData;
      }


@override
  void initState() {
    fetchCourseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchCourseData(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
      List myData = (snapshot.data);
        if (myData == null) {
          return Scaffold( 
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Container(
                child: spinkit,
              ),
              SizedBox(height: 10,),
                Center(
                  child: Text( 
                    'Loading...'
                  ),
                ),
              ],
            ),
          );
        } else {
          return myData.isNotEmpty
          ? 
          CoursesList(selectedClass: widget.selectedClass) 
          : 
          Scaffold( 
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Container(
                child: Icon(Icons.warning, size: 50, color: Colors.orange[400]),
              ),
              SizedBox(height: 15,),
                Center(
                  child: Text( 
                    'No Available Course'
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
        onPressed: (){
            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddCourse(selectedClass: widget.selectedClass)));
        },
        child: Icon(Icons.add),
        elevation: 4,
      ),
          );
        }
      },
    );
  }
}











class CoursesList extends StatefulWidget {
  CoursesList({this.selectedClass});
  final String selectedClass;
  @override
  _CoursesListState createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {

  Future<String> fetchCourseData() async {
        final response =
        await http.post("https://teamcoded.com.ng/attendance.php", body: {
        "request": "FETCH ALL COURSES",
        "class" : widget.selectedClass,
          });
        setState(() {
        var convertDateToJson = jsonDecode(response.body);
        courseData = convertDateToJson;
      });
      return "Success";
      }


        Future<List> countCourses() async {

        final response =
            await http.post('https://teamcoded.com.ng/attendance.php', body: {
          "request": "COUNT COURSES",
          "class" : widget.selectedClass,
    });

      var convertDateToJson = jsonDecode(response.body);
      setState(() {
        countCourse = convertDateToJson;
      });
      return countCourse;
  }


 


@override
  void initState() {
    fetchCourseData();
    countCourses();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: exAppBar(title: "", context: context),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Available Course',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Quando',
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700),
                  ),
                   CircleAvatar(
                  radius: 20,
                 child: Text( countCourse.isNotEmpty 
                ? "${countCourse[0]['count(*)'].toString()}"
                : "0",), 
                )
                ],
              ),
            ),
            SizedBox(height: 30.0,),
           Container(
             height: MediaQuery.of(context).size.height*0.73,
             child: courseData != null ? ListView.builder(
                shrinkWrap: true,
                 itemCount: courseData == null ? 0 : courseData.length,
                itemBuilder: (BuildContext context, int index) {
                   if (courseData != null) {
                      return coursesIcon(
                    context,
                    courseData[index]['course_name'],
                    courseData[index]['code'],
                    courseData[index]['class_name'],
                    (){
                      //  Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => CourseContent(selectedSemester: widget.selectedSemester, selectedClass: widget.selectedClass, selectedCourse: "Introduction to Java Programming",)));
                    }, 
                      () async{

                             showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    title: new Text("Confirm"),
                    content:
                        new Text("Are you sure you want to delete this course?"),
                    actions: <Widget>[
                      // usually buttons at the bottom of the dialog
                      Container(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new RaisedButton(
                                color: Colors.red,
                                child: Row(
                                  children: <Widget>[
                                    new Text("YES"),
                                    SizedBox(width: 5.0),
                                    Icon(Icons.check_circle),
                                  ],
                                ),
                                onPressed: () async{
                                var id = courseData[index]['course_id'];
                                  await http.post("https://teamcoded.com.ng/attendance.php", body: {
                                      "request": "DELETE COURSE",
                                      "id": id,
                                      });
                               fetchCourseData();
                                  Navigator.of(context, rootNavigator: true).pop('dialog');
                                },
                              ),
                              new RaisedButton(
                                color: Colors.blueAccent,
                                child: Row(
                                  children: <Widget>[
                                    new Text("NO"),
                                    SizedBox(width: 5.0),
                                    Icon(Icons.cancel) 
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true).pop('dialog');
                                },
                              ),
                            ]),
                      )
                    ],
                  );
                },
              );
                            
                          },
                    
                    fetchCourseData(),
                  );
                   }else{
                     Center(child: CircularProgressIndicator());
                   }
                }
              
              ) :  Center(child: Text('Loading...', style: TextStyle(color: Colors.black),),),
           )
         ], 
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddCourse(selectedClass: widget.selectedClass)));
        },
        child: Icon(Icons.add),
        elevation: 4,
      ),
    );
  }
}

Widget coursesIcon(context, String course, String code, String lecturer,  Function route, Function route2, fetchCourseData){
  return Column(
    children: [
      GestureDetector(
                      onTap: route,
                      child: Material(
                        elevation: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
                           border: Border(left: BorderSide(width: 5.0, color: Constants.kPrimaryColor.withOpacity(0.6))) 
                          ),
                        width: MediaQuery.of(context).size.width,
                        child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset('img/book.png',height: 80, width: 90,),
                                      SizedBox(
                                    width: 10.0,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top:8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Text(
                                              course,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 11.0,
                                                fontFamily: 'Quando',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600
                                              ),
                                              
                                            ),

                                             SizedBox( height: 5.0,),
                                            Text(
                                              "Course Code: $code",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.black54,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            
                                            SizedBox( height: 5.0,),
                                            Text(
                                              "Level: $lecturer",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.black54,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                           
                                        ],
                                      ),
                                    ),
                                  ),
                                   
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  
                          ],
                        ),
                                ),
                        IconButton(
                          icon: Icon(Icons.delete,size: 20, color: Colors.black54,),
                          onPressed: route2
                        )
                              ],
                            ),
                      ),
                      ),
                    ),
                    SizedBox(height: 20,),
    ],
  );
}