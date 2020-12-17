import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  final String dob;
  final String email;
  final String name;
  final String qualification;
  final String university;
  final int points;
  final String uid;
  UserCard(
      {this.dob,
      this.email,
      this.name,
      this.points,
      this.qualification,
      this.university,
      this.uid});
  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Card(
      child: ExpansionTile(
        leading: CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(
          "${widget.name}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                      text: "Email ID: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18.0),
                      children: [
                    TextSpan(
                        text: "${widget.email}",
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Colors.black,
                            fontSize: 14.0))
                  ])),
              SizedBox(
                height: 5.0,
              ),
              RichText(
                  text: TextSpan(
                      text: "DOB: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18.0),
                      children: [
                    TextSpan(
                        text: "${widget.dob}",
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Colors.black,
                            fontSize: 14.0))
                  ])),
              SizedBox(
                height: 5.0,
              ),
              RichText(
                  text: TextSpan(
                      text: "University: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18.0),
                      children: [
                    TextSpan(
                        text: "${widget.university}",
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Colors.black,
                            fontSize: 14.0))
                  ])),
              SizedBox(
                height: 5.0,
              ),
              RichText(
                  text: TextSpan(
                      text: "Qualification: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18.0),
                      children: [
                    TextSpan(
                        text: "${widget.qualification}",
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Colors.black,
                            fontSize: 14.0))
                  ])),
              SizedBox(
                height: 5.0,
              ),
              RichText(
                  text: TextSpan(
                      text: "Points: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18.0),
                      children: [
                    TextSpan(
                        text: "${widget.points}",
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Colors.black,
                            fontSize: 14.0))
                  ])),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    color: Colors.green,
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection("users")
                          .doc(widget.uid)
                          .update({
                        'isAdmin': true,
                      });
                    },
                    child: Text(
                      "Make Admin",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.yellowAccent,
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection("users")
                          .doc(widget.uid)
                          .update({
                        'isAdmin': false,
                      });
                    },
                    child: Text(
                      "Remove As Admin",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.red,
                    onPressed: () => print("Tapped"),
                    child: Text(
                      "Ban User",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () => print("Tapped"),
                    child: Text("Reset Points",
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ],
      ),
    );
  }
}
