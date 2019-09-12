import 'package:flutter/material.dart';

import 'FirstPage.dart';
import 'SecondPage.dart';

class MyHomeWidget extends StatefulWidget {
  MyHomeWidget({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  var title = ['first page','second page'];

  @override
  _MyHomeWidgetState createState() => _MyHomeWidgetState();
}

class _MyHomeWidgetState extends State<MyHomeWidget> {
  int _currentPageIndex = 0;
  var _pageController = new PageController(initialPage: 0);

  // bottomnaviagtionbar 和 pageview 的联动
  void onTap(int index) {
    // 过pageview的pagecontroller的animateToPage方法可以跳转
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _onPageChanged(int index) {
    setState(() {
      if (_currentPageIndex != index) {
        _currentPageIndex = index;
      }
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title[_currentPageIndex]),
      ),
      body: new PageView.builder(
          itemBuilder: (BuildContext context, int index) {
            return index == 0 ? FirstPage() : SecondPage();
          },
          onPageChanged: _onPageChanged,
          controller: _pageController),
      bottomNavigationBar: new BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: new Icon(Icons.category), title: new Text("首页")),
        BottomNavigationBarItem(
            icon: new Icon(Icons.message), title: new Text("我的")),
      ],
        currentIndex: _currentPageIndex,
        onTap: onTap,
      ),
    );
  }
}
