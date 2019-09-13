import 'package:flutter/material.dart';

class TipsPositionDelegate extends SingleChildLayoutDelegate {
  TipsPositionDelegate({@required this.target, this.preferBelow = false})
      : assert(target != null);

  final Offset target;
  final bool preferBelow;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) =>
      constraints.loosen();

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return positionDependentBox(
        size: size,
        childSize: childSize,
        target: target,
        preferBelow: preferBelow);
  }

  @override
  bool shouldRelayout(TipsPositionDelegate oldDelegate) {
    return target != oldDelegate.target;
  }
}
