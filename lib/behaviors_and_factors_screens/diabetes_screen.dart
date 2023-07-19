import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:provider/provider.dart';
import '../aux_functions/lose_input_warning.dart';
import '../aux_widgets/vertical_space.dart';
import '../help_drawer.dart';

class DiabetesScreen extends StatefulWidget {
  const DiabetesScreen({super.key});

  @override
  State<DiabetesScreen> createState() => _DiabetesScreenState();
}

class _DiabetesScreenState extends State<DiabetesScreen> {
  // final _controllerHeight = TextEditingController();
  // final _controllerSex = TextEditingController();
  // final _controllerAge = TextEditingController();
  // final _controllerSistAP = TextEditingController();
  // final _controllerDiastPA = TextEditingController();

  var precaModel = PrecarinaModel();

  late BuildContext bc;

  int? _selectedOption;

  bool enableAcceptButton = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Acá no me gusta pero initState explota. Ver si hay un lugar mejor
    precaModel = Provider.of<PrecarinaModel>(context);

    final diabetesValues = [100, 60, 40, 30, 20, 10, 0];
    List<String> optionsTexts = AppLocalizations.of(context)!.txtDiabetesDialogOptions.split("|");

    bc = context;
    // final Orientation orientation = MediaQuery.of(context).orientation;
    // final Size dialogSize = (orientation == Orientation.portrait) ? Size(400, 600) : Size(600, 400);

    return WillPopScope(
      onWillPop: () => showInputLostWarning(context),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.txtDiabetesButton),
        ),
        drawer: const HelpDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.yellow[200],
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        const VerticalSpace(altura: 15.0),
                        const Text(
                          "Sexo: ",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const Text(
                          "Edad: ",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const Text(
                          "Estatura: ",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const Text(
                          "Peso: ",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Row(
                          children: [
                            CupertinoButton(
                              child: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        const VerticalSpace(altura: 10.0),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...(() {
                        List<Widget> sbList = [];
                        for (int i = 0; i < optionsTexts.length; i++) {
                          sbList.add(SizedBox(
                            width: 300.0,
                            child: RadioListTile(
                              title: Text(optionsTexts[i]),
                              value: diabetesValues[i],
                              groupValue: _selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  enableAcceptButton = true;
                                  _selectedOption = value;
                                });
                              },
                            ),
                          ));
                          sbList.add(const VerticalSpace(altura: 5.0));
                        }
                        return sbList;
                      })(),
                      const VerticalSpace(altura: 15.0),
                    ],
                  ),
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
                      onPressed: enableAcceptButton
                          ? () {
                              precaModel.diabetesValue = _selectedOption;
                              debugPrint("Diabetes Value en Screen: ${precaModel.diabetesValue}");
                              precaModel.calculateAverage();
                              Navigator.of(context).pop();
                            }
                          : null,
                      child: Text(AppLocalizations.of(context)!.txtButtonAccept),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
