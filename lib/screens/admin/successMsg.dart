import 'package:attendance/screens/admin/adminDashboard.dart';
import 'package:attendance/screens/admin/getLevel.dart';
import 'package:attendance/screens/admin/marked_student.dart';
import 'package:attendance/screens/admin/select_level.dart';
import 'package:attendance/util/constants.dart';
import 'package:attendance/widgets/users_widget.dart';
import 'package:flutter/material.dart';


class SuccessMsg extends StatefulWidget {
   SuccessMsg({this.selectedSemester, this.selectedClass});
  final selectedSemester;
  final String selectedClass;

 
  @override
  _SuccessMsgState createState() => _SuccessMsgState();
}

class _SuccessMsgState extends State<SuccessMsg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: exAppBar(title: "", context: context),
      body: Container(
        color: Constants.kPrimaryColor.withOpacity(0.03),
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width, 
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
              SizedBox(
                height: 20,
              ),
            
              SizedBox(height: 10.0,),
              ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                 
                    SizedBox(
                      height: 30,
                    ),
                    
                     CircleAvatar(
                      radius: 70,
                      backgroundColor: Constants.kPrimaryColor.withOpacity(0.6),
                      child: Icon(Icons.check, color: Colors.white, size: 60,),

                    ),
                    SizedBox(height: 30.0,),
                    Center(
                      child: Text(
                  'Success',
                  style: TextStyle(
                        color: Constants.kPrimaryColor.withOpacity(0.5),
                        fontFamily: 'Quando',
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700),
                ),
                    ),

              
                    SizedBox(
                      height: 40,
                    ),
                     Center(
                       child: Text(
                  "Course Material Added Successful",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Quando',
                    color: Colors.black54,
                    fontWeight: FontWeight.w500
                  ),
                       ),
                     ),
                      SizedBox(
                      height: 30,
                    ),

                      SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.45,
                          child:  Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: FlatButton(
                            color: Colors.white,
                            child: Text(
                              'Dashboard',
                              style: TextStyle(fontSize: 14),
                            ),
                            shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.kPrimaryColor.withOpacity(0.6), width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(18),
                            textColor: Constants.kPrimaryColor.withOpacity(0.9),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AdminBottomNav()), (Route<dynamic> route) => false);
                            },
                          ),
                    ),
                        ),
                        SizedBox(width: 0.0,),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.45,
                          child:  Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: FlatButton(
                            color: Colors.white,
                            child: Text(
                              'Previous',
                              style: TextStyle(fontSize: 14),
                            ),
                            shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.kPrimaryColor.withOpacity(0.6), width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(18),
                            textColor: Constants.kPrimaryColor.withOpacity(0.9),
                            onPressed: () {
                             
                           // Navigator.pushReplacement((context), MaterialPageRoute(builder: (context) => CoursesMaterialList(selectedClass: widget.selectedClass, selectedSemester: widget.selectedSemester,)));
                            },
                          ),
                    ),
                        ),
                      ],
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



class SuccessMsgCourse extends StatefulWidget {
  @override
  _SuccessMsgCourseState createState() => _SuccessMsgCourseState();
}

