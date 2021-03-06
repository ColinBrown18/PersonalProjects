import 'package:flutter/material.dart';
import 'package:organize_me/Login/LoginPage.dart';
import 'Pages/HomePage.dart';
import 'Pages/CustomizePage.dart';
import 'Pages/SettingsPage.dart';

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
      home: LoginPage(),
    );
  }
}

/*
class StartUp extends StatefulWidget {
  @override
  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {
  @override
  void initState() {
    return Container(
      child: LoginPage(),
    );
  }
}
*/

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 0;

  HomePage home;
  CustomizePage customize;
  SettingsPage settings;
  List<Widget> pages = List<Widget>();
  Widget currentPage;

  String TitleText;

  void initState() {
    home = HomePage();
    customize = CustomizePage();
    settings = SettingsPage();

    pages = [home, customize, settings];
    currentPage = home;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedPage == 0) {
      TitleText = "Summary of Your Life";
    } else if (_selectedPage == 1) {
      TitleText = "Customize Your Life";
    } else if (_selectedPage == 2) {
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
        body: pages[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
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
      _selectedPage = index;
    });
  }
}
