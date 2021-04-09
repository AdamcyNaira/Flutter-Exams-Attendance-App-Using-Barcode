import 'dart:async';
import 'dart:convert';

import 'package:attendance/util/constants.dart';
import 'package:attendance/widgets/users_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';
import 'package:barcode_widget/barcode_widget.dart';

List studentData =[];
var studentID;

class GetIDCard extends StatefulWidget {

  @override
  _GetIDCardState createState() => _GetIDCardState();
}

class _GetIDCardState extends State<GetIDCard> {


  bool isLoading = false;
  var result;

 Future<List> fetchStudentData() async {
        final response =
        await http.post("https://teamcoded.com.ng/attendance.php", body: {
        "request": "FETCH STUDENT DATA",
        "student" : studentID,

          });
        setState(() {
        var convertDateToJson = jsonDecode(response.body);
        studentData = convertDateToJson;
      });
      return studentData;
      }



getData() {
      setState(() {
      studentID = Constants.sharedPref.getString("regno");
      });
}

      
@override
  void initState() {
    getData();
    fetchStudentData();
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
            SizedBox(
              height: 20,
            ),
          
              SizedBox(
              height: 10,
            ),
            Center(
              child: BarcodeWidget(
                barcode: Barcode.qrCode(),
                color: Colors.black,
                data: studentData[0]["regno"] ?? "No Data",
                width: 150,
                height: 150,
              ),
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
                ' Student Name:',
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
                          'PRINT ID-CARD',
                          style: TextStyle(fontSize: 14),
                        ),
                        shape: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(18),
                        textColor: Colors.white,
                        onPressed: () {},
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