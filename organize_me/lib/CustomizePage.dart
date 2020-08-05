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
                      Text("Add Payment",
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.end),
                      IconButton(
                        icon: new Icon(Icons.add_box),
                        iconSize: 40,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Add Payment",
                          style: TextStyle(fontSize: 24),
                          textAlign: TextAlign.end),
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
