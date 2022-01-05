import 'package:flutter/material.dart';

class ProgressHUD extends StatelessWidget {
  Widget child;
  bool inAsyncCall;
  double opacity;
  Color color;
  Animation<Color>? valueColor;

  ProgressHUD({
    Key? key,
    required this.child,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    widgetList.add(child);

    if (inAsyncCall) {
      final modal = Stack(
        children: [
          Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          const Center(
            child: CircularProgressIndicator(),
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(children: widgetList);
  }
}
