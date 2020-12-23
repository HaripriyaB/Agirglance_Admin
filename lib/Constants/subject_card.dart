import 'package:flutter/material.dart';
import '../Screens/Test/approve_subject_test.dart';
class SubjectCard extends StatelessWidget {
  SubjectCard({this.subject});
  final String subject;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SingleSubject(
                      subjectName: subject,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(color: Colors.black, width: 2.0),
                  left: BorderSide(color: Colors.black, width: 2.0),
                  top: BorderSide(color: Colors.black, width: 2.0),
                  bottom: BorderSide(color: Colors.black, width: 2.0))),
          child: ListTile(
            title: Text(
                        "$subject ",
                        style: TextStyle(fontSize: 22.0),
                      )
          ),
        ),
      ),
    );
  }
}
