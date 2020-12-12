import 'package:agriglance_admin/Screens/News/news_home.dart';
import 'package:agriglance_admin/Screens/Polls/poll_home.dart';
import 'package:agriglance_admin/Screens/Study%20Materials/study_material_home.dart';
import 'package:agriglance_admin/Screens/Videos/videos_home.dart';
import 'package:flutter/material.dart';

class MaterialHome extends StatelessWidget {
  Widget categoryButton(
      String category, BuildContext context, Widget newScreen) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.width * 0.09,
      child: OutlineButton(
        onPressed: () {
          switch (category) {
            case "Study Materials":
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => newScreen));
                break;
              }
            case "Videos":
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => newScreen));
                break;
              }
            case "News and Current Affairs":
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => newScreen));
                break;
              }
            case "Polls":
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => newScreen));
                break;
              }

            default:
              {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Not implemented yet"),
                  duration: Duration(seconds: 1),
                ));
              }
          }
        },
        child: Text(
          category,
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w400),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        borderSide: BorderSide(color: Colors.blue, width: 10.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: deviceHeight / 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              categoryButton("Videos", context, VideosHome()),
              categoryButton("Study Materials", context, StudyMaterialsHome()),
            ],
          ),
          SizedBox(
            height: deviceHeight / 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              categoryButton("News and Current Affairs", context, NewsHome()),
            ],
          ),
          SizedBox(
            height: deviceHeight / 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [categoryButton("Polls", context, PollHome())],
          )
        ],
      ),
    );
  }
}
