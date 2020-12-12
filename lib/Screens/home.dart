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
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Admin Panel",
            style: TextStyle(fontSize: 30.0),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 18.0, right: deviceWidth / 18),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    screen = 0;
                  });
                },
                child: Text(
                  "Test",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.0, right: deviceWidth / 18),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    screen = 1;
                  });
                },
                child: Text("Material",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.0, right: deviceWidth / 18),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    screen = 2;
                  });
                },
                child:
                    Text("QNA", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.0, right: deviceWidth / 18),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    screen = 3;
                  });
                },
                child:
                    Text("Jobs", style: TextStyle(fontWeight: FontWeight.bold)),
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
