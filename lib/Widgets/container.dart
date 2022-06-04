import 'package:flutter/material.dart';

class Cont extends StatefulWidget {
  final Widget child;
  final double height;
  final Color color;
  const Cont({Key? key, required this.child, required this.height, required this.color}) : super(key: key);

  @override
  _ContState createState() => _ContState();
}

class _ContState extends State<Cont> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
      child: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: widget.color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(1, 2),
            ),
          ],
        ),
        child: Container(
          height: widget.height,
          alignment: Alignment.centerLeft,
          child: widget.child,
        ),
      ),
    );
  }
}
