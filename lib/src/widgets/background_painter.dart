import 'package:flutter/material.dart';

class BackgroundPainter extends StatelessWidget {
  BackgroundPainter({this.pos, this.size});

  final Offset pos;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(),
      painter: _Painter(pos, size),
    );
  }
}

class _Painter extends CustomPainter {
  final Offset pos;
  final Size boxSize;
  _Painter(this.pos, this.boxSize);

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    var newRect = pos & boxSize;

    canvas.saveLayer(rect, Paint());
    canvas.drawColor(Colors.black12, BlendMode.dstATop);
    canvas.drawRect(newRect, Paint()..blendMode = BlendMode.clear);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
