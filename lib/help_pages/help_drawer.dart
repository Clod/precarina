import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:precarina/help_pages/blood_pressure_help.dart';
import 'package:precarina/help_pages/physical_activity_help.dart';
import 'package:precarina/help_pages/smoke_exposure_help.dart';
import 'package:precarina/help_pages/bmi_help.dart';
import 'package:precarina/help_pages/cholesterol_help.dart';
import 'package:precarina/help_pages/diabetes_help.dart';
import 'package:precarina/help_pages/diet_help.dart';
import 'package:precarina/help_pages/sleep_help.dart';
import 'package:url_launcher/url_launcher.dart';

// https://blog.logrocket.com/how-to-add-navigation-drawer-flutter/
class HelpDrawer extends StatelessWidget {
  const HelpDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Center(
              child: Text(
                l10n.txtGlossary,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: Text(l10n.txtDietButton),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DietHelp(
                      title: l10n.txtDietButton,
                      content: l10n.txtDietHelp),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.balance),
            // leading: const Icon(Icons.scale),
            title: Text(l10n.txtBodyMassIndexButton),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BmiHelp(
                      title: l10n.txtBodyMassIndexButton,
                      content: l10n.txtBodyMassIndextHelp),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.smoking_rooms),
            title: Text(l10n.txtSmokeExposureButton),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SmokeExposureHelp(
                      title: l10n.txtSmokeExposureButton,
                      content: l10n.txtSmokeExposureHelp),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.fastfood),
            title: Text(l10n.txtCholesterolButton),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CholesterolHelp(
                      title: l10n.txtCholesterolButton,
                      content: l10n.txtCholesterolHelp),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.sports_tennis),
            title:
                Text(l10n.txtPhysicalActivityButton),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhysicalActivityHelp(
                      title: l10n.txtPhysicalActivityButton,
                      content: l10n.txtPhysicalActivityHelp),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.bedtime),
            title: Text(l10n.txtSleepButton),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SleepHelp(
                    title: l10n.txtSleepButton,
                    content: l10n.txtSleepButton, // Assuming this should also be a specific help string like l10n.txtSleepHelp
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.cookie),
            title: Text(l10n.txtDiabetesButton),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiabetesHelp(
                      title: l10n.txtDiabetesButton,
                      content: l10n.txtDiabetesHelp),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: Text(l10n.txtBloodPressureButton),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BloodPressureHelp(
                    title: l10n.txtBloodPressureButton,
                    content: l10n.txtBloodPressureHelp,
                  ),
                ),
              );
            },
          ),
          AboutListTile(
            icon: const Icon(
              Icons.info,
            ),
            applicationIcon: const Icon(
              Icons.local_play,
            ),
            applicationName: l10n.txtPrecarina, // Assuming 'PRECARINA' is also a localized string
            applicationVersion: '2.4.0 Build 27',
            applicationLegalese: l10n.txtApplicationLegalese,
            aboutBoxChildren: [
              const SizedBox(
                height: 5.0,
              ),
              GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse(
                      'https://grasso.net.ar/precarina/precarina-data-security/'));
                },
                child: Text(
                  l10n.txtPrivacyPolicy,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              SizedBox(
                height: 300.0,
                width: 150.0,
                child: SingleChildScrollView(
                  child: Html(data: l10n.txtAbout),
                ),
              )
            ],
            child: Text(l10n.txtAboutApp,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
