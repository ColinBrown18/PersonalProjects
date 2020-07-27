import 'package:flutter/material.dart';
// import 'package:googleapis/calenar/v3.dart';
// import 'package:googleapis_auth/auth_io.dart';
import 'Layouts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:expandable/expandable.dart';
import 'HomePage.dart';
import 'CustomizePage.dart';
import 'SettingsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Organize Me'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  HomePage one;
  CustomizePage two;
  SettingsPage three;
  List<Widget> pages;
  Widget currentPage;

  String TitleText;

  void initState() {
    one = HomePage();
    two = CustomizePage();
    three = SettingsPage();

    pages = [one, two, three];
    currentPage = one;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentIndex == 0) {
      TitleText = "Summary";
    } else if (_currentIndex == 1) {
      TitleText = "Customize";
    } else if (_currentIndex == 2) {
      TitleText = "Settings";
    } else {
      TitleText = "CurrentPage index error";
    }

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(TitleText),
          //leading: new Container(),
        ),
        body: currentPage,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
              currentPage = pages[index];
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.calendar_today), title: Text('Home')),
            BottomNavigationBarItem(
                icon: new Icon(Icons.dashboard), title: Text('Customize')),
            BottomNavigationBarItem(
                icon: new Icon(Icons.settings), title: Text('Settings'))
          ],
        ),
      ),
      onWillPop: () async => false,
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
