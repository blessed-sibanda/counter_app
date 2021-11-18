import 'package:flutter/material.dart';
import 'dart:math';

class FancyButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const FancyButton({Key? key, required this.onPressed, required this.child})
      : super(key: key);

  @override
  _FancyButtonState createState() => _FancyButtonState();
}

class _FancyButtonState extends State<FancyButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: _getColors()),
      onPressed: widget.onPressed,
      child: widget.child,
    );
  }

  Color _getColors() {
    return _buttonColors.putIfAbsent(this, () => colors[next(0, 5)]);
  }
}

Map<_FancyButtonState, Color> _buttonColors = {};
final _random = Random();

int next(int min, int max) => min + _random.nextInt(max - min);

List<Color> colors = [
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.purple,
  Colors.amber,
  Colors.lightBlue,
];
