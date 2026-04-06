import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  Color bgColor = const Color.fromARGB(255, 239, 235, 235);
  double btnWidth = 52;
  double btnHeight = 50;
  bool _isAnimated = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        alignment: .center,
        duration: .new(milliseconds: 500),
        width: _isAnimated ? btnWidth : 56,
        height: _isAnimated ? btnWidth : 54,
        decoration: BoxDecoration(
          color: _isAnimated ? Colors.green : bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isAnimated = !_isAnimated;
            });
          },
          child: const Text("34", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
