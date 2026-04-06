import 'package:flutter/material.dart';

/// Create a welcome screen where elements fade in one by one
/// 1. Logo fades in first (after 500ms)
/// 2. Title fades in second (after 1000ms)
/// 3. Subtitle fades in third (after 1500ms)
/// 4. Button fades in last (after 2000ms)

class FadeInWelcomeMessage extends StatefulWidget {
  const FadeInWelcomeMessage({super.key});

  @override
  State<FadeInWelcomeMessage> createState() => _FadeInWelcomeMessageState();
}

class _FadeInWelcomeMessageState extends State<FadeInWelcomeMessage> {
  double _logoOpacity = 0;
  double _titleOpacity = 0;
  double _subtitleOpacity = 0;
  double _btnOpacity = 0;

  @override
  void initState() {
    super.initState();
    _callFadeInElements();
  }

  _callFadeInElements({double opacity = 1}) {
    Future.delayed(
      .new(milliseconds: 500),
      () => setState(() {
        _logoOpacity = opacity;
      }),
    );

    Future.delayed(
      .new(milliseconds: 1000),
      () => setState(() {
        _titleOpacity = opacity;
      }),
    );

    Future.delayed(
      .new(milliseconds: 1500),
      () => setState(() {
        _subtitleOpacity = opacity;
      }),
    );

    Future.delayed(
      .new(milliseconds: 2000),
      () => setState(() {
        _btnOpacity = opacity;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            AnimatedOpacity(
              opacity: _logoOpacity,
              duration: .new(milliseconds: 800),
              child: FlutterLogo(size: 120),
            ),

            AnimatedOpacity(
              opacity: _titleOpacity,
              duration: .new(milliseconds: 600),
              child: Text(
                "Flutter App Developer",
                style: TextStyle(fontSize: 20, fontWeight: .bold),
              ),
            ),

            AnimatedOpacity(
              opacity: _subtitleOpacity,
              duration: .new(milliseconds: 500),
              child: Text(
                "1+ years of experience",
                style: TextStyle(fontSize: 16),
              ),
            ),

            AnimatedOpacity(
              opacity: _btnOpacity,
              duration: .new(milliseconds: 600),
              child: ElevatedButton(
                onPressed: () {
                  _callFadeInElements(opacity: 0);
                },
                child: Text("Hire me"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
