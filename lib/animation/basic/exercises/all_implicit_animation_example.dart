import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// LESSON 7: Complete List of Implicit Animation Widgets
/// ═══════════════════════════════════════════════════════════════════════════
///
/// Flutter provides many built-in implicit animation widgets:
///
/// ┌─────────────────────────┬──────────────────────────────────────────────┐
/// │ Widget                  │ What it animates                             │
/// ├─────────────────────────┼──────────────────────────────────────────────┤
/// │ AnimatedContainer       │ Multiple properties (size, color, etc.)      │
/// │ AnimatedOpacity         │ Opacity/transparency                         │
/// │ AnimatedPadding         │ Padding around child                         │
/// │ AnimatedAlign           │ Alignment within parent                      │
/// │ AnimatedPositioned      │ Position within Stack                        │
/// │ AnimatedDefaultTextStyle│ Text styling                                 │
/// │ AnimatedCrossFade       │ Cross-fade between two widgets               │
/// │ AnimatedSwitcher        │ Transition between different widgets         │
/// │ AnimatedSize            │ Size changes of child                        │
/// │ AnimatedPhysicalModel   │ Physical model properties                    │
/// │ AnimatedRotation        │ Rotation angle                               │
/// │ AnimatedScale           │ Scale transformation                         │
/// │ AnimatedSlide           │ Position offset                              │
/// │ AnimatedFractionallySizedBox │ Fractional size                         │
/// │ AnimatedModalBarrier    │ Modal barrier color                          │
/// │ AnimatedTheme           │ Theme data                                   │
/// └─────────────────────────┴──────────────────────────────────────────────┘
/// ═══════════════════════════════════════════════════════════════════════════

class AllImplicitAnimationsShowcase extends StatefulWidget {
  const AllImplicitAnimationsShowcase({super.key});

  @override
  State<AllImplicitAnimationsShowcase> createState() =>
      _AllImplicitAnimationsShowcaseState();
}

class _AllImplicitAnimationsShowcaseState
    extends State<AllImplicitAnimationsShowcase> {
  bool _toggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Implicit Animations'),
        actions: [
          Switch(
            value: _toggle,
            onChanged: (value) => setState(() => _toggle = value),
            activeThumbColor: Colors.white,
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.85,
        children: [
          // AnimatedRotation
          _buildShowcaseCard(
            'AnimatedRotation',
            AnimatedRotation(
              turns: _toggle ? 0.5 : 0,
              duration: const Duration(milliseconds: 500),
              child: const Icon(Icons.sync, size: 50, color: Colors.blue),
            ),
          ),

          // AnimatedScale
          _buildShowcaseCard(
            'AnimatedScale',
            AnimatedScale(
              scale: _toggle ? 1.5 : 1.0,
              duration: const Duration(milliseconds: 500),
              child: const Icon(Icons.star, size: 50, color: Colors.amber),
            ),
          ),

          // AnimatedSlide
          _buildShowcaseCard(
            'AnimatedSlide',
            AnimatedSlide(
              offset: _toggle ? const Offset(0.3, 0) : Offset.zero,
              duration: const Duration(milliseconds: 500),
              child: const Icon(
                Icons.arrow_forward,
                size: 50,
                color: Colors.green,
              ),
            ),
          ),

          // AnimatedSize
          _buildShowcaseCard(
            'AnimatedSize',
            AnimatedSize(
              duration: const Duration(milliseconds: 500),
              child: Container(
                width: _toggle ? 80 : 50,
                height: _toggle ? 80 : 50,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(_toggle ? 20 : 8),
                ),
              ),
            ),
          ),

          // AnimatedPositioned (needs Stack)
          _buildShowcaseCard(
            'AnimatedPositioned',
            SizedBox(
              width: 100,
              height: 80,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    left: _toggle ? 50 : 0,
                    top: _toggle ? 30 : 0,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // AnimatedPhysicalModel
          _buildShowcaseCard(
            'AnimatedPhysicalModel',
            AnimatedPhysicalModel(
              duration: const Duration(milliseconds: 500),
              shape: BoxShape.rectangle,
              elevation: _toggle ? 16 : 2,
              color: _toggle ? Colors.orange : Colors.grey[300]!,
              shadowColor: Colors.black,
              borderRadius: BorderRadius.circular(_toggle ? 20 : 8),
              child: const SizedBox(width: 60, height: 60),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShowcaseCard(String title, Widget child) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(height: 80, child: Center(child: child)),
          ],
        ),
      ),
    );
  }
}