class _SuccessMsgCourseState extends State<SuccessMsgCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: exAppBar(title: " ", context: context),
      body: Container(
        color: Constants.kPrimaryColor.withOpacity(0.03),
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width, 
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
              SizedBox(
                height: 20,
              ),
            
              SizedBox(height: 10.0,),
              ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                 
                    SizedBox(
                      height: 30,
                    ),
                    
                     CircleAvatar(
                      radius: 70,
                      backgroundColor: Constants.kPrimaryColor.withOpacity(0.6),
                      child: Icon(Icons.check, color: Colors.white, size: 60,),

                    ),
                    SizedBox(height: 30.0,),
                    Center(
                      child: Text(
                  'Success',
                  style: TextStyle(
                        color: Constants.kPrimaryColor.withOpacity(0.5),
                        fontFamily: 'Quando',
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700),
                ),
                    ),

              
                    SizedBox(
                      height: 40,
                    ),
                     Center(
                       child: Text(
                  "New course was added successful",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Quando',
                    color: Colors.black54,
                    fontWeight: FontWeight.w500
                  ),
                       ),
                     ),
                      SizedBox(
                      height: 30,
                    ),

                      SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.45,
                          child:  Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: FlatButton(
                            color: Colors.white,
                            child: Text(
                              'Dashboard',
                              style: TextStyle(fontSize: 14),
                            ),
                            shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.kPrimaryColor.withOpacity(0.6), width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(18),
                            textColor: Constants.kPrimaryColor.withOpacity(0.9),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AdminBottomNav()), (Route<dynamic> route) => false);
                            },
                          ),
                    ),
                        ),
                        SizedBox(width: 0.0,),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.45,
                          child:  Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: FlatButton(
                            color: Colors.white,
                            child: Text(
                              'Previous',
                              style: TextStyle(fontSize: 14),
                            ),
                            shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.kPrimaryColor.withOpacity(0.6), width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(18),
                            textColor: Constants.kPrimaryColor.withOpacity(0.9),
                            onPressed: () {
                             
                            //Navigator.pushReplacement((context), MaterialPageRoute(builder: (context) => CoursesMaterialList(selectedClass: w,)));
                            },
                          ),
                    ),
                        ),
                      ],
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




class AttendanceSuccessMsg extends StatefulWidget {
  //  AttendanceSuccessMsg({this.selectedSemester, this.selectedClass});
  // final selectedSemester;
  // final String selectedClass;

 
  @override
  _AttendanceSuccessMsgState createState() => _AttendanceSuccessMsgState();
}

class _AttendanceSuccessMsgState extends State<AttendanceSuccessMsg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: exAppBar(title: "", context: context),
      body: Container(
        color: Constants.kPrimaryColor.withOpacity(0.03),
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width, 
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
              SizedBox(
                height: 20,
              ),
            
              SizedBox(height: 10.0,),
              ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                 
                    SizedBox(
                      height: 30,
                    ),
                    
                     CircleAvatar(
                      radius: 70,
                      backgroundColor: Constants.kPrimaryColor.withOpacity(0.6),
                      child: Icon(Icons.check, color: Colors.white, size: 60,),

                    ),
                    SizedBox(height: 30.0,),
                    Center(
                      child: Text(
                  'Success',
                  style: TextStyle(
                        color: Constants.kPrimaryColor.withOpacity(0.5),
                        fontFamily: 'Quando',
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700),
                ),
                    ),

              
                    SizedBox(
                      height: 40,
                    ),
                     Column(
                       children: [
                         Center(
                           child: Text(
                  "Student Attendance Marked Successfuly",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Quando',
                    color: Colors.black54,
                    fontWeight: FontWeight.w500
                  ),
                           ),
                         ),
                       ],
                     ),
                      SizedBox(
                      height: 30,
                    ),

                      SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.45,
                          child:  Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: FlatButton(
                            color: Colors.white,
                            child: Text(
                              'Dashboard',
                              style: TextStyle(fontSize: 14),
                            ),
                            shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.kPrimaryColor.withOpacity(0.6), width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(18),
                            textColor: Constants.kPrimaryColor.withOpacity(0.9),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AdminBottomNav()), (Route<dynamic> route) => false);
                            },
                          ),
                    ),
                        ),
                        SizedBox(width: 0.0,),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.45,
                          child:  Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: FlatButton(
                            color: Colors.white,
                            child: Text(
                              'Previous',
                              style: TextStyle(fontSize: 14),
                            ),
                            shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.kPrimaryColor.withOpacity(0.6), width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(18),
                            textColor: Constants.kPrimaryColor.withOpacity(0.9),
                            onPressed: () {
                             
                           Navigator.pushReplacement((context), MaterialPageRoute(builder: (context) => SelectLevel()));
                            },
                          ),
                    ),
                        ),
                      ],
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




class SignedAttendanceSuccessMsg extends StatefulWidget {
  //  AttendanceSuccessMsg({this.selectedSemester, this.selectedClass});
  // final selectedSemester;
  // final String selectedClass;

 
  @override
  _SignedAttendanceSuccessMsgState createState() => _SignedAttendanceSuccessMsgState();
}

