// main.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// https://phrase.com/blog/posts/flutter-localization/
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const TextStyle _textStylePobre = TextStyle(
  fontWeight: FontWeight.bold,
  color: CupertinoColors.destructiveRed,
);
const TextStyle _textStyleInterm = TextStyle(
  fontWeight: FontWeight.bold,
  color: CupertinoColors.activeOrange,
);
const TextStyle _textStyleIdeal = TextStyle(
  fontWeight: FontWeight.bold,
  color: CupertinoColors.activeGreen,
);

SharedPreferences? prefs;
bool? flagShowTandC = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Obtain shared preferences.
  prefs = await SharedPreferences.getInstance();

  flagShowTandC = prefs!.getBool('showTandC');

  debugPrint("Show T&C: $flagShowTandC");
  // If I could not read it I assume T&C have not veen already accepted
  flagShowTandC ??= true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(fontSize: 18.0),
        ),
      ),
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Score',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English
        // Locale('es', ''), // Spanish
      ],
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String? _selectedValueFuma;
  String? _selectedValueBMI;
  String? _selectedValueActiFis;
  String? _selectedValueDieta;
  String? _selectedValueColesterol;
  String? _selectedValuePresion;
  String? _selectedValueGlucemia;

  double _puntaje = 0.0;
  String _score = '';
  Color _colorScore = CupertinoColors.black;
  bool _scoreVisible = false;

  late BuildContext bc;
  bool tcAccepted = false;

  _computeScore() {
    debugPrint('***************** Calculando el score *****************');

    if (_selectedValueFuma != null &&
        _selectedValueBMI != null &&
        _selectedValueActiFis != null &&
        _selectedValueDieta != null &&
        _selectedValueColesterol != null &&
        _selectedValuePresion != null &&
        _selectedValueGlucemia != null) {
      _puntaje = (double.parse(_selectedValueFuma!) +
          double.parse(_selectedValueBMI!) +
          double.parse(_selectedValueActiFis!) +
          double.parse(_selectedValueDieta!) +
          double.parse(_selectedValueColesterol!) +
          double.parse(_selectedValuePresion!) +
          double.parse(_selectedValueGlucemia!)) /
          7;
    }
    debugPrint('Puntaje: $_puntaje');
  }

  showHint(BuildContext context, String title, String body) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 16.0),
          ),
          content: SizedBox(
              width: 400,
              height: 400,
              child: SingleChildScrollView(
                child: Text(
                  body,
                  style: const TextStyle(fontSize: 14.0),
                ),
              )),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  showTandC(BuildContext context) {
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      AppLocalizations.of(context)!.txtAppPurpose,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                prefs!.setBool('showTandC', false);
                Navigator.of(context).pop();
              },
              child: const Text('Accept'),
            ),
          ],
        );
      },
    );
  }

  ////////////////////////////////////////////////////////////////
  void myFunction() {
    debugPrint('Widget built 1!');
    showTandC(bc);
  }

  @override
  void initState() {
    super.initState();
    debugPrint("En intiState $showTandC");

    if (flagShowTandC != false) {
      // Register a callback to execute after the widget is built
      WidgetsBinding.instance.addPostFrameCallback((_) => myFunction());
    }
  }

////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // final double screenHeight = MediaQuery.of(context).size.height;

    final gridColumnWidth = (screenWidth - 16.0) / 4.0;

    debugPrint('Ancho de pantalla: ${screenWidth.toString()}');

    // Acomodo el tamaño del font de acuerdo con el ancho de la pantalla
    final fontSize = screenWidth / 75.0;

    bc = context;

    return DefaultTextStyle(
      style: TextStyle(fontSize: fontSize),
      child: Text("algo"),
    );
  }
}
