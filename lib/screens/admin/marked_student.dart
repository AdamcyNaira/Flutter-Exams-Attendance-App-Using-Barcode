import 'dart:async';
import 'dart:convert';

import 'package:attendance/screens/admin/addStudent.dart';
import 'package:attendance/screens/admin/signOut.dart';
import 'package:attendance/util/constants.dart';
import 'package:attendance/widgets/users_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

List studentData =[];
List studentList = [];
List countStudent = [];



class MarkedStudentList extends StatefulWidget {
  MarkedStudentList({this.selectedCourse, this.selectedClass});
  final selectedCourse;
  final String selectedClass;

  @override
  _MarkedStudentListState createState() => _MarkedStudentListState();
}

class _MarkedStudentListState extends State<MarkedStudentList> {


 var spinkit = SpinKitThreeBounce(
  color: Constants.kPrimaryColor.withOpacity(0.8),
  size: 30.0,
);

 Future<List> fetchStudentData() async {
        final response =
        await http.post("https://teamcoded.com.ng/attendance.php", body: {
        "request": "FETCH MARKED STUDENTS",
        "course": widget.selectedCourse,
        "level": widget.selectedClass

          });
        setState(() {
        var convertDateToJson = jsonDecode(response.body);
        studentData = convertDateToJson;
      });
      return studentData;
      }


@override
  void initState() {
    fetchStudentData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchStudentData(),
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
          return myData != null 
          ? 
          GetMarkedStudentList(selectedClass: widget.selectedClass, selectedCourse: widget.selectedCourse,) 
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
                    'No record found'
                  ),
                ),
              ],
            ),
             floatingActionButton: FloatingActionButton(
        onPressed: (){
            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddStudent()));
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











class GetMarkedStudentList extends StatefulWidget {
  GetMarkedStudentList({this.selectedCourse, this.selectedClass, this.request});
  final selectedCourse;
  final String selectedClass;
  final String request;
  @override
  _GetMarkedStudentListState createState() => _GetMarkedStudentListState();
}

class _GetMarkedStudentListState extends State<GetMarkedStudentList> {

  Future<String> fetchStudentData() async {
        final response =
        await http.post("https://teamcoded.com.ng/attendance.php", body: {
        "request": "FETCH MARKED STUDENTS",
        "course": widget.selectedCourse,
        "level": widget.selectedClass
          });
        setState(() {
        var convertDateToJson = jsonDecode(response.body);
        studentList = convertDateToJson;
      });
      return "Success";
      }



        Future<List> countStudentList() async {

        final response =
            await http.post('https://teamcoded.com.ng/attendance.php', body: {
          "request": "COUNT MARKED STUDENT",
          "course": widget.selectedCourse,
        "level": widget.selectedClass
    });

      var convertDataToJson = jsonDecode(response.body);
      setState(() {
        countStudent = convertDataToJson;
      });
      return countStudent;
  }

 


@override
  void initState() {
    fetchStudentData();
    countStudentList();
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
              height: 5,
            ),
            Expanded(
              flex: 1,
              child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Attended Students',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Quando',
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700),
                  ),
                   CircleAvatar(
                  radius: 20,
                 child: Text( studentList.isNotEmpty 
                ? "${countStudent[0]['count(*)'].toString()}"
                : "0",), 
                )
                ],
              ),
            ),
            ),
            SizedBox(height: 20.0,),
          Expanded(flex: 10,
          child:
           Container(
             height: MediaQuery.of(context).size.height*0.73,
             child: studentList != null ? ListView.builder(
                shrinkWrap: true,
                 itemCount: studentList == null ? 0 : studentList.length,
                itemBuilder: (BuildContext context, int index) {
                   if (studentList != null) {
                      return studentTile(
                    context,
                    studentList[index]['student_name'],
                    studentList[index]['regno'],
                    studentList[index]['sign_in'] == "1" ? Icons.check_circle : Icons.cancel,
                    (){
                       Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScanOut(selectedAttendance: studentList[index]['attendance_id'], selectedRegno: studentList[index]['regno'],)));
                    }, 
                      () async{

              //                showDialog(
              //   context: context,
              //   builder: (BuildContext context) {
              //     // return object of type Dialog
              //     return AlertDialog(
              //       title: new Text("Confirm"),
              //       content:
              //           new Text("Are you sure you want to delete this student?"),
              //       actions: <Widget>[
              //         // usually buttons at the bottom of the dialog
              //         Container(
              //           padding: EdgeInsets.only(left: 10.0, right: 10.0),
              //           width: MediaQuery.of(context).size.width,
              //           child: Row(
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: <Widget>[
              //                 new RaisedButton(
              //                   color: Colors.red,
              //                   child: Row(
              //                     children: <Widget>[
              //                       new Text("YES"),
              //                       SizedBox(width: 5.0),
              //                       Icon(Icons.check_circle),
              //                     ],
              //                   ),
              //                   onPressed: () async{
              //                   var id = studentList[index]['student_id'];
              //                     await http.post("https://teamcoded.com.ng/attendance.php", body: {
              //                         "request": "DELETE STUDENT",
              //                         "id": id,
              //                         });
              //                  fetchStudentData();
              //                  countStudentList();
              //                     Navigator.of(context, rootNavigator: true).pop('dialog');
              //                   },
              //                 ),
              //                 new RaisedButton(
              //                   color: Colors.blueAccent,
              //                   child: Row(
              //                     children: <Widget>[
              //                       new Text("NO"),
              //                       SizedBox(width: 5.0),
              //                       Icon(Icons.cancel)
              //                     ],
              //                   ),
              //                   onPressed: () {
              //                     Navigator.of(context, rootNavigator: true).pop('dialog');
              //                   },
              //                 ),
              //               ]),
              //         )
              //       ],
              //     );
              //   },
              // );
                            
                          },
                    
                    fetchStudentData(),
                    studentList[index]['sign_out'] == "1" ? Icon(Icons.check_circle,size: 20, color: Colors.green,) : Icon(Icons.cancel,size: 20, color: Colors.red,),
                  );
                   }else{
                     Center(child: CircularProgressIndicator());
                   }
                }
              
              ) :  Center(child: Text('Loading...', style: TextStyle(color: Colors.black),),),
           ),
          ),
   
         ], 
        ),
      ),
      
    );
  }
}

Widget studentTile(context, String name, String regno, IconData signIn, Function route, Function route2, fetchStudentData, Icon signOut,){
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
                                      Image.asset('img/user-icon.jpg',height: 70, width: 70,),
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
                                              name,
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
                                              "Reg No: $regno",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.black54,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox( height: 5.0,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                  "Signed In: ",
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.black54,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                    Icon(signIn,size: 20, color: Colors.green,),
                                                  ],
                                                ),

                                                Row(
                                                  children: [
                                                    Text(
                                                  "Signed Out: ",
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.black54,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                    signOut
                                                  ],
                                                ),
                                              ],
                                            )
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
                          icon: Icon(Icons.arrow_forward_ios,size: 20, color: Colors.black54,),
                          onPressed: route2
                        )
                              ],
                            ),
                      ),
                      ),
                    ),
                    SizedBox(height: 15,),
    ],
  );
}