# Flutter Slider Indicator

Tooltip function built in for flutter. Please press star in my repo if you like it. Thank you.

## Screenshots

![First tooltip](example/assets/screenshots/1.png?raw=true "First tooltip")
![Second tooltip](example/assets/screenshots/2.png?raw=true "Second tooltip")

## Usage

```dart
class Tips {
  static GlobalKey key1 = GlobalKey();
  static GlobalKey key2 = GlobalKey();

  static List<TooltipModel> tipsList = [
    TooltipModel(key: key1, child: Text("This my first tooltip")),
    TooltipModel(key: key2, child: Text("This my second tooltip"))
  ];
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            key: Tips.key1,
            color: Colors.red,
            padding: EdgeInsets.all(8.0),
            child: Text("Second Tooltip will highlight here"),
          ),
          Container(
            key: Tips.key2,
            color: Colors.red,
            padding: EdgeInsets.all(8.0),
            child: Text("Fist Tooltip will highlight here"),
          )
        ],
      ),
    );
  }
}
```

## Example

Please find example in here: [Example](example/lib/main.dart)

## Available parameter

| Parameter                            | Required | Default Value                              |
| ------------------------------------ | -------- | ------------------------------------------ |
| List<TooltipModel> listTipsModel     | true     |                                            |
| BuildContext context                 | true     |                                            |
| BoxDecoration tipsDecoration         | false    | Radius.circular(8), color: Colors.blueGrey |
| BoxDecoration tipsActionDecoration   | false    | Radius.circular(8), color: Colors.white    |
| EdgeInsetsGeometry tipsPadding       | false    | vertical: 8.0, horizontal: 16.0            |
| EdgeInsetsGeometry tipsActionPadding | false    | vertical: 8.0, horizontal: 16.0            |
| Color tipsActionTextColor            | false    | Colors.blueGrey                            |
| String tipsActionTextNext            | false    | Next                                       |
| String tipsActionTextDone            | false    | Done                                       |
