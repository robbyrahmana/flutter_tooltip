import 'package:example/tip_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tooltip/flutter_tooltip.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tooltip',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Tooltip'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    FlutterTooltip.showTips(Tips.tipsList, context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            key: Tips.key1,
            color: Colors.red,
            padding: EdgeInsets.all(8.0),
            child: Text("Fist"),
          ),
          Container(
            key: Tips.key2,
            color: Colors.red,
            padding: EdgeInsets.all(8.0),
            child: Text("Second"),
          )
        ],
      ),
    );
  }
}
