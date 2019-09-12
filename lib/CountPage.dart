import 'package:flutter/material.dart';

class CountPage extends StatefulWidget {
  CountPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  int title;

  @override
  CountState createState() => CountState();
}

class CountState extends State<CountPage> {
  @override
  Widget build(BuildContext context) {
    _jump() {
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => new CountPage(
                    title: widget.title + 1,
                  )));
    }

    _jumpCloseSelf() {
      Navigator.pop(context);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title.toString()),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                widget.title.toString(),
                style: TextStyle(fontSize: 50),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: RaisedButton(
                        onPressed: _jumpCloseSelf,
                        child: Text('跳转并关闭当前页'),
                      ),
                      margin: const EdgeInsets.all(15),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      child: RaisedButton(
                        onPressed: _jump,
                        child: Text('跳转不关闭当前页'),
                      ),
                      margin: const EdgeInsets.all(15),
                    ),
                    flex: 1,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
