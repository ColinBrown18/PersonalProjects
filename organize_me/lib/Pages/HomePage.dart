import 'dart:html';

import 'package:flutter/material.dart';
import 'package:organize_me/FirestoreService.dart';
import 'package:organize_me/Functionality/Event.dart';
import 'package:organize_me/Functionality/ViewEvent.dart';
import 'package:organize_me/Pages/SettingsPage.dart';
// import 'package:googleapis/calenar/v3.dart';
// import 'package:googleapis_auth/auth_io.dart';
import '../Layouts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:expandable/expandable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CustomizePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Calendar calendar;
  Reminders reminders;
  Bills bills;
  Error error;
  List<Widget> cardOrder = List<Widget>();

  void initState() {
    for (int i = 0; i < 3; i++) {
      if ("${pageList[i]}".toLowerCase() == "calendar") {
        cardOrder.add(Calendar());
      } else if ("${pageList[i]}".toLowerCase() == "reminder") {
        cardOrder.add(Reminders());
      } else if ("${pageList[i]}".toLowerCase() == "payments") {
        cardOrder.add(Bills());
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExpandableTheme(
          data: const ExpandableThemeData(
            iconColor: Colors.blue,
            useInkWell: true,
          ),
          child: ListView(
            children: <Widget>[cardOrder[0], cardOrder[1], cardOrder[2]],
          )),
    );
  }
}

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _calendarController;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _events = {};
    _selectedEvents = [];
  }

  Map<DateTime, List<dynamic>> _groupEvents(List<EventModel> events) {
    Map<DateTime, List<dynamic>> data = {};
    events.forEach((event) {
      DateTime date = DateTime(
          event.eventDate.year, event.eventDate.month, event.eventDate.day, 12);
      if (data[date] == null) data[date] = [];
      data[date].add(event);
    });
    return data;
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<EventModel>>(
          stream: eventDBS.streamList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<EventModel> allEvents = snapshot.data;
              if (allEvents.isNotEmpty) {
                _events = _groupEvents(allEvents);
              }
            }
            return Container(
              child: DesignCard(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
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
                    TableCalendar(
                      events: _events,
                      calendarStyle: CalendarStyle(
                        todayColor: Colors.blue[600],
                        selectedColor: Colors.blue[900],
                      ),
                      initialCalendarFormat: CalendarFormat.week,
                      onDaySelected: (date, events) {
                        _selectedEvents = events;
                      },
                      builders: CalendarBuilders(
                        selectedDayBuilder: (context, date, events) =>
                            Container(
                          margin: const EdgeInsets.all(4),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        todayDayBuilder: (context, date, events) => Container(
                          margin: const EdgeInsets.all(4),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      calendarController: _calendarController,
                    ),
                    ..._selectedEvents.map((event) => ListTile(
                          title: Text(event.title),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => EventDetailsPage(
                                          event: event,
                                        )));
                          },
                        )),
                  ],
                ),
              ),
            );
          }),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
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
