import 'package:flutter/material.dart';

/// Create FAQ items that expand to show answers when tapped
/// Use AnimatedCrossFade to switch between collapsed and expanded states

class ExpandableFaqItem extends StatefulWidget {
  const ExpandableFaqItem({super.key});

  @override
  State<ExpandableFaqItem> createState() => _ExpandableFaqItemState();
}

class _ExpandableFaqItemState extends State<ExpandableFaqItem> {
  final List<Map<String, String>> _faqs = [
    {
      'question': 'What is Flutter?',
      'answer':
          'Flutter is an open-source UI software development kit created by Google. It is used to develop cross-platform applications.',
    },
    {
      'question': 'What language does Flutter use?',
      'answer':
          'Flutter uses the Dart programming language, also developed by Google.',
    },
    {
      'question': 'Is Flutter free?',
      'answer': 'Yes! Flutter is completely free and open-source.',
    },
  ];

  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cross Fade Exercise")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _faqs.length,
        itemBuilder: (context, index) {
          final faq = _faqs[index];
          final isExpanded = _expandedIndex == index;

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () {
                setState(() {
                  _expandedIndex = isExpanded ? null : index;
                });
              },
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            faq['question']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        AnimatedRotation(
                          turns: isExpanded ? 0.5 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: const Icon(Icons.expand_more),
                        ),
                      ],
                    ),
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 300),
                      crossFadeState: isExpanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      firstChild: const SizedBox.shrink(),
                      secondChild: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          faq['answer']!,
                          style: TextStyle(
                            color: Colors.grey[600],
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
