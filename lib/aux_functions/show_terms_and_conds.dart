import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:precarina/aux_widgets/vertical_space.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/app_localizations.dart';

showTandC(BuildContext context, Function setAccepted) {
  final l10n = AppLocalizations.of(context)!;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          l10n.txtImportantNotice,
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
                  l10n.txtReadCarefully,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const VerticalSpace(height: 10.0),
                Text(
                  l10n.txtAppPurpose,
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
                  l10n.txtFundamentalsLocation,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () async {
                    await launchUrl(Uri.parse('https://www.ahajournals.org/doi/10.1161/CIR.0000000000001078'));
                  },
                  child: Text(
                    l10n.txtLifeEssentialEightObjective,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Text(
                  l10n.txtPaperAuthors,
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
            child: Text(l10n.txtButtonRejectTandC),
          ),
          TextButton(
              onPressed: () {
                debugPrint("Aceptando...");
                setAccepted();
                Navigator.of(context).pop();
              },
              child: Text(l10n.txtButtonAcceptTandC)),
        ],
      );
    },
  );
}
