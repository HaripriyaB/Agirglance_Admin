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
                    bool admin = user.data().containsKey('isAdmin')
                        ? user['isAdmin']
                        : false;
                    bool banned = user.data().containsKey('isBanned')
                        ? user['isBanned']
                        : false;
                    return UserCard(
                      dob: user['dob'],
                      email: user['email'],
                      name: user['fullName'],
                      qualification: user['qualification'],
                      university: user['university'],
                      points: user['points'],
                      uid: user['id'],
                      isAdmin: admin,
                      isBanned: banned,
                    );
                  },
                );
        },
      ),
    ));
  }
}
