import 'package:agriglance_admin/Screens/Jobs/job_home.dart';
import 'package:agriglance_admin/Screens/Material/material_home.dart';
import 'package:agriglance_admin/Screens/QNA/qna_home.dart';
import 'package:agriglance_admin/Screens/Test/test_home.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int screen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Admin Panel"),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 15.0, right: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    screen = 0;
                  });
                },
                child: Text("Test"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, right: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    screen = 1;
                  });
                },
                child: Text("Material"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, right: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    screen = 2;
                  });
                },
                child: Text("QNA"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, right: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    screen = 3;
                  });
                },
                child: Text("Jobs"),
              ),
            )
          ],
        ),
        body: (screen == 0)
            ? TestHome()
            : (screen == 1)
                ? MaterialHome()
                : (screen == 2)
                    ? QNAHome()
                    : (screen == 3)
                        ? JobHome()
                        : null);
  }
}
