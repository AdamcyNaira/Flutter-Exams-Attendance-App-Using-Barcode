import 'dart:async';
import 'dart:convert';

import 'package:attendance/screens/admin/coursesList.dart';
import 'package:attendance/screens/admin/select_course.dart';
import 'package:attendance/screens/admin/student_details.dart';
import 'package:attendance/util/constants.dart';
import 'package:attendance/widgets/users_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;

List studentData =[];



class Scanqr extends StatefulWidget {
  Scanqr({this.selectedClass, this.selectedCourse});
  final String selectedClass;
  final String selectedCourse;

  @override
  _ScanqrState createState() => _ScanqrState();
}

class _ScanqrState extends State<Scanqr> {

  String qrCode;
  bool data = false;
  bool isLoading = false;

   Future<List> fetchStudentData() async {
        final response =
        await http.post("https://teamcoded.com.ng/attendance.php", body: {
        "request": "FETCH STUDENT DATA",
        "student" : qrCode,

          });
       
        setState(() {
        var convertDateToJson = jsonDecode(response.body);
        studentData = convertDateToJson;
      });
      return studentData;
      }


  Future<void> scanQRCode() async {
    final barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true, ScanMode.QR);

    if (!mounted) return;
      
      setState(() {
        qrCode = barcodeScanRes;
      });

       fetchStudentData();
      setState(() {
        isLoading = true;
      });
      isLoading
          ?_showDialog() 
          : Navigator.of(context, rootNavigator: true).pop('dialog');
      Timer(Duration(seconds: 5), () {

       fetchStudentData();
       setState(() {
        isLoading = false; 

      });

       !isLoading
          ? Navigator.of(context, rootNavigator: true).pop('dialog')
          : _showDialog();

        if (qrCode == studentData[0]["regno"] ) {
   Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentDetails(selectedCourse: widget.selectedCourse, selectedClass: widget.selectedClass,qrData: qrCode)));
        
        }else {
          print("Helo");
            _showerr();
        }  

      });
          

        

      setState(() {
        isLoading = false; 
      });
// _showerr();

        

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
              Flexible(child: new Text("Barcode not found", style: TextStyle(fontSize: 12),)),
            ],
          ),
        );
      },
    );
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

  @override
  void initState() {
    
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
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Text(
                'Scan Student QR Code',
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
    height: MediaQuery.of(context).size.height * 0.40,
    width: MediaQuery.of(context).size.width,
    child: Card(
      child: InkWell(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('img/scan.jpg', fit: BoxFit.fill,height: 276 ,width: MediaQuery.of(context).size.width,),
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
                          'SCAN QR CODE',
                          style: TextStyle(fontSize: 14),
                        ),
                        shape: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(18),
                        textColor: Colors.white,
                        onPressed: () => scanQRCode(),
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