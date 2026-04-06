import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// LESSON 2: AnimatedOpacity
/// ═══════════════════════════════════════════════════════════════════════════
///
/// AnimatedOpacity animates the transparency of a widget.
/// Opacity ranges from 0.0 (invisible) to 1.0 (fully visible)
///
/// VISUAL REPRESENTATION:
///
/// opacity: 1.0    opacity: 0.75   opacity: 0.5    opacity: 0.25   opacity: 0.0
/// ┌─────────┐     ┌─────────┐     ┌─────────┐     ┌─────────┐     ┌ ─ ─ ─ ─ ┐
/// │█████████│     │▓▓▓▓▓▓▓▓▓│     │░░░░░░░░░│     │·········│
/// │█████████│     │▓▓▓▓▓▓▓▓▓│     │░░░░░░░░░│     │·········│     │         │
/// │█████████│     │▓▓▓▓▓▓▓▓▓│     │░░░░░░░░░│     │·········│
/// └─────────┘     └─────────┘     └─────────┘     └─────────┘     └ ─ ─ ─ ─ ┘
///   Solid          75% visible    50% visible    25% visible      Invisible
///
/// USE CASES:
/// • Fade in/out content
/// • Loading states
/// • Smooth transitions
/// • Ghost effects
/// ═══════════════════════════════════════════════════════════════════════════

class AnimatedOpacityLesson extends StatefulWidget {
  const AnimatedOpacityLesson({super.key});

  @override
  State<AnimatedOpacityLesson> createState() => _AnimatedOpacityLessonState();
}

class _AnimatedOpacityLessonState extends State<AnimatedOpacityLesson> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedOpacity')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // The animated widget
            AnimatedOpacity(
              // Current opacity value
              opacity: _opacity,

              // Animation duration
              duration: const Duration(milliseconds: 500),

              // Animation curve
              curve: Curves.easeInOut,

              // The widget to animate
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text('👻', style: TextStyle(fontSize: 80)),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Opacity indicator
            Text(
              'Opacity: ${_opacity.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Slider to control opacity
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Slider(
                value: _opacity,
                min: 0.0,
                max: 1.0,
                divisions: 10,
                label: _opacity.toStringAsFixed(1),
                onChanged: (value) {
                  setState(() {
                    _opacity = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 20),

            // Quick buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _opacity = 0.0),
                  child: const Text('Hide'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => setState(() => _opacity = 0.5),
                  child: const Text('50%'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => setState(() => _opacity = 1.0),
                  child: const Text('Show'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
