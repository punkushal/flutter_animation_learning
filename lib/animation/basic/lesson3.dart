import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// LESSON 3: AnimatedPadding & AnimatedAlign
/// ═══════════════════════════════════════════════════════════════════════════
///
/// These widgets animate position-related properties
///
/// AnimatedPadding: Animates the padding around a widget
/// AnimatedAlign: Animates the alignment of a widget within its parent
///
/// VISUAL: AnimatedPadding
///
/// padding: 0                      padding: 50
/// ┌────────────────────┐          ┌────────────────────┐
/// │┌──────────────────┐│          │                    │
/// ││     Content      ││    →     │  ┌────────────┐    │
/// │└──────────────────┘│          │  │  Content   │    │
/// └────────────────────┘          │  └────────────┘    │
///                                 │                    │
///                                 └────────────────────┘
///
/// VISUAL: AnimatedAlign
///
/// topLeft              center               bottomRight
/// ┌─────────────┐      ┌─────────────┐      ┌─────────────┐
/// │[■]          │      │             │      │             │
/// │             │  →   │     [■]     │  →   │             │
/// │             │      │             │      │          [■]│
/// └─────────────┘      └─────────────┘      └─────────────┘
/// ═══════════════════════════════════════════════════════════════════════════

class AnimatedPaddingAlignLesson extends StatefulWidget {
  const AnimatedPaddingAlignLesson({super.key});

  @override
  State<AnimatedPaddingAlignLesson> createState() =>
      _AnimatedPaddingAlignLessonState();
}

class _AnimatedPaddingAlignLessonState
    extends State<AnimatedPaddingAlignLesson> {
  double _padding = 0;
  Alignment _alignment = Alignment.topLeft;

  final List<Alignment> _alignments = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];

  int _currentAlignmentIndex = 0;

  void _togglePadding() {
    setState(() {
      _padding = _padding == 0 ? 50 : 0;
    });
  }

  void _nextAlignment() {
    setState(() {
      _currentAlignmentIndex =
          (_currentAlignmentIndex + 1) % _alignments.length;
      _alignment = _alignments[_currentAlignmentIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedPadding & AnimatedAlign')),
      body: Column(
        children: [
          // ═══════════════════════════════════════════════════════════════
          // ANIMATED PADDING DEMO
          // ═══════════════════════════════════════════════════════════════
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'AnimatedPadding',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: AnimatedPadding(
                      padding: EdgeInsets.all(_padding),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text(
                            'Padding Content',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: _togglePadding,
                      child: Text('Padding: $_padding'),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Divider(height: 2),

          // ═══════════════════════════════════════════════════════════════
          // ANIMATED ALIGN DEMO
          // ═══════════════════════════════════════════════════════════════
          Expanded(
            child: Container(
              color: Colors.grey[300],
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'AnimatedAlign',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: AnimatedAlign(
                      alignment: _alignment,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: _nextAlignment,
                      child: Text(
                        'Alignment: ${_alignment.toString().split('.').last}',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
