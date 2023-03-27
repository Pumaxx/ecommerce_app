import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SectionTitile extends StatelessWidget {
  final String title;
  const SectionTitile({
    super.key,
    required this.screenHeight,
    required this.title,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: AutoSizeText(
          title,
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
            fontSize: screenHeight * 0.023,
            fontFamily: 'Avenir',
          ),
        ),
      ),
    );
  }
}
