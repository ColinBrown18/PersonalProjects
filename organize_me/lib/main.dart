import 'package:flutter/material.dart';
// import 'package:googleapis/calenar/v3.dart';
// import 'package:googleapis_auth/auth_io.dart';
import 'Layouts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:expandable/expandable.dart';

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
      TitleText = "Summary";
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
              icon: new Icon(Icons.calendar_today),
              title: Text('Home')
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.dashboard),
              title: Text('Customize')
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

CalendarController _calendarController;
  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }
  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build (BuildContext context) {
    return WillPopScope(
      child: ExpandableTheme(
        data:
          const ExpandableThemeData(
            iconColor: Colors.blue,
            useInkWell: true,
          ),
        child: ListView(
          children: <Widget>[
            // CALENDAR CODE GOES HERE
            
            DesignCard(
              child: Column(
                children: <Widget>[
                  TableCalendar(
                    calendarStyle: CalendarStyle(
                      todayColor: Colors.blue[600],
                      selectedColor: Colors.blue[900],
                    ),
                    calendarController: _calendarController,
                  )
                ],
              ),   
            ),
            // END OF CALENDAR CODE
            Reminders(),
            Bills(),
          ],
        ),
      ),
    );
  }
}


class Reminders extends StatelessWidget {
  @override
  Widget build (BuildContext context) {

    // Reminders Collapsed State
    buildCollapsed() {
      return Container (
        child: Padding(
          padding: EdgeInsets.all(1),
          child: Row(
            children: <Widget>[
              Flexible(
                child: Container(
                  width: 1000,
                  child: SmallDesignCard(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Reminder 1"
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  width: 1000,
                  child: SmallDesignCard(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Reminder 2"
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  width: 1000,
                  child: SmallDesignCard(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Reminder 3"
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  width: 1000,
                  child: SmallDesignCard(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Reminder 4"
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    
    // Reminder Expanded State
    buildExpanded() {
      return Container(
        child: Padding(
          padding: EdgeInsets.all(1),
          child: Column(
            children: <Widget>[
              MedDesignCard(
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("Title"),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("Summary"),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("Date"),
                    )
                  ],
                ),
              ),
              MedDesignCard(
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("Title"),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("Summary"),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("Date"),
                    )
                  ],
                ),
              ),
              MedDesignCard(
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("Title"),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("Summary"),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("Date"),
                    )
                  ],
                ),
              ),
              MedDesignCard(
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("Title"),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("Summary"),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("Date"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Button to Toggle Collapsed/Expanded
    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: ScrollOnExpand(
          child: DesignCard(
            child: Column(
              children: <Widget>[
                Expandable(
                  collapsed: buildCollapsed(),
                  expanded: buildExpanded(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Builder(
                      builder: (context) {
                        var controller = ExpandableController.of(context);
                        return FlatButton(
                          child: Text(
                            controller.expanded ? "Collapse" : "Expand",
                            style: Theme.of(context)
                                    .textTheme
                                    .button
                                    .copyWith(color: Colors.deepOrange),
                          ),
                          onPressed: () {
                            controller.toggle();
                          },
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Bills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    // Bills Collapsed State
    buildCollapsed() {
      return Container (
        child: Padding(
          padding: EdgeInsets.all(1),
          child: Row(
            children: <Widget>[
              Flexible(
                child: Container(
                  width: 1000,
                  child: SmallDesignCard(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Payment 1"
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  width: 1000,
                  child: SmallDesignCard(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Payment 2"
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  width: 1000,
                  child: SmallDesignCard(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Payment 3"
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  width: 1000,
                  child: SmallDesignCard(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Payment 4"
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Bills Expanded State
    buildExpanded() {
      
    }

    // Button to Toggle Collapsed/Expanded
    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: ScrollOnExpand(
          child: DesignCard(
            child: Column(
              children: <Widget>[
                Expandable(
                  collapsed: buildCollapsed(),
                  expanded: buildExpanded(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Builder(
                      builder: (context) {
                        var controller = ExpandableController.of(context);
                        return FlatButton(
                          child: Text(
                            controller.expanded ? "Collapse" : "Expand",
                            style: Theme.of(context)
                                    .textTheme
                                    .button
                                    .copyWith(color: Colors.deepOrange),
                          ),
                          onPressed: () {
                            controller.toggle();
                          },
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
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
                    textAlign: TextAlign.center
                    )
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
            
        ],),
      ),
    );
  }
}
