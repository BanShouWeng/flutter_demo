import 'package:flutter/material.dart';

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
  int _counter = 0;
  double _textSize = 12;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      _textSize++;
    });
  }

  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter--;
      _textSize--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
                  border: Border.all(width: 5, color: Colors.deepPurpleAccent)),
            ),
            new Text('I\'m a new one',
                style: TextStyle(
                    fontSize: 50, backgroundColor: Colors.deepPurpleAccent)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
