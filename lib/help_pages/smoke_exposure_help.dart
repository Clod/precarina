import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:precarina/help_pages/smoke_explosure_help_texts.dart';

const spanishText = r"""

""";

class SmokeExposureHelp extends StatelessWidget {
  const SmokeExposureHelp({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {

    final locale = Localizations.localeOf(context);

    final _localizedValues = <String, Map<String, String>>{
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
            child: HtmlWidget(_localizedValues[locale.languageCode]!['title']!
              //htmlData,
              //"txtCholesterolHelp".i18n(),
            ),
          ),
        ),
      ),
    );
  }
}
