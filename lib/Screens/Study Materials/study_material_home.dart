import 'package:agriglance_admin/Constants/study_material_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'add_study_material.dart';

class StudyMaterialsHome extends StatefulWidget {
  @override
  _StudyMaterialsHomeState createState() => _StudyMaterialsHomeState();
}

class _StudyMaterialsHomeState extends State<StudyMaterialsHome> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final papersCollectionReference =
      FirebaseStorage.instance.ref().child("studyMaterials");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Study Materials"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddStudyMaterial(
                      uid: auth.currentUser.uid,
                      uName: auth.currentUser.displayName)));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("study_materials")
              .orderBy("isApprovedByAdmin", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot papers = snapshot.data.documents[index];
                      return GestureDetector(
                        onTap: () async {
                          _launchURL(papers['pdfUrl']);
                        },
                        child: StudyMaterialCard(
                          type: papers['type'],
                          title: papers['title'],
                          description: papers['description'],
                          pdfUrl: papers['pdfUrl'],
                          postedByName: papers['postedByName'],
                          postedBy : papers['postedBy'],
                          fileName: papers['fileName'],
                          approved: papers['isApprovedByAdmin'],
                          id: papers.id,
                          index: index,
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }

  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
