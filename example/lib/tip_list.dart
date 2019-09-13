import 'package:flutter/material.dart';
import 'package:flutter_tooltip/flutter_tooltip.dart';

class Tips {
  static GlobalKey key1 = GlobalKey();
  static GlobalKey key2 = GlobalKey();

  static List<TooltipModel> tipsList = [
    TooltipModel(key: key1, child: Text("This my first tooltip")),
    TooltipModel(key: key2, child: Text("This my second tooltip"))
  ];
}
