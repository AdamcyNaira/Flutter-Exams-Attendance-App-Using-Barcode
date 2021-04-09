import 'package:attendance/screens/home/home.dart';
import 'package:attendance/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:attendance/screens/home/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:barcode_scan/barcode_scan.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Constants.sharedPref = await SharedPreferences.getInstance();
  runApp(MyApp());
}

  // var qrResult ;
  //  QrImage(data: qrResult,),
  // ScanResult scan = await BarcodeScanner.scan();

  //         setState(() {
  //           qrResult = scan;
  //         });

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

