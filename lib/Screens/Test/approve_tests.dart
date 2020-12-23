import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../Constants/subject_card.dart';

class ApproveTests extends StatefulWidget {
  @override
  _ApproveTestsState createState() => _ApproveTestsState();
}

class _ApproveTestsState extends State<ApproveTests> {
  List<String> _subjects = [];

  void getSubjects() async {
    QuerySnapshot _myDoc =
        await FirebaseFirestore.instance.collection("testSubjects").get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    for (int j = 0; j < _myDocCount.length; j++) {
      DocumentSnapshot i = _myDocCount[j];
      setState(() {
        _subjects.add(i.id.trim());
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getSubjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subjects"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
              child: ListView.builder(
                  itemCount: _subjects.length,
                  itemBuilder: (context, index) {
                    return SubjectCard(
                      subject: _subjects[index],

                    );
                  }))),
    );
  }
}
