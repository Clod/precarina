import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:provider/provider.dart';
import '../aux_functions/lose_input_warning.dart';
import '../aux_widgets/vertical_space.dart';
import '../help_drawer.dart';

class PhysicalActivityScreen extends StatefulWidget {
  const PhysicalActivityScreen({super.key});

  @override
  State<PhysicalActivityScreen> createState() => _PhysicalActivityScreenState();
}

class _PhysicalActivityScreenState extends State<PhysicalActivityScreen> {
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

    final physicalActivityValues = [100, 90, 80, 60, 40, 20, 0];
    List<String> optionsTexts = AppLocalizations.of(context)!.txtPhysicalActivityDialogOptions.split("|");

    bc = context;
    // final Orientation orientation = MediaQuery.of(context).orientation;
    // final Size dialogSize = (orientation == Orientation.portrait) ? Size(400, 600) : Size(600, 400);

    return WillPopScope(
      onWillPop: () => showInputLostWarning(context),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.txtPhysicalActivityButton),
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
                        const VerticalSpace(altura: 10.0),
                        Row(
                          children: [
                            // SizedBox(width: 60.0),
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
                        List<SizedBox> sbList = [];
                        for (int i = 0; i < optionsTexts.length; i++) {
                          sbList.add(SizedBox(
                            width: 300.0,
                            child: RadioListTile(
                              title: Text(optionsTexts[i]),
                              value: physicalActivityValues[i],
                              groupValue: _selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  enableAcceptButton = true;
                                  _selectedOption = value;
                                });
                              },
                            ),
                          ));
                        }
                        return sbList;
                      })(),
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
                      onPressed: enableAcceptButton ? () {
                        precaModel.physicalActivityValue = _selectedOption;
                        debugPrint("Physical Activity Value en Screen: ${precaModel.physicalActivityValue}");
                        precaModel.calculateAverage();
                        Navigator.of(context).pop();
                      } : null,
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