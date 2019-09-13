import 'package:flutter/material.dart';

class TooltipModel {
  TooltipModel({@required this.key, @required this.child});

  final GlobalKey key;
  final Widget child;
}
