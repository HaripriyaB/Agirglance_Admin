import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  final String dob;
  final String email;
  final String name;
  final String qualification;
  final String university;
  final int points;
  UserCard(
      {this.dob,
      this.email,
      this.name,
      this.points,
      this.qualification,
      this.university});
  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
