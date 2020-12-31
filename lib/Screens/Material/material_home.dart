import 'package:agriglance_admin/Screens/Documents/documents_home.dart';
import 'package:agriglance_admin/Screens/Images/images_home.dart';
import 'package:agriglance_admin/Screens/News/news_home.dart';
import 'package:agriglance_admin/Screens/Polls/poll_home.dart';
import 'package:agriglance_admin/Screens/QuestionPaper/question_papers_home.dart';
import 'package:agriglance_admin/Screens/Quiz/quiz_home.dart';
import 'package:agriglance_admin/Screens/Study%20Materials/study_material_home.dart';
import 'package:agriglance_admin/Screens/Thesis/thesis_home.dart';
import 'package:agriglance_admin/Screens/Videos/videos_home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MaterialHome extends StatelessWidget {
  TextStyle style = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'Times',
  );

  Widget categoryButton(
      String category, BuildContext context, Widget newScreen) {
    return Container(
        width: 700.0,
        height: 100.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue[900],
                Colors.blue,
                Colors.red,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 25.0, // soften the shadow
                spreadRadius: 5.0, //extend the shadow
                offset: Offset(
                  15.0,
                  15.0,
                ),
              )
            ],
            border: Border.all(color: Colors.white)),
        child: MaterialButton(
          splashColor: Colors.grey,
          hoverColor: Colors.amber,

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
              case "Quiz":
                {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => newScreen));
                  break;
                }
              case "Images":
                {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => newScreen));
                  break;
                }
              case "Question Papers":
                {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => newScreen));
                  break;
                }
              case "Documents":
                {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => newScreen));
                  break;
                }
              case "Thesis":
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (category == "Study Materials")
                Icon(Icons.menu_book_outlined, color: Colors.amber[100])
              else if (category == "Videos")
                Icon(Icons.videocam, color: Colors.amber[100])
              else if (category == "News and Current Affairs")
                Icon(Icons.trending_up, color: Colors.amber[100])
              else if (category == "Polls")
                Icon(Icons.poll, color: Colors.amber[100])
              else if (category == "Quiz")
                Icon(Icons.lightbulb, color: Colors.amber[100])
              else if (category == "Question Papers")
                FaIcon(FontAwesomeIcons.question, color: Colors.amber[100])
              else if (category == "Documents")
                FaIcon(FontAwesomeIcons.solidFile, color: Colors.amber[100])
              else if (category == "Thesis")
                FaIcon(FontAwesomeIcons.solidNewspaper,
                    color: Colors.amber[100])
              else if (category == "Images")
                Icon(Icons.image, color: Colors.amber[100]),
              SizedBox(
                width: 20.0,
              ),
              Text(
                category,
                style: style,
              ),
              SizedBox(
                width: 20.0,
              ),
              Icon(Icons.arrow_forward, size: 20.0, color: Color(0xFF3EC3C1))
            ],
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue, width: 2.0),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 700.0,
            height: deviceHeight * 2.1,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 25.0, // soften the shadow
                    spreadRadius: 5.0, //extend the shadow
                    offset: Offset(
                      15.0,
                      15.0,
                    ),
                  )
                ],
                color: Colors.yellow[50],
                border: Border.all(color: Colors.white)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Study Materials",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Times',
                        fontSize: 25.0,
                        color: Colors.cyan[900],
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: deviceHeight / 50,
                ),
                categoryButton("Videos", context, VideosHome()),
                SizedBox(
                  height: deviceHeight / 50,
                ),
                categoryButton("Images", context, ImageHome()),
                SizedBox(
                  height: deviceHeight / 50,
                ),
                categoryButton(
                    "Question Papers", context, QuestionPapersHome()),
                SizedBox(
                  height: deviceHeight / 50,
                ),
                categoryButton("Documents", context, DocumentsHome()),
                SizedBox(
                  height: deviceHeight / 50,
                ),
                categoryButton("Thesis", context, ThesisHome()),
                SizedBox(
                  height: deviceHeight / 50,
                ),
                categoryButton(
                    "Study Materials", context, StudyMaterialsHome()),
                SizedBox(
                  height: deviceHeight / 50,
                ),
                categoryButton("News and Current Affairs", context, NewsHome()),
                SizedBox(
                  height: deviceHeight / 50,
                ),
                categoryButton("Polls", context, PollHome()),
                SizedBox(
                  height: deviceHeight / 50,
                ),
                categoryButton("Quiz", context, QuizHome()),
                SizedBox(
                  height: deviceHeight / 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
