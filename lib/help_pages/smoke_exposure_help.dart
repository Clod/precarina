import 'package:flutter/material.dart';
import 'package:precarina/help_pages/precarina_help_widget.dart';
import 'package:precarina/help_pages_texts/smoke_explosure_help_texts.dart';

class SmokeExposureHelp extends StatelessWidget {
  const SmokeExposureHelp({
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
