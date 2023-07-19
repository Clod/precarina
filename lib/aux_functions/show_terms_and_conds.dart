import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

showTandC(BuildContext context, Function setAccepted) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          AppLocalizations.of(context)!.txtImportantNotice,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.deepOrange,
              fontSize: 14.0,
              fontWeight: FontWeight.bold),
        ),
        content: SizedBox(
            width: 400,
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.txtReadCarefully,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    AppLocalizations.of(context)!.txtAppPurpose,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(Uri.parse('https://www.heart.org'));
                    },
                    child: const Text(
                      'American Heart Association',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    AppLocalizations.of(context)!.txtFundamentalsLocation,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(Uri.parse('https://playbook.heart.org/lifes-simple-7/'));
                    },
                    child: Text(
                      AppLocalizations.of(context)!.txtImportantNotice,
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            )),
        actions: [
          TextButton(
            onPressed: () {
              debugPrint("Cancelando...");
              // Gracefully quit the app
              // Según leí, Apple no lo permite pero esto, de alguna manera, lo logra.
              // FlutterExitApp.exitApp(iosForceExit: true);
              FlutterExitApp.exitApp();
            },
            child: const Text('Reject'),
          ),
          TextButton(
            onPressed: () {
              debugPrint("Aceptando...");
              setAccepted();
              // prefs!.setBool('showTandC', false);
              Navigator.of(context).pop();
            },
            child: const Text('Accept'),
          ),
        ],
      );
    },
  );
}