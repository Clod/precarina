import 'package:flutter/material.dart';
import 'package:precarina/help_pages/precarina_help_widget.dart';
import 'package:precarina/help_pages_texts/diet_help_texts.dart';

class DietHelp extends StatelessWidget {
  const DietHelp({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return PrecarinaHelpWidget(title: title, context: context, spanishText: spanishText, englishText: englishText,);
  }
}
