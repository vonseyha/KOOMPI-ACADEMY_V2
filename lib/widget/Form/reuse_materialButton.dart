import 'package:flutter/material.dart';
class ReuseMeterialButton extends StatelessWidget {

  final double evaluation;
  final Color color;
  final Widget child;
  final double radius;

   ReuseMeterialButton({this.evaluation,this.color,this.child,this.radius});

  @override
  Widget build(BuildContext context) {
    return  Material(
        elevation: evaluation,
        borderRadius: BorderRadius.circular(radius),
        color: color,
        child: child,
    );
  }
}