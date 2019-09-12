import 'package:flutter/material.dart';

import 'CountPage.dart';

class JumpPage extends StatefulWidget {
  JumpPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  String title;

  @override
  JumpState createState() => JumpState();
}

class JumpState extends State<JumpPage> {
  Widget build(BuildContext context) {
    void _jump() {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => new CountPage(
                    title: 1,
                  )));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Stack(
            fit: StackFit.loose,
            alignment: const Alignment(0, 0),
            children: <Widget>[
              new Container(
                height: 200,
                decoration: new BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Colors.purple,
                      Colors.lightGreenAccent,
                      Colors.cyanAccent
                    ]),
                    border:
                        Border.all(width: 5, color: Colors.deepPurpleAccent)),
              ),
              new Text('I\'m a new one',
                  style: TextStyle(
                      fontSize: 50, backgroundColor: Colors.deepPurpleAccent)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _jump,
          tooltip: 'Increment',
        ));
  }
}
