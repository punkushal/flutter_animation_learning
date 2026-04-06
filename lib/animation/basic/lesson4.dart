import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// LESSON 4: AnimatedDefaultTextStyle
/// ═══════════════════════════════════════════════════════════════════════════
///
/// Animates changes in text style properties:
/// • Font size
/// • Font weight
/// • Color
/// • Letter spacing
/// • Word spacing
/// • Height
///
/// NOTE: The actual text content doesn't animate, only the style!
/// ═══════════════════════════════════════════════════════════════════════════

class AnimatedTextStyleLesson extends StatefulWidget {
  const AnimatedTextStyleLesson({super.key});

  @override
  State<AnimatedTextStyleLesson> createState() =>
      _AnimatedTextStyleLessonState();
}

class _AnimatedTextStyleLessonState extends State<AnimatedTextStyleLesson> {
  bool _isLarge = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedDefaultTextStyle')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              style: TextStyle(
                fontSize: _isLarge ? 48 : 24,
                fontWeight: _isLarge ? FontWeight.bold : FontWeight.normal,
                color: _isLarge ? Colors.blue : Colors.black,
                letterSpacing: _isLarge ? 4 : 0,
              ),
              child: const Text('Hello, Flutter!'),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () => setState(() => _isLarge = !_isLarge),
              child: Text(_isLarge ? 'Make Small' : 'Make Large'),
            ),

            const SizedBox(height: 40),

            // Multiple text style examples
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    'Different Style Animations:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _AnimatedTextDemo(
                    isActive: _isLarge,
                    activeStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontStyle: FontStyle.italic,
                    ),
                    inactiveStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    text: 'Color & Style Change',
                  ),
                  const SizedBox(height: 10),
                  _AnimatedTextDemo(
                    isActive: _isLarge,
                    activeStyle: const TextStyle(
                      fontSize: 24,
                      letterSpacing: 8,
                      color: Colors.green,
                    ),
                    inactiveStyle: const TextStyle(
                      fontSize: 14,
                      letterSpacing: 0,
                      color: Colors.grey,
                    ),
                    text: 'SPACING',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedTextDemo extends StatelessWidget {
  final bool isActive;
  final TextStyle activeStyle;
  final TextStyle inactiveStyle;
  final String text;

  const _AnimatedTextDemo({
    required this.isActive,
    required this.activeStyle,
    required this.inactiveStyle,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 500),
      style: isActive ? activeStyle : inactiveStyle,
      child: Text(text),
    );
  }
}
