import 'package:flutter/material.dart';
// import 'package:googleapis/calenar/v3.dart';
// import 'package:googleapis_auth/auth_io.dart';
import 'Layouts.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class CustomizePage extends StatefulWidget {
  @override
  _CustomizePageState createState() => _CustomizePageState();
}

List<String> pageList = ['Calendar', 'Reminder', 'Payments'];

class _CustomizePageState extends State<CustomizePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            //fit: FlexFit.loose,
            child: DesignCard(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                        child: Text(
                          "Add",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Add Event",
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.end),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(42, 0, 0, 0),
                        child: IconButton(
                          icon: new Icon(Icons.add_box),
                          iconSize: 40,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Add Payment",
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.end),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: IconButton(
                          icon: new Icon(Icons.add_box),
                          iconSize: 40,
                          onPressed: () {
                            _EventDialog();
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
            child: Text(
              "Card Order",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          )),
          Flexible(fit: FlexFit.tight, child: ReorderableList())
        ],
      ),
    );
  }

  void _EventDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("New Event:"),
            content: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: "Title"),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      new FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Close"))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Basic date & time field (${format.pattern})"),
        DateTimeField(
          format: format,
          onShowPicker: (context, currentValue) async {
            final date = await showDatePicker(
                context: context,
                initialDate: currentValue ?? DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100));
            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              return DateTimeField.combine(date, time);
            } else {
              return currentValue;
            }
          },
        )
      ],
    );
  }
}

class ReorderableList extends StatefulWidget {
  @override
  _ReorderableListState createState() => _ReorderableListState();
}

class _ReorderableListState extends State<ReorderableList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
          onReorder: _onReorder,

          //scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: List.generate(
            pageList.length,
            (index) {
              return ListViewCard(
                pageList,
                index,
                Key('$index'),
              );
            },
          )),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(
      () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final String item = pageList.removeAt(oldIndex);
        pageList.insert(newIndex, item);
      },
    );
  }
}

// List View for Custom Tab
//==============================================================================
class ListViewCard extends StatefulWidget {
  final int index;
  final Key key;
  final List<String> listItems;

  ListViewCard(this.listItems, this.index, this.key);

  @override
  _ListViewCard createState() => _ListViewCard();
}

class _ListViewCard extends State<ListViewCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 1, 8, 1),
      child: MedDesignCard(
        // margin: EdgeInsets.all(4),
        // color: Colors.white,
        //splashColor: Colors.blue,
        //onTap: () => Fluttertoast.showToast(
        //msg: "Item ${widget.listItems[widget.index]} selected.",
        //toastLength: Toast.LENGTH_SHORT),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(
                Icons.reorder,
                color: Colors.grey,
                size: 32.0,
              ),
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${widget.listItems[widget.index]}',
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.left,
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
