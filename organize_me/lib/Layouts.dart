import 'package:flutter/material.dart';

// DESIGN CARD
//==============================================================================
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
          //clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(10.0),
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(50.0),
            child: widget.child,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                color: widget.boxShadowColor ?? Colors.black38,
                offset: Offset(0.0, 2.0),
                blurRadius: 10.0
                ),
              ]
            )
          ),
        )
      ]
    );
  }
}

// SMALL DESIGN CARD
//==============================================================================
class SmallDesignCard extends StatefulWidget {
  final Widget child;
  final Color boxShadowColor;

  SmallDesignCard({@required this.child, this.boxShadowColor});
  @override
  _SmallDesignCardState createState() => new _SmallDesignCardState();
}

class _SmallDesignCardState extends State<SmallDesignCard> {
  @override
  Widget build(BuildContext context) {
    return Column (
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(5.0),
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: widget.child,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: widget.boxShadowColor ?? Colors.black38,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 10.0
                ),
              ]
            ),
          ),
        )
      ],
    );
  }
}

// SETTINGS CARD
//==============================================================================

class SettingsCard extends StatefulWidget {
  final Widget child;
  final Color boxShadowColor;

  SettingsCard({@required this.child, this.boxShadowColor});
  @override
  _SettingsCardState createState() => new _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
    );
  }
}