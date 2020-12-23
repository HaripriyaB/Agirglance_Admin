import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Screens/Test/approve_test_questions.dart';

class TestCard extends StatefulWidget {
  final String testName;
  final String subjectName;
  final bool isApproved;
  final String docId;
  TestCard({this.testName, this.subjectName, this.isApproved, this.docId});
  @override
  _TestCardState createState() => _TestCardState();
}

class _TestCardState extends State<TestCard> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder:(context)=>QuizQuestions(quizName: widget.testName,)));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.indigo, width: 3.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("${widget.testName}"),
                  if(!widget.isApproved)
                      RaisedButton(
                          child: Text('Approve'),
                          color: Colors.blueAccent,
                          onPressed: () async {
                            await FirebaseFirestore.instance
                                .collection("testSubjects")
                                .doc(widget.subjectName)
                                .collection("testNames")
                                .doc(widget.docId)
                                .update({"isApprovedByAdmin": true});
                          }),
                  SizedBox(height: 5.0),
                  RaisedButton(
                      child: Text('Delete'),
                      color: Colors.red,
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection("testSubjects")
                            .doc(widget.subjectName)
                            .collection("testNames")
                            .doc(widget.docId)
                            .delete();
                      }),
                ],
              )),
        ),
      ),
    );
  }
}
