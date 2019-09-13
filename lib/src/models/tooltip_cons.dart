import 'package:flutter/material.dart';

const cTimerDurationOpenTips = Duration(milliseconds: 500);
const cTimerDurationOpenDialog = Duration(milliseconds: 150);
const cDefaultTipsPadding =
    EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0);
const cDefaultTipsActionPadding =
    EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0);
const cDefaultTipsDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(8)), color: Colors.blueGrey);
const cDefaultTipsActionDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(8)), color: Colors.white);
const cTipsActionTextColor = Colors.blueGrey;
const cTipsActionTextNext = "Next";
const cTipsActionTextDone = "Done";

Widget cDialogTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}
