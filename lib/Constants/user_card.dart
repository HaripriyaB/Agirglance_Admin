import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserCard extends StatefulWidget {
  final String dob;
  final String email;
  final String name;
  final String qualification;
  final String university;
  final int points;
  final String uid;
  final bool isBanned;
  final bool isAdmin;

  UserCard(
      {this.dob,
      this.email,
      this.name,
      this.points,
      this.qualification,
      this.university,
      this.uid,
      this.isBanned,
      this.isAdmin});

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
        title: Row(
          children: [
            Text(
              "${widget.name}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            SizedBox(
              width: 10.0,
            ),
            Row(
              children: [
                if (widget.isAdmin)
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Admin",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    ),
                  ),
                SizedBox(
                  width: 10.0,
                ),
                if (widget.isBanned)
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Banned User",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    ),
                  )
              ],
            ),
          ],
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
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
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
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
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
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
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
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
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
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
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!widget.isAdmin)
                      RaisedButton(
                        color: Colors.green,
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(widget.uid)
                              .update({
                            'isAdmin': true,
                          });
                          showToastMessage(widget.name + " is admin now");
                        },
                        child: Text(
                          "Make Admin",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    if (widget.isAdmin)
                      RaisedButton(
                        color: Colors.yellowAccent,
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(widget.uid)
                              .update({
                            'isAdmin': false,
                          });
                          showToastMessage(
                              widget.name + " is removed as admin now");
                        },
                        child: Text(
                          "Remove As Admin",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    if (!widget.isBanned)
                      RaisedButton(
                        color: Colors.red,
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(widget.uid)
                              .update({
                            'isBanned': true,
                          });
                          showToastMessage(widget.name + " is banned now");
                        },
                        child: Text(
                          "Ban User",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    if (widget.isBanned)
                      RaisedButton(
                        color: Colors.deepOrangeAccent,
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(widget.uid)
                              .update({
                            'isBanned': false,
                          });
                          showToastMessage(widget.name + " is unbanned now");
                        },
                        child: Text(
                          "Unban User",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    if (widget.points > 0)
                      RaisedButton(
                        color: Colors.blue,
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(widget.uid)
                              .update({
                            'points': 0,
                          });
                          showToastMessage(
                              widget.name + " points are set to 0 now");
                        },
                        child: Text("Reset Points",
                            style: TextStyle(color: Colors.white)),
                      )
                  ],
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ],
      ),
    );
  }

  void showToastMessage(String message) {
    Fluttertoast.showToast(msg: message, gravity: ToastGravity.BOTTOM);
  }
}
