import 'package:flutter/material.dart';
import 'package:precarina/help_pages_texts/blood_pressure_help_texts.dart';
import 'package:precarina/help_pages/precarina_help_widget.dart';

class BloodPressureHelp extends StatelessWidget {
  const BloodPressureHelp({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return PrecarinaHelpWidget(title: title, context: context, spanishText: spanishText, englishText: englishText,);
  }
}


