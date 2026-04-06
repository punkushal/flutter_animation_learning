import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// EXERCISE 5.1: Create an Image Carousel
/// ═══════════════════════════════════════════════════════════════════════════
///
/// Create a carousel that slides images left/right based on navigation direction

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final List<Map<String, dynamic>> _items = [
    {'color': Colors.red, 'title': 'Slide 1', 'icon': Icons.looks_one},
    {'color': Colors.green, 'title': 'Slide 2', 'icon': Icons.looks_two},
    {'color': Colors.blue, 'title': 'Slide 3', 'icon': Icons.looks_3},
    {'color': Colors.orange, 'title': 'Slide 4', 'icon': Icons.looks_4},
  ];

  int _currentIndex = 0;
  bool _slideFromRight = true;

  void _goToNext() {
    setState(() {
      _slideFromRight = true;
      _currentIndex = (_currentIndex + 1) % _items.length;
    });
  }

  void _goToPrevious() {
    setState(() {
      _slideFromRight = false;
      _currentIndex = (_currentIndex - 1 + _items.length) % _items.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 5.1: Carousel')),
      body: Column(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) {
                // Direction-aware slide transition
                final slideOffset = _slideFromRight
                    ? const Offset(1, 0) // Slide from right
                    : const Offset(-1, 0); // Slide from left

                return SlideTransition(
                  position: Tween<Offset>(begin: slideOffset, end: Offset.zero)
                      .animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOut,
                        ),
                      ),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: Container(
                key: ValueKey<int>(_currentIndex),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: _items[_currentIndex]['color'] as Color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _items[_currentIndex]['icon'] as IconData,
                        size: 80,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _items[_currentIndex]['title'] as String,
                        style: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Navigation
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton.filled(
                  onPressed: _goToPrevious,
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 32,
                ),
                // Dots indicator
                Row(
                  children: List.generate(
                    _items.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: index == _currentIndex ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: index == _currentIndex
                            ? Theme.of(context).primaryColor
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                IconButton.filled(
                  onPressed: _goToNext,
                  icon: const Icon(Icons.arrow_forward),
                  iconSize: 32,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
