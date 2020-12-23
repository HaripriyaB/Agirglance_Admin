import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddSubject extends StatefulWidget {
  @override
  _AddSubjectState createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _subject = "";
  List<String> _categories = [];
  String _selectedItem = "";
  void getCategories() async {
    await FirebaseFirestore.instance
        .collection("testCategories")
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                _categories.add(doc["category"]);
              })
            });
  }

  @override
  void initState() {
    // TODO: implement initState
    getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Subject"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
                value: _selectedItem,
                onChanged: (value) {
                  setState(() {
                    _selectedItem = value;
                  });
                },
                selectedItemBuilder: (BuildContext context) {
                  return _categories.map<Widget>((String item) {
                    return Text("item");
                  }).toList();
                },
                items: _categories.map((String item) {
                  return DropdownMenuItem<String>(
                    child: Text('$item'),
                    value: item,
                  );
                })),
            TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(100)],
              validator: (val) => val.isEmpty ? 'Subject is required' : null,
              onSaved: (val) => _subject = val,
              decoration: InputDecoration(
                hintText: 'Enter Subject',
                labelText: 'Subject',
              ),
            ),
            RaisedButton(
                child: Text("Submit"),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await FirebaseFirestore.instance
                        .collection("testCategories")
                        .doc(_selectedItem)
                        .collection("subjects")
                        .add({"subject": _subject});

                    await FirebaseFirestore.instance
                        .collection("testSubjects")
                        .doc(_subject)
                        .set({});
                  }
                })
          ],
        ),
      ),
    );
  }
}
