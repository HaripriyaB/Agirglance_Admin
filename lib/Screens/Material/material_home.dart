import 'package:flutter/material.dart';

class MaterialHome extends StatelessWidget {
  Widget categoryButton(
      String category, BuildContext context, Widget newScreen) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.width * 0.2,
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
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        borderSide: BorderSide(color: Colors.blue, width: 10.0),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}