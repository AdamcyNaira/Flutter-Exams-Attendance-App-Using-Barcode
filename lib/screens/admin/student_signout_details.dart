import 'dart:async';
import 'dart:convert';

import 'package:attendance/screens/admin/successMsg.dart';
import 'package:attendance/util/constants.dart';
import 'package:attendance/widgets/users_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';

List studentData =[];


class GetStudentDetails extends StatefulWidget {
 GetStudentDetails({this.qrData, this.selectedAttendance});
  final qrData;
  final String selectedAttendance;

  @override
  _GetStudentDetailsState createState() => _GetStudentDetailsState();
}

class _GetStudentDetailsState extends State<GetStudentDetails> {


final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoading = false;
  var result;

 Future<List> fetchStudentData() async {
        final response =
        await http.post("https://teamcoded.com.ng/attendance.php", body: {
        "request": "FETCH STUDENT DATA",
        "student" : widget.qrData,

          });
       
        setState(() {
        var convertDateToJson = jsonDecode(response.body);
        studentData = convertDateToJson;
      });
      return studentData;
      }


     



  //        _showSuccessSnackBar() {
  //   final snackbar = new SnackBar(
  //     content: new Text('Student Attendance Marked Successfuly',
  //         style: TextStyle(fontSize: 16.0, color: Colors.greenAccent)),
  //     onVisible: () {
  //       Timer(Duration(seconds: 3), () {
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) => AttendanceSuccessMsg()));
  //       });
  //     },
  //     backgroundColor: Colors.black87,
  //   );
  //   _scaffoldKey.currentState.showSnackBar(snackbar);
  // }



      markAttendance() async{

      result = await Connectivity().checkConnectivity();
      if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
           //_showDialog();
      setState(() {
        isLoading = true;
      });
      isLoading
          ? _showDialog()
          : Navigator.of(context, rootNavigator: true).pop('dialog');
      Timer(Duration(seconds: 3), () {});
          submitAttendance();

        }
      
    
  }



      submitAttendance() async {
          final response =
            await http.post('https://teamcoded.com.ng/attendance.php', body: {
            "request": "SIGNOUT",
            "attendance": widget.selectedAttendance,
      });

     if (response.statusCode == 200) {

      print("object");
      
    }
    
      setState(() {
        isLoading = false; 
      });

      !isLoading
          ? Navigator.of(context, rootNavigator: true).pop('dialog')
          : _showDialog();
       Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => SignedAttendanceSuccessMsg()));
 
    }

   


  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Row(
            children: <Widget>[
              new CircularProgressIndicator(),
              SizedBox(
                width: 25.0,
              ),
              new Text("Please wait..."),
            ],
          ),
        );
      },
    );
  }

   void _showerr() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new IconButton(
                onPressed: (){
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                },
                icon: Icon(Icons.cancel, size: 40.0,),
                color: Constants.kPrimaryColor.withOpacity(0.5),
                iconSize: 10,
              ),
              SizedBox(
                width: 25.0,
              ),
              Flexible(child: new Text("No internet connection", style: TextStyle(fontSize: 14),)),
            ],
          ),
        );
      },
    );
  }

  

@override
  void initState() {
    
    fetchStudentData();
    super.initState();
  }

 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: exAppBar(title: " ", context: context),
      body: Container(
        color: Constants.kPrimaryColor.withOpacity(0.03),
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width, 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
            SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 3.0),
            //   child: Text(
            //     ' Student Details ${studentData[0]["student_name"]}',
            //     style: TextStyle(
            //         color: Colors.black,
            //         fontFamily: 'Quando',
            //         fontSize: 24.0,
            //         fontWeight: FontWeight.w700),
            //   ),
            // ),
              SizedBox(
              height: 10,
            ),
            CircleAvatar( 
              radius: 70,
             // backgroundImage: AssetImage('img/user-icon.jpg'),
              child: Image.asset('img/user-icon.png'),
              backgroundColor: Colors.transparent,
            ),
             SizedBox(
              height: 10,
            ),

             Container(
    height: MediaQuery.of(context).size.height * 0.30,
    width: MediaQuery.of(context).size.width,
    child: Card(
      child: InkWell(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  height: 30,
                  child: Text(
                ' Student Name: ${widget.selectedAttendance}',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Quando',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700),
              ),
                ),
                SizedBox(width: 40,),
                 Container(
                   height: 30,
                  child: Text(
                '${studentData[0]["student_name"]}',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Raleway',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500),
              ),
                ),
              ],
            ),
            Divider(),
             Row(
              children: [
                Container(
                  height: 30,
                  child: Text(
                ' Student Regno:',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Quando',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700),
              ),
                ),
                SizedBox(width: 40,),
                 Container(
                   height: 30,
                  child: Text(
                '${studentData[0]["regno"]}',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Raleway',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500),
              ),
                ),
              ],
            ),
            Divider(),
               Row(
              children: [
                Container(
                  height: 30,
                  child: Text(
                ' Student Level:',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Quando',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700),
              ),
                ),
                SizedBox(width: 40,),
                 Container(
                   height: 30,
                  child: Text(
                '${studentData[0]["class_name"]}',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Raleway',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500),
              ),
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                Container(
                  height: 30,
                  child: Text(
                ' Student Status:',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Quando',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700),
              ),
                ),
                SizedBox(width: 40,),
                 Container(
                   height: 30,
                  child: Text(
                'Active',
                style: TextStyle(
                    color: Colors.green,
                    fontFamily: 'Raleway',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500),
              ),
                ),
              ],
            ),
            Divider(),
          ],
          
        ),
      ),
    ),
  ),

           SizedBox(height: 30.0,),

            Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: FlatButton(
                        color: Constants.kPrimaryColor.withOpacity(0.6),
                        child: Text(
                          'MARK ATTENDANCE',
                          style: TextStyle(fontSize: 14),
                        ),
                        shape: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(18),
                        textColor: Colors.white,
                        onPressed: () =>markAttendance(),
                      ),
                    ),
           
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