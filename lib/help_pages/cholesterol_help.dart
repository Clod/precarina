import 'package:flutter/material.dart';
import 'package:precarina/help_pages/precarina_help_widget.dart';
import 'package:precarina/help_pages_texts/cholesterol_help_texts.dart';

class CholesterolHelp extends StatelessWidget {
  const CholesterolHelp({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'title': textEnglish,
    },
    'es': {
      'title': textSpanish,
    },
  };

  @override
  Widget build(BuildContext context) {
    return PrecarinaHelpWidget(title: title, context: context, spanishText: textSpanish, englishText: textEnglish,);
  }
}
