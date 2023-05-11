import 'package:ebook_audiobook_flutter/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTabs extends StatelessWidget {
  const CustomTabs({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        //shadow of labels
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 7,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: kWhiteTagColor,
        ),
      ),
    );
  }
}
