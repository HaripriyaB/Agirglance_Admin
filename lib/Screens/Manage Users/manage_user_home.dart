import 'package:agriglance_admin/Constants/user_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ManageUser extends StatefulWidget {
  @override
  _ManageUserState createState() => _ManageUserState();
}

class _ManageUserState extends State<ManageUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot user = snapshot.data.documents[index];
                    return UserCard();
                  },
                );
        },
      ),
    ));
  }
}
