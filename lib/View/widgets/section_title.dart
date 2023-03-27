import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SectionTitile extends StatelessWidget {
  final String title;
  final double screenHeight;
  final double screenWidth;
  const SectionTitile({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth / 20),
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
