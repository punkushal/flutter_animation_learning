import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// EXERCISE 3.1: Create a Bouncing Ball using AnimatedAlign
/// ═══════════════════════════════════════════════════════════════════════════
///
/// Create a ball that bounces between corners automatically
/// Sequence: topLeft → topRight → bottomRight → bottomLeft → repeat

class Exercise3_1 extends StatefulWidget {
  const Exercise3_1({super.key});

  @override
  State<Exercise3_1> createState() => _Exercise3_1State();
}

class _Exercise3_1State extends State<Exercise3_1> {
  final List<Alignment> _corners = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.bottomLeft,
  ];

  int _currentCorner = 0;
  bool _isAnimating = false;

  void _startAnimation() async {
    if (_isAnimating) return;
    _isAnimating = true;

    while (_isAnimating) {
      await Future.delayed(const Duration(milliseconds: 600));
      if (!mounted || !_isAnimating) break;
      setState(() {
        _currentCorner = (_currentCorner + 1) % _corners.length;
      });
    }
  }

  void _stopAnimation() {
    setState(() {
      _isAnimating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 3.1: Bouncing Ball')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: AnimatedAlign(
                alignment: _corners[_currentCorner],
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutQuad,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withValues(alpha: 0.5),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text('🏀', style: TextStyle(fontSize: 30)),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _isAnimating ? null : _startAnimation,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Start'),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: _isAnimating ? _stopAnimation : null,
                  icon: const Icon(Icons.stop),
                  label: const Text('Stop'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
