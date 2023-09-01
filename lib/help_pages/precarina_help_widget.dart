import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class PrecarinaHelpWidget extends StatelessWidget {

  const PrecarinaHelpWidget({
    super.key,
    required this.title,
    required this.context,
    required this.spanishText,    required this.englishText,
  });

  final String title;
  final BuildContext context;
  final String spanishText;
  final String englishText;

  @override
  Widget build(BuildContext context) {

    final locale = Localizations.localeOf(context);

    final localizedValues = <String, Map<String, String>>{
      'en': {
        'title': englishText,
      },
      'es': {
        'title': spanishText,
      },
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: HtmlWidget(localizedValues[locale.languageCode]!['title']!
              //htmlData,
              //"txtCholesterolHelp".i18n(),
            ),
          ),
        ),
      ),
    );
  }
}