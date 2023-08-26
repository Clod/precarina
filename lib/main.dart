// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localization/localization.dart';
import 'package:precarina/input_data_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'aux_functions/show_terms_and_conds.dart';
import 'help_pages/help_drawer.dart';
import 'package:precarina/model/precarina_model.dart';

SharedPreferences? prefs;
bool? flagShowTandC = true;

//double _promedio = 0;
List<int> dummy = [];

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

  runApp(
    ChangeNotifierProvider(
      create: (context) => PrecarinaModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    LocalJsonLocalization.delegate.directories = ['lib/i18n'];

    return  MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18.0),
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
        LocalJsonLocalization.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('es', 'ES'), // Spanish
      ],
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late BuildContext bc;
  bool tcAccepted = false;

  @override
  void initState() {
    super.initState();
    debugPrint("En intiState $showTandC");

    if (flagShowTandC != false) {
      // Register a callback to execute after the widget is built
      WidgetsBinding.instance.addPostFrameCallback((_) => showTandC(bc, () => prefs!.setBool('showTandC', false)));
    }
  }

  @override
  Widget build(BuildContext context) {

    bc = context;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PRECARINA',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: const HelpDrawer(),
      body: const InputDataPage(),
      // body: const MainScreen(),
    );
  }
}
