import 'package:agriglance_admin/Screens/Polls/poll_vote.dart';
import 'package:agriglance_admin/Services/authentication_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PollCard extends StatefulWidget {
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final int totalVotesOnOption1;
  final int totalVotesOnOption2;
  final int totalVotesOnOption3;
  final int totalVotesOnOption4;
  final int index;
  final String postedByName;
  final String postedBy;
  final bool approved;
  final List voters;
  final String pollID;

  PollCard(
      {this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.question,
      this.totalVotesOnOption1,
      this.totalVotesOnOption2,
      this.totalVotesOnOption3,
      this.totalVotesOnOption4,
      this.index,
      this.postedByName,
      this.postedBy,
      this.approved,
      this.voters,
      this.pollID});

  @override
  _PollCardState createState() => _PollCardState();
}

class _PollCardState extends State<PollCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PollVote(
                        question: widget.question,
                        option1: widget.option1,
                        option2: widget.option2,
                        option3: widget.option3,
                        option4: widget.option4,
                        totalVotesOnOption1: widget.totalVotesOnOption1,
                        totalVotesOnOption2: widget.totalVotesOnOption2,
                        totalVotesOnOption3: widget.totalVotesOnOption3,
                        totalVotesOnOption4: widget.totalVotesOnOption4,
                        voters: widget.voters,
                        pollID: widget.pollID,
                      ))),
          child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.index + 1}. ${widget.question}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    (widget.postedByName != null && widget.postedByName != "")
                        ? Text(
                            "Created By: " + widget.postedByName,
                            style: TextStyle(fontSize: 16.0),
                          )
                        : Text(
                            "Created By : Anonymous",
                            style: TextStyle(fontSize: 16.0),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "Total Votes: ${widget.totalVotesOnOption1 + widget.totalVotesOnOption2 + widget.totalVotesOnOption3 + widget.totalVotesOnOption4}"),
                        Text(
                          ((widget.approved == true)
                              ? "Approved by Admin"
                              : "Waiting for approval"),
                          style: TextStyle(fontSize: 8.0),
                        ),
                        if (!widget.approved)
                          RaisedButton(
                            onPressed: () async {
                              await FirebaseFirestore.instance
                                  .collection("polls")
                                  .doc(widget.pollID)
                                  .update({
                                'isApprovedByAdmin': true,
                              });
                              await context
                                  .read<AuthenticationService>()
                                  .addPoints(widget.postedBy, 5)
                                  .then((value) => print(
                                      "**********************$value****************"));
                            },
                            child: Text("Approve"),
                          ),
                        SizedBox(
                          height: 5.0,
                        ),
                        RaisedButton(
                          color: Colors.red,
                          onPressed: () async {
                            await FirebaseFirestore.instance
                                .collection("polls")
                                .doc(widget.pollID)
                                .delete();
                          },
                          child: Text(
                            "Delete",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ));
  }
}
