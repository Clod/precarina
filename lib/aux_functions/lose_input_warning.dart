import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

Future<bool> showInputLostWarning(BuildContext context) async {
  final shouldPop = await showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(AppLocalizations.of(context)!.txtCancelModalTitle),
        content: Text(AppLocalizations.of(context)!.txtCancelModalText),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text(AppLocalizations.of(context)!.txtCancelModalDiscard),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text(AppLocalizations.of(context)!.txtCancelModalVolver),
          ),
        ],
      );
    },
  );
  return shouldPop ?? false;
}
