import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:core';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final bool approved;
  final String newsTitle;
  final String newsDescription;
  final String newsFile;
  final String newsDate;
  final String newsLink;
  final String newsPostedBy;
  final String newsId;

  NewsCard(
      {this.approved,
      this.newsTitle,
      this.newsDescription,
      this.newsDate,
      this.newsLink,
      this.newsFile,
      this.newsPostedBy,
      this.newsId});

  final TextStyle linkStyle = TextStyle(color: Colors.blue, fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(deviceWidth / 25),
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFF50E096), width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    ((approved == true)
                        ? "Approved by Admin"
                        : "Waiting for approval"),
                    style: TextStyle(fontSize: 8.0),
                  ),
                  if (!approved)
                    RaisedButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection("News")
                            .doc(newsId)
                            .update({
                          'isApprovedByAdmin': true,
                        });
                      },
                      child: Text("Approve"),
                    ),
                ],
              ),
              Text(
                "$newsTitle".toUpperCase(),
                style: GoogleFonts.oswald(
                    fontWeight: FontWeight.w500, fontSize: 30.0),
              ),
              Image.network(
                newsFile,
                height: deviceHeight / 2,
                width: deviceWidth,
              ),
              RichText(
                text: TextSpan(
                    text: "Description: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.black),
                    children: [
                      TextSpan(
                          text: "$newsDescription",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                              fontSize: 14.0))
                    ]),
              ),
              // Text(
              //   'Description: $newsDescription',
              // ),
              GestureDetector(
                onTap: () {
                  _launchURL(newsLink);
                },
                child: Text('Click here', style: TextStyle(color: Colors.blue)),
              ),
              Text(
                "${DateFormat('yMMMMd').format(DateTime.parse(newsDate))}",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              (newsPostedBy != null && newsPostedBy != "")
                  ? RichText(
                      text: TextSpan(
                          text: "Posted By: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.black),
                          children: [
                            TextSpan(
                                text: "$newsPostedBy",
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black,
                                    fontSize: 14.0))
                          ]),
                    )
                  : RichText(
                      text: TextSpan(
                          text: "Posted By: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.black),
                          children: [
                            TextSpan(
                                text: "Anonymous",
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black,
                                    fontSize: 14.0))
                          ]),
                    ),
            ]),
      ),
    );
  }

  void _launchURL(url) async => await canLaunch(url)
      ? await launch(url)
      : Fluttertoast.showToast(msg: "Could not launch $url");
}
