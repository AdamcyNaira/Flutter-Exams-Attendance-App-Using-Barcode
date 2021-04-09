import 'package:attendance/util/constants.dart';
import 'package:attendance/widgets/users_widget.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
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
              child: Text(
                'About Software',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Quando',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 30.0,),
            Center(
                          child: Image(
                            image:  AssetImage(
                            'img/sqr.jpg',
                            ),
                            height: 250,
                            width: 300,
                            ),
                          ),
                           SizedBox(
                  height: 25.0,
                ),
            Text(
                    'This is a flexible mobile app that allows examiner to capture students attendance in an examination hall using barcode scanner',
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'raleway',
                        fontSize: 18,),
                        textAlign: TextAlign.center,
                  ),
         ], 
        ),
      ),
    );
  }
}