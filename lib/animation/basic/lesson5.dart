import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// LESSON 5: AnimatedCrossFade
/// ═══════════════════════════════════════════════════════════════════════════
///
/// Cross-fade smoothly transitions between two widgets
///
/// VISUAL:
///
/// State A:                Cross-fading:              State B:
/// ┌─────────────┐         ┌─────────────┐           ┌─────────────┐
/// │             │         │   ░░░░░░░   │           │             │
/// │   Widget    │    →    │   ▓▓▓▓▓▓▓   │    →      │   Widget    │
/// │      A      │         │   ░░░░░░░   │           │      B      │
/// │             │         │             │           │             │
/// └─────────────┘         └─────────────┘           └─────────────┘
/// opacity: 1.0            A: 0.5, B: 0.5            opacity: 1.0
///
/// USE CASES:
/// • Toggle between two states (like/unlike, follow/unfollow)
/// • Loading → Content transition
/// • Error state switching
/// • Form field states
/// ═══════════════════════════════════════════════════════════════════════════

class AnimatedCrossFadeLesson extends StatefulWidget {
  const AnimatedCrossFadeLesson({super.key});

  @override
  State<AnimatedCrossFadeLesson> createState() =>
      _AnimatedCrossFadeLessonState();
}

class _AnimatedCrossFadeLessonState extends State<AnimatedCrossFadeLesson> {
  bool _showFirst = true;
  bool _isLiked = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedCrossFade')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ═══════════════════════════════════════════════════════════════
            // EXAMPLE 1: Basic Cross Fade
            // ═══════════════════════════════════════════════════════════════
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Basic Cross Fade',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 500),
                      crossFadeState: _showFirst
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: Container(
                        width: 200,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text(
                            'Widget A',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                      secondChild: Container(
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text(
                            'Widget B',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => setState(() => _showFirst = !_showFirst),
                      child: const Text('Toggle'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ═══════════════════════════════════════════════════════════════
            // EXAMPLE 2: Like Button
            // ═══════════════════════════════════════════════════════════════
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Like Button',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => setState(() => _isLiked = !_isLiked),
                      child: AnimatedCrossFade(
                        duration: const Duration(milliseconds: 300),
                        crossFadeState: _isLiked
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        firstChild: const Icon(
                          Icons.favorite_border,
                          size: 50,
                          color: Colors.grey,
                        ),
                        secondChild: const Icon(
                          Icons.favorite,
                          size: 50,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(_isLiked ? 'Liked!' : 'Tap to like'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ═══════════════════════════════════════════════════════════════
            // EXAMPLE 3: Loading State
            // ═══════════════════════════════════════════════════════════════
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Loading State',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 800),
                      crossFadeState: _isLoading
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: Column(
                        spacing: 10,
                        children: const [
                          CircularProgressIndicator(),
                          Text('Loading...'),
                        ],
                      ),
                      secondChild: Column(
                        children: const [
                          Icon(
                            Icons.check_circle,
                            size: 50,
                            color: Colors.green,
                          ),
                          SizedBox(height: 10),
                          Text('Content Loaded!'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() => _isLoading = true);
                        Future.delayed(const Duration(seconds: 2), () {
                          if (mounted) setState(() => _isLoading = false);
                        });
                      },
                      child: const Text('Reload'),
                    ),
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
