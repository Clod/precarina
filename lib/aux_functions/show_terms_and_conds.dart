import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:localization/localization.dart';
import 'package:precarina/aux_widgets/vertical_space.dart';
import 'package:url_launcher/url_launcher.dart';

showTandC(BuildContext context, Function setAccepted) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "txtImportantNotice".i18n(),
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.deepOrange, fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        content: SizedBox(
          width: 400,
          height: 400,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "txtReadCarefully".i18n(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const VerticalSpace(height: 10.0),
                Text(
                  "txtAppPurpose".i18n(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const VerticalSpace(height: 10.0),
                GestureDetector(
                  onTap: () async {
                    await launchUrl(Uri.parse('https://www.heart.org/en/healthy-living/healthy-lifestyle/lifes-essential-8'));
                  },
                  child: const Text(
                    'American Heart Association',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const VerticalSpace(height: 10.0),
                Text(
                  "txtFundamentalsLocation".i18n(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () async {
                    await launchUrl(Uri.parse('https://www.ahajournals.org/doi/10.1161/CIR.0000000000001078'));
                  },
                  child: Text(
                    "txtLifeEssentialEightObjective".i18n(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Text(
                  "txtPaperAuthors".i18n(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              debugPrint("Cancelando...");
              // Gracefully quit the app
              // Según leí, Apple no lo permite pero esto, de alguna manera, lo logra.
              // FlutterExitApp.exitApp(iosForceExit: true);
              FlutterExitApp.exitApp();
            },
            child: Text("txtButtonRejectTandC".i18n()),
          ),
          TextButton(
              onPressed: () {
                debugPrint("Aceptando...");
                setAccepted();
                Navigator.of(context).pop();
              },
              child: Text("txtButtonAcceptTandC".i18n())),
        ],
      );
    },
  );
}
