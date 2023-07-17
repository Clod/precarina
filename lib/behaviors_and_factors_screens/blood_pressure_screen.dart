import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:provider/provider.dart';

import '../help_drawer.dart';

class BloodPressureScreen extends StatefulWidget {
  const BloodPressureScreen({super.key});

  @override
  State<BloodPressureScreen> createState() => _BloodPressureScreenState();
}

class _BloodPressureScreenState extends State<BloodPressureScreen> {
  final _controller = TextEditingController();
  var precaModel = PrecarinaModel();

  late BuildContext bc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => showWarning(bc));
  }

  showWarning(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('IMPORTANTE ¡LEER ATENTAMENTE!'),
              content: SizedBox(
                  width: 300,
                  height: 400,
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

  @override
  Widget build(BuildContext context) {
    precaModel = Provider.of<PrecarinaModel>(context);
    _controller.text = precaModel.dietValue.toString();
    bc = context;
    final Orientation orientation = MediaQuery.of(context).orientation;
    final Size dialogSize = (orientation == Orientation.portrait) ? Size(400, 600) : Size(600, 400);

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
          title: Text(AppLocalizations.of(context)!.txtBloodPressureButton),
        ),
        drawer: const HelpDrawer(),
        body: Column(
          children: [
            TextField(
              controller: _controller,
            ),
            Text("Sexo: ${precaModel.sex}"),
            Text("Edad: ${precaModel.ageYears} años ${precaModel.ageMonths} meses"),
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
