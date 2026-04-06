import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// LESSON 6: AnimatedSwitcher
/// ═══════════════════════════════════════════════════════════════════════════
///
/// AnimatedSwitcher is more flexible than AnimatedCrossFade:
/// • Can switch between ANY number of widgets (not just two)
/// • Customizable transitions (fade, scale, rotation, slide, etc.)
/// • Requires unique keys to detect widget changes
///
/// KEY CONCEPT: Keys!
/// AnimatedSwitcher uses keys to detect when the child widget has changed.
/// If the key changes, it triggers the transition animation.
///
/// Common key patterns:
/// • ValueKey(someValue) - For primitive values
/// • UniqueKey() - For truly unique widgets
/// • ObjectKey(object) - For object references
/// ═══════════════════════════════════════════════════════════════════════════

class AnimatedSwitcherLesson extends StatefulWidget {
  const AnimatedSwitcherLesson({super.key});

  @override
  State<AnimatedSwitcherLesson> createState() => _AnimatedSwitcherLessonState();
}

class _AnimatedSwitcherLessonState extends State<AnimatedSwitcherLesson> {
  int _counter = 0;
  int _imageIndex = 0;

  final List<IconData> _icons = [
    Icons.home,
    Icons.star,
    Icons.favorite,
    Icons.settings,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedSwitcher')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ═══════════════════════════════════════════════════════════════
            // EXAMPLE 1: Counter with Fade
            // ═══════════════════════════════════════════════════════════════
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      'Default Fade Transition',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      // Key is crucial! Without it, AnimatedSwitcher won't know
                      // that the widget has changed
                      child: Text(
                        '$_counter',
                        key: ValueKey<int>(_counter),
                        style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => setState(() => _counter--),
                          child: const Icon(Icons.remove),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () => setState(() => _counter++),
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ═══════════════════════════════════════════════════════════════
            // EXAMPLE 2: Custom Scale Transition
            // ═══════════════════════════════════════════════════════════════
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      'Scale Transition',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      // Custom transition builder!
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child: Icon(
                        _icons[_imageIndex],
                        key: ValueKey<int>(_imageIndex),
                        size: 80,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _imageIndex = (_imageIndex + 1) % _icons.length;
                        });
                      },
                      child: const Text('Next Icon'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ═══════════════════════════════════════════════════════════════
            // EXAMPLE 3: Slide Transition
            // ═══════════════════════════════════════════════════════════════
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      'Slide Transition',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 60,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) {
                          // Slide from bottom to top
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 1),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                        child: Text(
                          '$_counter',
                          key: ValueKey<int>(_counter),
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    const Text('(Uses same counter as above)'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ═══════════════════════════════════════════════════════════════
            // EXAMPLE 4: Rotation Transition
            // ═══════════════════════════════════════════════════════════════
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      'Rotation + Scale Transition',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) {
                        // Combine multiple transitions!
                        return RotationTransition(
                          turns: animation,
                          child: ScaleTransition(
                            scale: animation,
                            child: child,
                          ),
                        );
                      },
                      child: Icon(
                        _icons[_imageIndex],
                        key: ValueKey<int>(_imageIndex),
                        size: 80,
                        color: Colors.orange,
                      ),
                    ),
                    const Text('(Uses same icon index as above)'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
