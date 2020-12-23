import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  QuestionCard(
      {this.question,
      this.quizName,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.correct,
      this.isApproved,
      this.docId});

  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String correct;
  final String quizName;
  final bool isApproved;
  final String docId;

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: <Widget>[
        Text("${widget.question}"),
        SizedBox(height: 10.0),
        Text("${widget.option1}"),
        SizedBox(height: 5.0),
        Text("${widget.option2}"),
        SizedBox(height: 5.0),
        Text("${widget.option3}"),
        SizedBox(height: 5.0),
        Text("${widget.option4}"),
        SizedBox(height: 5.0),
        if(!widget.isApproved)
            RaisedButton(
              child: Text("Approve"),
              color: Colors.blueAccent,
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection("QuizTestName")
                    .doc(widget.quizName)
                    .collection("questions")
                    .doc(widget.docId)
                    .update({"isApprovedByAdmin": true});
              },
            ),
        SizedBox(height: 5.0),
        RaisedButton(
            color: Colors.red,
            child: Text(
              "Delete",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
            ),
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection("QuizTestName")
                  .doc(widget.quizName)
                  .collection("questions")
                  .doc(widget.docId)
                  .delete();
            })
      ]),
    );
  }
}
