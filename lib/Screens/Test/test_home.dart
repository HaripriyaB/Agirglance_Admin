import 'package:agriglance_admin/Screens/Test/add_category.dart';
import 'package:agriglance_admin/Screens/Test/add_subject.dart';
import 'package:flutter/material.dart';

import './approve_tests.dart';
class TestHome extends StatefulWidget {
  @override
  _TestHomeState createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text("Add Category"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddCategory()));
                }),
            SizedBox(
              height: 25.0,
            ),
             RaisedButton(
                child: Text("Add Subject"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddSubject()));
                }),

            SizedBox(
              height: 25.0,
            ),
            RaisedButton(
                child: Text("Approve tests"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>ApproveTests()));
                }),
          ],
        ),
      ),
    );
  }
}
