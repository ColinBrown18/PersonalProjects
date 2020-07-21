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
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
    );
  }
}

class ChangeHome extends StatefulWidget {
  @override
  _ChangeHomeState createState() => _ChangeHomeState();
}

class _ChangeHomeState extends State<ChangeHome> {
  // Reorderable List Code
  List<ItemData> _items;
  _CustomizePageState() {
    _items = List();
    for (int i = 0; i < 10; i++) {
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
          child: Column(
            children: <Widget>[
              CustomScrollView(
                // cacheExtent: 3000,
                slivers: <Widget>[
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
                    ),
                  )
                ],
              )
            ],
          ),
        ),
    );
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
    Widget dragHandle = draggingMode == DraggingMode.iOS
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

    Widget content = Container(
      decoration: decoration,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Opacity(
          // hide content for placeholder
          opacity: state == ReorderableItemState.placeholder ? 0.0 : 1.0,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
                  child: Text(data.title,
                      style: Theme.of(context).textTheme.subtitle1),
                )),
                // Triggers the reordering
                dragHandle,
              ],
            ),
          ),
        ),
      ),
    );

    if (draggingMode == DraggingMode.Android) {
      content = DelayedReorderableListener(
        child: content,
      );
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableItem(key: data.key, childBuilder: _buildChild);
  }
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
          ],
        ),
      ),
    );
  }
  */
