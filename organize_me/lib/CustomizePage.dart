import 'package:flutter/material.dart';
// import 'package:googleapis/calenar/v3.dart';
// import 'package:googleapis_auth/auth_io.dart';
import 'Layouts.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'main.dart';

class CustomizePage extends StatefulWidget {
  @override
  _CustomizePageState createState() => _CustomizePageState();
}

class _CustomizePageState extends State<CustomizePage> {
  List<ItemData> _items;
  _CustomizePageState() {
    _items = List();
    for (int i = 0; i < 3; i++) {
      String label = "List item $i";
      if (i == 5) {
        label += ". This item has a long label and will be wrapped.";
      }
      _items.add(ItemData(label, ValueKey(i)));
    }
  }

  // Returns index of item with given key
  int _indexOfKey(Key key) {
    return _items.indexWhere((ItemData d) => d.key == key);
  }

  bool _reorderCallback(Key item, Key newPosition) {
    int draggingIndex = _indexOfKey(item);
    int newPositionIndex = _indexOfKey(newPosition);

    // Uncomment to allow only even target reorder position
    // if (newPostitionIndex % 2 == 1)
    //   return false;

    final draggedItem = _items[draggingIndex];
    setState(() {
      debugPrint("Reordering $item -> $newPosition");
      _items.removeAt(draggingIndex);
      _items.insert(newPositionIndex, draggedItem);
    });
    return true;
  }

  void _reorderDone(Key item) {
    final draggedItem = _items[_indexOfKey(item)];
    debugPrint("Reordering finished for ${draggedItem.title}}");
  }

  // Reordering works by having ReorderableList widget in hierarchy
  // containing ReorderableItems widgets

  DraggingMode _draggingMode = DraggingMode.iOS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableList(
        onReorder: this._reorderCallback,
        onReorderDone: this._reorderDone,
        // decoratePlaceholder: (Widget item, double opacity) {
        // return DecoratedPlaceholder(widget: item, offset: 0);
        // },
        child: CustomScrollView(
          // cacheExtent: 3000,
          slivers: <Widget>[
            SliverAppBar(
              actions: <Widget>[
                PopupMenuButton<DraggingMode>(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text("Options"),
                  ),
                  initialValue: _draggingMode,
                  onSelected: (DraggingMode mode) {
                    setState(() {
                      _draggingMode = mode;
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuItem<DraggingMode>>[
                    const PopupMenuItem<DraggingMode>(
                        value: DraggingMode.iOS,
                        child: Text('iOS-like dragging')),
                    const PopupMenuItem<DraggingMode>(
                        value: DraggingMode.Android,
                        child: Text('Android-like dragging'))
                  ],
                )
              ],
              pinned: true,
              expandedHeight: 150.0,
              flexibleSpace: const FlexibleSpaceBar(
                title: const Text('Demo'),
              ),
            ),
            SliverPadding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Item(
                      data: _items[index],
                      // first and last attributes affect border drawn during dragging
                      isFirst: index == 0,
                      isLast: index == _items.length - 1,
                      draggingMode: _draggingMode,
                    );
                  }),
                )),
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  Item({
    this.data,
    this.isFirst,
    this.isLast,
    this.draggingMode,
  });

  final ItemData data;
  final bool isFirst;
  final bool isLast;
  final DraggingMode draggingMode;

  Widget _buildChild(BuildContext context, ReorderableItemState state) {
    BoxDecoration decoration;

    if (state == ReorderableItemState.dragProxy ||
        state == ReorderableItemState.dragProxyFinished) {
      // slightly transparent background white dragging (just like iOS)
      decoration = BoxDecoration(color: Color(0xD0FFFFFF));
    } else {
      bool placeholder = state == ReorderableItemState.placeholder;
      decoration = BoxDecoration(
          border: Border(
              top: isFirst && !placeholder
                  ? Divider.createBorderSide(context)
                  : BorderSide.none,
              bottom: isLast && placeholder
                  ? BorderSide.none
                  : Divider.createBorderSide(context)),
          color: placeholder ? null : Colors.white);
    }

    // For iOS dragging mode, there will be drag handle on the rigth that triggers
    // reordering; For android mode it will be just an empty container
    Widget dragHandle = draggingMode == draggingMode.iOS
        ? ReorderableListener(
            child: Container(
              padding: EdgeInsets.only(right: 18.0, left: 18.0),
              color: Color(0x08000000),
              child: Center(
                child: Icon(Icons.reorder, color: Color(0xFF888888)),
              ),
            ),
          )
        : Container();
  }
}

/*  OLD LAYOUT CODE THAT WAS STATIC
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Flexible(
                          child: Text("Add Event",
                              style: TextStyle(fontSize: 38),
                              textAlign: TextAlign.center)),
                      Flexible(
                        child: IconButton(
                          icon: new Icon(Icons.add_box),
                          iconSize: 50,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Flexible(
                          child: Text("Add Bill",
                              style: TextStyle(fontSize: 38),
                              textAlign: TextAlign.center)),
                      Flexible(
                        child: IconButton(
                          icon: new Icon(Icons.add_box),
                          iconSize: 50,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            DesignCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          "Edit Home Page",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              fontSize: 32),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[Text("")], // For Spacing Purposes
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Icon(Icons.dehaze),
                      ),
                      Flexible(
                        child: Text(
                          "   Calendar",
                          style: TextStyle(fontSize: 32),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Icon(Icons.dehaze),
                      ),
                      Flexible(
                        child: Text(
                          "   Reminder",
                          style: TextStyle(fontSize: 32),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Icon(Icons.dehaze),
                      ),
                      Flexible(
                        child: Text(
                          "   Payments",
                          style: TextStyle(fontSize: 32),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  */
