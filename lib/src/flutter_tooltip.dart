import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_slider_indicator/flutter_slider_indicator.dart';
import 'package:flutter_tooltip/src/models/tooltip_cons.dart' as tooltipsCons;
import 'package:flutter_tooltip/src/models/tooltip_indicator_model.dart';
import 'package:flutter_tooltip/src/models/tooltip_model.dart';
import 'package:flutter_tooltip/src/widgets/background_painter.dart';
import 'package:flutter_tooltip/src/widgets/tooltip_position_delete.dart';

class FlutterTooltip {
  static void showTips(List<TooltipModel> listTipsModel, BuildContext context,
      {BoxDecoration tipsDecoration = tooltipsCons.cDefaultTipsDecoration,
      BoxDecoration tipsActionDecoration =
          tooltipsCons.cDefaultTipsActionDecoration,
      EdgeInsetsGeometry tipsPadding = tooltipsCons.cDefaultTipsPadding,
      EdgeInsetsGeometry tipsActionPadding =
          tooltipsCons.cDefaultTipsActionPadding,
      Color tipsActionTextColor = tooltipsCons.cTipsActionTextColor,
      String tipsActionTextNext = tooltipsCons.cTipsActionTextNext,
      String tipsActionTextDone = tooltipsCons.cTipsActionTextDone,
      TooltipIndicatorModel tooltipIndicatorModel}) async {
    if (tooltipIndicatorModel == null) {
      tooltipIndicatorModel = TooltipIndicatorModel(
          indicator: Icon(Icons.check_circle_outline),
          activeIndicator: Icon(Icons.check_circle));
    }
    Timer(tooltipsCons.cTimerDurationOpenTips, () async {
      int listSize = listTipsModel.length;
      int loop = 1;
      for (TooltipModel tipsModel in listTipsModel) {
        await _showTipsBuilder(
            listSize,
            loop,
            tipsModel,
            context,
            listSize == loop,
            tipsDecoration,
            tipsActionDecoration,
            tipsActionTextColor,
            tipsActionTextNext,
            tipsActionTextDone,
            tipsPadding,
            tipsActionPadding,
            tooltipIndicatorModel);
        loop++;
      }
    });
  }

  static Future<bool> _showTipsBuilder(
      int length,
      int activeIndex,
      TooltipModel tipsModel,
      BuildContext context,
      bool isEnd,
      BoxDecoration tipsDecoration,
      BoxDecoration tipsActionDecoration,
      Color tipsActionTextColor,
      String tipsActionTextNext,
      String tipsActionTextDone,
      EdgeInsetsGeometry tipsPadding,
      EdgeInsetsGeometry tipsActionPadding,
      TooltipIndicatorModel tooltipIndicatorModel) async {
    final RenderBox box = tipsModel.key.currentContext.findRenderObject();
    final Offset center = box.localToGlobal(box.size.center(Offset.zero));
    final Offset pos = box.localToGlobal(Offset(0.0, -26));
    return showGeneralDialog<bool>(
      context: context,
      barrierDismissible: false,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return Stack(
              children: <Widget>[
                BackgroundPainter(pos: pos, size: box.size),
                CustomSingleChildLayout(
                  delegate: TipsPositionDelegate(target: center),
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                        decoration: tipsDecoration,
                        padding: tipsPadding,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            SliderIndicator(
                              length: length,
                              activeIndex: activeIndex - 1,
                              indicator: tooltipIndicatorModel.indicator,
                              activeIndicator:
                                  tooltipIndicatorModel.activeIndicator,
                            ),
                            tipsModel.child,
                            SizedBox(height: 16),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                GestureDetector(
                                  child: Container(
                                    decoration: tipsActionDecoration,
                                    padding: tipsActionPadding,
                                    child: Text(
                                        isEnd
                                            ? tipsActionTextDone
                                            : tipsActionTextNext,
                                        style: TextStyle(
                                            color: tipsActionTextColor)),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context, true);
                                  },
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                )
              ],
            );
          }),
        );
      },
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: tooltipsCons.cTimerDurationOpenDialog,
      transitionBuilder: tooltipsCons.cDialogTransition,
    );
  }
}
