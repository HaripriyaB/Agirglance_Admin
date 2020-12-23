import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:agriglance_admin/Services/authentication_service.dart';
import '../Screens/Quiz/quiz_question.dart';

class QuizCard extends StatefulWidget {
  final String quizName;
  final String uid;
  final bool isApproved;
  QuizCard({this.quizName, this.uid, this.isApproved});
  @override
  _QuizCardState createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder:(context)=>QuizQuestions(quizName: widget.quizName,)));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.indigo, width: 3.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${widget.quizName}"),
                if(!widget.isApproved)
                    RaisedButton(
                        color: Colors.blueAccent,
                        child: Text("Approve"),
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection("QuizTestName")
                              .doc(widget.quizName)
                              .update({
                            "isApprovedByAdmin": true,
                          });
                        }),
                SizedBox(height: 5.0),
                RaisedButton(
                    color: Colors.red,
                    child: Text(
                      "Delete",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection("QuizTestName")
                          .doc(widget.quizName)
                          .delete();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
