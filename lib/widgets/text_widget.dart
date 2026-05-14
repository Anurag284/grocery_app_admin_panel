import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextWidget extends StatefulWidget {
  const TextWidget({
    super.key,
    required this.title,
    required this.color,
    this.textSize = 16.0,
    this.isTitle = false,
    this.maxLines = 10,
  });
  final String title;
  final Color color;
  final double textSize;
  final bool isTitle;
  final int maxLines;

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      maxLines: widget.maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: widget.color,
        fontSize: widget.textSize,
        fontWeight: widget.isTitle ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
