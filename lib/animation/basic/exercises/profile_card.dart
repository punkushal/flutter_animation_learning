import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: AnimatedContainer(
        duration: .new(milliseconds: 400),
        curve: Curves.easeInOutCubic,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        width: .infinity,
        height: _isExpanded ? 150 : 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .start,
          spacing: 6,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: .start,
                  spacing: 6,
                  children: [
                    Text("Name: John Doe"),
                    Text("Email: john@233gmail.com"),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  style: TextButton.styleFrom(padding: .zero),
                  child: Text(_isExpanded ? "View less" : "View more"),
                ),
              ],
            ),

            if (_isExpanded) ...[
              Text("Job Role: Mobile App Developer"),
              Text("Hourly rate: Npr 1200"),
            ],
          ],
        ),
      ),
    );
  }
}
