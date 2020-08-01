import 'package:flutter/material.dart';
// import 'package:googleapis/calenar/v3.dart';
// import 'package:googleapis_auth/auth_io.dart';
import 'Layouts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:expandable/expandable.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  Widget build(BuildContext context) {
    return WillPopScope(
      child: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 5),
              child: Row(
                children: <Widget>[
                  Text(
                    "Calendar",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Ariel",
                        decoration: TextDecoration.underline),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
            // CALENDAR CODE GOES HERE
            DesignCard(
              child: Column(
                children: <Widget>[
                  TableCalendar(
                    calendarStyle: CalendarStyle(
                      todayColor: Colors.blue[600],
                      selectedColor: Colors.blue[900],
                    ),
                    initialCalendarFormat: CalendarFormat.week,
                    calendarController: _calendarController,
                  )
                ],
              ),
            ),
            // END OF CALENDAR CODE
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
              child: Row(
                children: <Widget>[
                  Text(
                    "Reminders",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Ariel",
                        decoration: TextDecoration.underline),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Reminders(),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
              child: Row(
                children: <Widget>[
                  Text(
                    "Payments",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Ariel",
                        decoration: TextDecoration.underline),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Bills(),
          ],
        ),
      ),
    );
  }
}

class Reminders extends StatefulWidget {
  @override
  _RemindersState createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  @override
  Widget build(BuildContext context) {
    // Reminders Collapsed State
    buildCollapsed() {
      return Container(
        child: Padding(
          padding: EdgeInsets.all(1),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    child: Container(
                      width: 1000,
                      child: SmallDesignCard(
                        child: Column(
                          children: <Widget>[Text("Reminder 1")],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 1000,
                      child: SmallDesignCard(
                        child: Column(
                          children: <Widget>[Text("Reminder 2")],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 1000,
                      child: SmallDesignCard(
                        child: Column(
                          children: <Widget>[Text("Reminder 3")],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 1000,
                      child: SmallDesignCard(
                        child: Column(
                          children: <Widget>[Text("Reminder 4")],
                        ),
                      ),
                    ),
                  ),
                ],
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
                      child: Text("Date"),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("Done?"),
                    ),
                    Flexible(
                      child: Checkbox(
                        value: true,
                      ),
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
                      child: Text("Date"),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("Done?"),
                    ),
                    Flexible(
                      child: Checkbox(
                        value: false,
                      ),
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
                      child: Text("Date"),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("Done?"),
                    ),
                    Flexible(
                      child: Checkbox(
                        value: false,
                      ),
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
                      child: Text("Date"),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("Done?"),
                    ),
                    Flexible(
                      child: Checkbox(
                        value: true,
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

class Bills extends StatefulWidget {
  @override
  _BillsState createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  @override
  Widget build(BuildContext context) {
    // Bills Collapsed State
    buildCollapsed() {
      return Container(
        child: Padding(
          padding: EdgeInsets.all(1),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    child: Container(
                      width: 1000,
                      child: SmallDesignCard(
                        child: Column(
                          children: <Widget>[Text("Payment 1")],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 1000,
                      child: SmallDesignCard(
                        child: Column(
                          children: <Widget>[Text("Payment 2")],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 1000,
                      child: SmallDesignCard(
                        child: Column(
                          children: <Widget>[Text("Payment 3")],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 1000,
                      child: SmallDesignCard(
                        child: Column(
                          children: <Widget>[Text("Payment 4")],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    // Bills Expanded State
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
                      child: Text("Date"),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("\$5.00"),
                    ),
                    Flexible(
                      child: Checkbox(
                        value: false,
                      ),
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
                      child: Text("Date"),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("\$5.00"),
                    ),
                    Flexible(
                      child: Checkbox(
                        value: true,
                      ),
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
                      child: Text("Date"),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("\$5.00"),
                    ),
                    Flexible(
                      child: Checkbox(
                        value: true,
                      ),
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
                      child: Text("Date"),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text("\$5.00"),
                    ),
                    Flexible(
                      child: Checkbox(
                        value: false,
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
                                .copyWith(color: Colors.blue),
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