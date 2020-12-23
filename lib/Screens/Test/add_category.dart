import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _category = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Category"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(100)],
              validator: (val) => val.isEmpty ? 'Category is required' : null,
              onSaved: (val) => _category = val,
              decoration: InputDecoration(
                hintText: 'Enter Category',
                labelText: 'Category',
              ),
            ),
            SizedBox(height: 20.0),
            RaisedButton(
                child: Text("Submit"),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await FirebaseFirestore.instance
                        .collection("testCategories")
                        .doc(_category)
                        .set({
                          "category":_category
                        });

                    _formKey.currentState.reset();
                    Fluttertoast.showToast(
                          msg: "Added Category Successfully",gravity: ToastGravity.BOTTOM);

                  }
                })
          ],
        ),
      ),
    );
  }
}
