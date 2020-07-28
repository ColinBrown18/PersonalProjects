import 'package:flutter/material.dart';
// import 'package:googleapis/calenar/v3.dart';
// import 'package:googleapis_auth/auth_io.dart';
import 'Layouts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:expandable/expandable.dart';
import 'main.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<String> ProfileInfo = [
    'Colin Brown',
    'March 18, 1998',
    'colinrb121@gmail.com'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            DesignCard(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Name:  ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Text(
                          ProfileInfo[0],
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "DoB:  ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Text(
                          ProfileInfo[1],
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Email:  ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Text(
                          ProfileInfo[2],
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Notifications?  ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Checkbox(
                          value: true,
                          //checkColor: Colors.red,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 320.0),
                    child: OutlineButton(
                      child: Text(
                        "Log Out",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
