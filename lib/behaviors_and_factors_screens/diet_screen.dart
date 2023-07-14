import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:provider/provider.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {

  final _controller = TextEditingController();
  var precaModel = PrecarinaModel();

  @override
  Widget build(BuildContext context) {

    precaModel = Provider.of<PrecarinaModel>(context);
    _controller.text = precaModel.dietValue.toString();

    return WillPopScope(
      onWillPop: () async {
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
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.txtDietButton),
        ),
        body: Column(
          children: [
            TextField(
              controller: _controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text(AppLocalizations.of(context)!.txtButtonCancel),
                  onPressed: () => Navigator.maybePop(context),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    precaModel.dietValue = int.parse(_controller.value.text);
                    debugPrint("Diet Value en Screen: ${precaModel.dietValue}");
                    precaModel.calculateAverage();
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.txtButtonAccept),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
