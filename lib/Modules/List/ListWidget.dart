import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
   ListWidget({Key key, this.title}) : super(key: key);

   final String title;

   @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ListWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
