import 'package:flutter/material.dart';
// import 'package:googleapis/calenar/v3.dart';
// import 'package:googleapis_auth/auth_io.dart';
import 'Layouts.dart';
import 'main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomizePage extends StatefulWidget {
  @override
  _CustomizePageState createState() => _CustomizePageState();
}

// class ItemData {
//   ItemData(this.title, this.key);

//   final String title;

//   // Each item in reorderable list needs stable and unique key
//   final Key key;
// }

class _CustomizePageState extends State<CustomizePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Add",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
          Container(
            //fit: FlexFit.loose,
            child: DesignCard(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 75),
                        child: Text("Add Payment",
                            style: TextStyle(fontSize: 24),
                            textAlign: TextAlign.end),
                      ),
                      IconButton(
                        icon: new Icon(Icons.add_box),
                        iconSize: 40,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 75),
                        child: Text("Add Payment",
                            style: TextStyle(fontSize: 24),
                            textAlign: TextAlign.end),
                      ),
                      IconButton(
                        icon: new Icon(Icons.add_box),
                        iconSize: 40,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Card Order",
              textAlign: TextAlign.center,
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
}

class ReorderableList extends StatefulWidget {
  @override
  _ReorderableListState createState() => _ReorderableListState();
}

class _ReorderableListState extends State<ReorderableList> {
  List<String> alphabetList = ['Calendar', 'Reminder', 'Payments'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
          onReorder: _onReorder,

          //scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: List.generate(
            alphabetList.length,
            (index) {
              return ListViewCard(
                alphabetList,
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
        final String item = alphabetList.removeAt(oldIndex);
        alphabetList.insert(newIndex, item);
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
    return DesignCard(
      // margin: EdgeInsets.all(4),
      // color: Colors.white,
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () => Fluttertoast.showToast(
            msg: "Item ${widget.listItems[widget.index]} selected.",
            toastLength: Toast.LENGTH_SHORT),
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
                      'Title ${widget.listItems[widget.index]}',
                      style: TextStyle(fontSize: 28),
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
