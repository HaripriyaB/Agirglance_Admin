import 'package:agriglance_admin/Services/authentication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 20.0);
  final TextStyle linkStyle = TextStyle(color: Colors.blue, fontSize: 20.0);
  var opacity = 0.0;
  var response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Agriglance")),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: opacity,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.yellow,
                  strokeWidth: 8,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: RaisedButton(
                  color: Colors.yellow,
                  onPressed: () async {
                    setState(() {
                      opacity = 1.0;
                    });
                    response = await context
                        .read<AuthenticationService>()
                        .signIn(emailController.text, passwordController.text);
                    if (response != "true") {
                      setState(() {
                        opacity = 0.0;
                      });
                      Fluttertoast.showToast(
                          msg: "User is not Admin!",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM);
                    }
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
