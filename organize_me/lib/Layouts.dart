import 'package:flutter/material.dart';

// DESIGN CARD
class DesignCard extends StatefulWidget {
  final Widget child;
  final Color boxShadowColor;

  DesignCard({@required this.child, this.boxShadowColor});
  @override
  _DesignCardState createState() => new _DesignCardState();
}

class _DesignCardState extends State<DesignCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(20.0),
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: widget.child,
            decoration: BoxDecoration(color: Colors.orange,
            boxShadow: [
              BoxShadow(
                color: widget.boxShadowColor ?? Colors.black38,
                offset: Offset(10.0, 15.0),
                blurRadius: 15.0
              )
            ])
          ),
        )
      ]
    );
  }
}

// OTHER DESIGNS