class _SignedAttendanceSuccessMsgState extends State<SignedAttendanceSuccessMsg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: exAppBar(title: "", context: context),
      body: Container(
        color: Constants.kPrimaryColor.withOpacity(0.03),
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width, 
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
              SizedBox(
                height: 20,
              ),
            
              SizedBox(height: 10.0,),
              ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                 
                    SizedBox(
                      height: 30,
                    ),
                    
                     CircleAvatar(
                      radius: 70,
                      backgroundColor: Constants.kPrimaryColor.withOpacity(0.6),
                      child: Icon(Icons.check, color: Colors.white, size: 60,),

                    ),
                    SizedBox(height: 30.0,),
                    Center(
                      child: Text(
                  'Success',
                  style: TextStyle(
                        color: Constants.kPrimaryColor.withOpacity(0.5),
                        fontFamily: 'Quando',
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700),
                ),
                    ),

              
                    SizedBox(
                      height: 40,
                    ),
                     Column(
                       children: [
                         Center(
                           child: Text(
                  "Student Attendance Marked Successfuly",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Quando',
                    color: Colors.black54,
                    fontWeight: FontWeight.w500
                  ),
                           ),
                         ),
                       ],
                     ),
                      SizedBox(
                      height: 30,
                    ),

                      SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.45,
                          child:  Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: FlatButton(
                            color: Colors.white,
                            child: Text(
                              'Dashboard',
                              style: TextStyle(fontSize: 14),
                            ),
                            shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.kPrimaryColor.withOpacity(0.6), width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(18),
                            textColor: Constants.kPrimaryColor.withOpacity(0.9),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AdminBottomNav()), (Route<dynamic> route) => false);
                            },
                          ),
                    ),
                        ),
                        SizedBox(width: 0.0,),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.45,
                          child:  Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: FlatButton(
                            color: Colors.white,
                            child: Text(
                              'Previous',
                              style: TextStyle(fontSize: 14),
                            ),
                            shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.kPrimaryColor.withOpacity(0.6), width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(18),
                            textColor: Constants.kPrimaryColor.withOpacity(0.9),
                            onPressed: () {
                             
                           Navigator.pushReplacement((context), MaterialPageRoute(builder: (context) => SelectLevelList()));
                            },
                          ),
                    ),
                        ),
                      ],
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



class ErrorMsg extends StatefulWidget {
  //  AttendanceSuccessMsg({this.selectedSemester, this.selectedClass});
  // final selectedSemester;
  // final String selectedClass;

 
  @override
  _ErrorMsgState createState() => _ErrorMsgState();
}

class _ErrorMsgState extends State<ErrorMsg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: exAppBar(title: "", context: context),
      body: Container(
        color: Constants.kPrimaryColor.withOpacity(0.03),
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width, 
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
              SizedBox(
                height: 20,
              ),
            
              SizedBox(height: 10.0,),
              ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                 
                    SizedBox(
                      height: 30,
                    ),
                    
                     Icon(Icons.cancel, color: Colors.red[300], size: 90,),
                    SizedBox(height: 30.0,),
                    Center(
                      child: Text(
                  'Invalid QrCode',
                  style: TextStyle(
                        color: Colors.red[300],
                        fontFamily: 'Quando',
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700),
                ),
                    ),

              
                    SizedBox(
                      height: 40,
                    ),
                     Column(
                       children: [
                         Center(
                           child: Text(
                  "No record found",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Quando',
                    color: Colors.black54,
                    fontWeight: FontWeight.w500
                  ),
                           ),
                         ),
                       ],
                     ),
                      SizedBox(
                      height: 30,
                    ),

                      SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width*.80,
                          child:  Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: FlatButton(
                            color: Colors.white,
                            child: Text(
                              'Dashboard',
                              style: TextStyle(fontSize: 14),
                            ),
                            shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.kPrimaryColor.withOpacity(0.6), width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(18),
                            textColor: Constants.kPrimaryColor.withOpacity(0.9),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AdminBottomNav()), (Route<dynamic> route) => false);
                            },
                          ),
                    ),
                        )
                       
                      ],
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
