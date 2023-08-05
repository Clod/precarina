import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

showWarning(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback(
        (_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('IMPORTANTE\n¡LEER ATENTAMENTE!', textAlign: TextAlign.center,),
            content: SizedBox(
              width: 300.0,
              height: 400.0,
              child: SingleChildScrollView(child: Html(data:AppLocalizations.of(context)!.txtBloodPressureWarning)),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    },
  );
}