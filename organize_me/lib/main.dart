import 'package:flutter/material.dart';
// import 'package:googleapis/calenar/v3.dart';
// import 'package:googleapis_auth/auth_io.dart';
import 'Layouts.dart';

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

  PageOne one;
  PageTwo two;
  PageThree three;
  List<Widget> pages;
  Widget currentPage;

  String TitleText;

  void initState() {
    one = PageOne();
    two = PageTwo();
    three = PageThree();

    pages = [one, two, three];
    currentPage = one;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentIndex == 0) {
      TitleText = "Hello!";
    } else if (_currentIndex == 1) {
      TitleText = "Second Page";
    } else if (_currentIndex == 2) {
      TitleText = "Last Page";
    } else {
      TitleText = "CurrentPage index error";
    }

    return WillPopScope (
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
              icon: new Icon(Icons.android),
              title: Text('Welcome')
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.language),
              title: Text('Home')
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.settings),
              title: Text('Settings')
            )
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

// PAGE ONE
//==============================================================================
class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // THIS IS THE TOP WIDGET FOR THE CALENDAR
            DesignCard(
              child: Column(
                children: <Widget>[
                  Text(
                    "Calendar"
                  )
                ],
              ),
            ),
            DesignCard(
              child: Column(
                children: <Widget>[
                  Text(
                    "Reminders"
                  )
                ],
              ),
            )
        ],),
      ),
    );
  }
}

// PAGE TWO
//==============================================================================
class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DesignCard(
              child: Column(
                children: <Widget>[
                  Row(
                  children: <Widget>[
                    Text("Welcome To My App, this is page two.",
                    textAlign: TextAlign.center,)
                  ],
                ),
                ],
              ),
            )
        ],),
      ),
    );
  }
}

// PAGE THREE
//==============================================================================
class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DesignCard(
              child: Column(
                children: <Widget>[
                  Row(
                  children: <Widget>[
                    Text("Welcome To My App, this is page three.",
                    textAlign: TextAlign.center,)
                  ],
                ),
                ],
              ),
            )
        ],),
      ),
    );
  }
}