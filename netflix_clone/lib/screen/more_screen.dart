import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('images/netflix_logo.png'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'INnoVatioN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 140,
            height: 5,
            color: Colors.red,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Linkify(
              onOpen: (link) async {
                print(link);
                if (await canLaunch(link.url)) {
                  await launch(link.url);
                }
              },
              text: 'https://github.com/INnoVatioN-97',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              linkStyle: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: FlatButton(
              onPressed: () {},
              child: Container(
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '프로필 수정하기',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
