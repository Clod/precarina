import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @txtReadCarefully.
  ///
  /// In en, this message translates to:
  /// **'Please read carefully before using this app'**
  String get txtReadCarefully;

  /// No description provided for @txtAppPurpose.
  ///
  /// In en, this message translates to:
  /// **'This app calculates the estimated cardiovascular health score as defined by the'**
  String get txtAppPurpose;

  /// No description provided for @txtFundamentalsLocation.
  ///
  /// In en, this message translates to:
  /// **'The scoring system and criteria are thoroughly explained in:'**
  String get txtFundamentalsLocation;

  /// No description provided for @txtLifeEssentialEightObjective.
  ///
  /// In en, this message translates to:
  /// **'Life’s Essential 8: Updating and Enhancing the American Heart Association’s Construct of Cardiovascular Health: A Presidential Advisory From the American Heart Association'**
  String get txtLifeEssentialEightObjective;

  /// No description provided for @txtPaperAuthors.
  ///
  /// In en, this message translates to:
  /// **'Published by: Donald M. Lloyd-Jones, MD, ScM, FAHA, Chair; Norrina B. Allen, PhD, MPH, FAHA; Cheryl A.M. Anderson, PhD, MPH, MS, FAHA; Terrie Black, DNP, MBA, CRRN, FAHA; LaPrincess C. Brewer, MD, MPH; Randi E. Foraker, PhD, MA, FAHA; Michael A. Grandner, PhD, MTR, FAHA; Helen Lavretsky, MD, MS; Amanda Marma Perak, MD, MS, FAHA; Garima Sharma, MD; Wayne Rosamond, PhD, MS, FAHA; on behalf of the American Heart Association'**
  String get txtPaperAuthors;

  /// No description provided for @txtFundamentalsLocationMainWindow.
  ///
  /// In en, this message translates to:
  /// **'Click here to read the foundations'**
  String get txtFundamentalsLocationMainWindow;

  /// No description provided for @txtButtonAcceptTandC.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get txtButtonAcceptTandC;

  /// No description provided for @txtButtonRejectTandC.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get txtButtonRejectTandC;

  /// No description provided for @txtButtonWarnings.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get txtButtonWarnings;

  /// No description provided for @txtButtonAccept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get txtButtonAccept;

  /// No description provided for @txtButtonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get txtButtonCancel;

  /// No description provided for @txtCancelModalTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get txtCancelModalTitle;

  /// No description provided for @txtCancelModalText.
  ///
  /// In en, this message translates to:
  /// **'Do you want to discard your changes?'**
  String get txtCancelModalText;

  /// No description provided for @txtCancelModalDiscard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get txtCancelModalDiscard;

  /// No description provided for @txtCancelModalVolver.
  ///
  /// In en, this message translates to:
  /// **'Return'**
  String get txtCancelModalVolver;

  ///
  ///
  /// In en, this message translates to:
  /// **'Diet'**
  String get txtDietButton;

  /// No description provided for @txtDietDialog.
  ///
  /// In en, this message translates to:
  /// **'Quantiles of DASH-style diet adherence (MEPA). Ages 2-19 y.\';'**
  String get txtDietDialog;

  /// No description provided for @txtDietDialogOptions.
  ///
  /// In en, this message translates to:
  /// **'9-10 MEPA score points|7-8 MEPA score points|5-6 MEPA score points|3-4 MEPA score points|0-2 MEPA score points'**
  String get txtDietDialogOptions;

  /// No description provided for @txtDietHelp.
  ///
  /// In en, this message translates to:
  /// **'**Quantiles of DASH-style diet adherence (MEPA)** refers to a statistical analysis method used to assess adherence to the DASH-style diet (DASH: Dietary Approaches to Stop Hypertension), which is a dietary pattern that emphasizes the consumption of fruits, vegetables, whole grains, lean proteins, and low-fat dairy products, while limiting intake of sodium, added sugars, and saturated fats. \n\n**MEPA** is Mediterranean Eating Pattern for Americans. \n\nThe **quantiles** refer to dividing a dataset into equal parts or intervals, based on the distribution of a particular variable (in this case, adherence to the DASH-style diet), in order to analyze the data and compare different groups of individuals. The use of quantiles in this context allows for the identification of specific levels of adherence to the DASH-style diet.'**
  String get txtDietHelp;

  /// No description provided for @txtDietWarning.
  ///
  /// In en, this message translates to:
  /// **''**
  String get txtDietWarning;

  /// No description provided for @txtPhysicalActivityButton.
  ///
  /// In en, this message translates to:
  /// **'Physical Activity'**
  String get txtPhysicalActivityButton;

  /// No description provided for @txtPhysicalActivityDialog.
  ///
  /// In en, this message translates to:
  /// **'Minutes of moderate or greater intensity activity per week. Ages: 6 to 9.'**
  String get txtPhysicalActivityDialog;

  /// No description provided for @txtPhysicalActivityDialogOptions.
  ///
  /// In en, this message translates to:
  /// **'≥ 420 minutes|360 - 419 minutes|300 - 359 minutes|240 - 299 minutes|120 - 239 minutes|1 - 119 minutes|No activity'**
  String get txtPhysicalActivityDialogOptions;

  /// No description provided for @txtPhysicalActivityHelp.
  ///
  /// In en, this message translates to:
  /// **''**
  String get txtPhysicalActivityHelp;

  /// No description provided for @txtBodyMassIndexButton.
  ///
  /// In en, this message translates to:
  /// **'BMI'**
  String get txtBodyMassIndexButton;

  /// No description provided for @txtBodyMassIndexDialog.
  ///
  /// In en, this message translates to:
  /// **'BMI percentiles for age and sex, starting in infancy.'**
  String get txtBodyMassIndexDialog;

  /// No description provided for @txtBodyMassIndexDialogOptions.
  ///
  /// In en, this message translates to:
  /// **'5th - < 85th percentile|85th - < 95th|95th percentile - < 120% of the 95th percentile|120% of the 95th - < 140% of the 95th percentile|≥ 140% of the 95th percentile'**
  String get txtBodyMassIndexDialogOptions;

  /// No description provided for @txtBodyMassIndextHelp.
  ///
  /// In en, this message translates to:
  /// **'**BMI** stands for Body Mass Index, which is a measure of body fat based on an individual\'s height and weight. It is calculated by dividing an individual\'s weight in kilograms by their height in meters squared *(BMI = kg/m²)*. \n\n It is important to note that BMI is not a direct measure of body fat and does not take into account factors such as muscle mass or body composition. Therefore, it may not accurately reflect the health status of individuals with high muscle mass, such as athletes, or those with low muscle mass, such as older adults. However, for most people, BMI is a useful tool for assessing their weight status and potential health risks associated with being overweight or obese.'**
  String get txtBodyMassIndextHelp;

  /// No description provided for @txtBodyMassIndexWarning.
  ///
  /// In en, this message translates to:
  /// **''**
  String get txtBodyMassIndexWarning;

  /// No description provided for @txtSleepButton.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get txtSleepButton;

  /// No description provided for @txtSleepDialog.
  ///
  /// In en, this message translates to:
  /// **'Average hours of sleep per night (or per 24 h for age ≤ 5)'**
  String get txtSleepDialog;

  /// No description provided for @txtSleepDialogOptions.
  ///
  /// In en, this message translates to:
  /// **'Age-appropriate optimal range|< 1h above optimal range|< 1h above optimal range|1 - < 2h below or ≥1h above optimal range|2 - < 3h below optimal range|≥ 3h below optimal range'**
  String get txtSleepDialogOptions;

  /// No description provided for @txtSleepWarning.
  ///
  /// In en, this message translates to:
  /// **''**
  String get txtSleepWarning;

  /// No description provided for @txtSmokeExposureButton.
  ///
  /// In en, this message translates to:
  /// **'Smoke Exposure'**
  String get txtSmokeExposureButton;

  /// No description provided for @txtSmokeExposureDialog.
  ///
  /// In en, this message translates to:
  /// **'Combustible tobacco use or inhaled NDS use at any age (per clinician discretion); or secondhand smoke exposure'**
  String get txtSmokeExposureDialog;

  /// No description provided for @txtSmokeExposureDialogOptions.
  ///
  /// In en, this message translates to:
  /// **'Never tried |Never tried but lives with indoor smoker at home |Tried any nicotine product, but > 30d ago |Tried any nicotine product, but > 30d ago and lives with indoor smoker at home |Currently using inhaled NDS |Currently using inhaled NDS and lives with indoor smoker at home |Current combustible use (any within 30d)'**
  String get txtSmokeExposureDialogOptions;

  /// No description provided for @txtSmokeExposureHelp.
  ///
  /// In en, this message translates to:
  /// **'**NDS** stands for nicotine-delivery system, which is a term used to describe any device or product that delivers *nicotine* to the body, including cigarettes, e-cigarettes, vaping devices, and other tobacco products.'**
  String get txtSmokeExposureHelp;

  /// No description provided for @txtSmokeExposureWarning.
  ///
  /// In en, this message translates to:
  /// **''**
  String get txtSmokeExposureWarning;

  /// No description provided for @txtDiabetesButton.
  ///
  /// In en, this message translates to:
  /// **'Diabetes'**
  String get txtDiabetesButton;

  /// No description provided for @txtDiabetesDialog.
  ///
  /// In en, this message translates to:
  /// **'FBG (mg/dL) or HbA1c (%) symptom-based screening at any age or risk-based screening starting at age ≥10y of age or onset of puberty per clinician discretion'**
  String get txtDiabetesDialog;

  /// No description provided for @txtDiabetesDialogOptions.
  ///
  /// In en, this message translates to:
  /// **'No history of diabetes and FBG<100 mg/dL (or HbA1c < 5.7%) | Prediabetes with FBG 100 - 125 mg/dL (or HbA1c 5.7 - 6.4%) | Diabetes with HbA1c < 7.0% | Diabetes with HbA1c 7.0 - 7.9% | Diabetes with HbA1c 8.0 - 8.9% | Diabetes with HbA1c 9.0 - 9.9% | Diabetes with HbA1c ≥ 10%'**
  String get txtDiabetesDialogOptions;

  /// No description provided for @txtDiabetesHelp.
  ///
  /// In en, this message translates to:
  /// **'**FBG** stands for Fasting Blood Glucose. This is a test that measures the level of glucose (sugar) in the blood after fasting for a certain period of time. \n\n**HbA1c** stands for Glycated Hemoglobin and is a blood test that measures the average blood glucose levels over the past 2-3 months. Hemoglobin is a protein in red blood cells that carries oxygen throughout the body. When glucose in the blood binds to hemoglobin, the result is glycated hemoglobin, or HbA1c.'**
  String get txtDiabetesHelp;

  /// No description provided for @txtDiabetesWarning.
  ///
  /// In en, this message translates to:
  /// **''**
  String get txtDiabetesWarning;

  /// No description provided for @txtBloodPressureButton.
  ///
  /// In en, this message translates to:
  /// **'Blood Pressure'**
  String get txtBloodPressureButton;

  /// No description provided for @txtBloodPressureDialog.
  ///
  /// In en, this message translates to:
  /// **'Systolic and diastolic BP (mm Hg) percentiles for age through 12y. For age ≥ 13y use adult scoring. Screening should start no later than age 3y and earlier per clinician discretion.'**
  String get txtBloodPressureDialog;

  /// No description provided for @txtBloodPressureDialogOptions.
  ///
  /// In en, this message translates to:
  /// **'Optimal (<90th percentile) |Optimal (<90th percentile) (treated) |Elevated (≥90th - <95th percentile or ≥ 120/80 mm Hg to <95th percentile, whichever is lower) |Elevated (≥90th - <95th percentile or ≥ 120/80 mm Hg to <95th percentile, whichever is lower) (treated) |Stage 1 hypertension (≥95th - <95th percentile + 12 mm Hg, or 130/80 - 139/89 mm Hg, whichever is lower |Stage 1 hypertension (≥95th - <95th percentile + 12 mm Hg, or 130/80 - 139/89 mm Hg, whichever is lower (treated) |Stage 2 hypertension (≥95th percentile + 12 mm Hg, or ≥140/90 mm Hg, whichever is lower) |Stage 2 hypertension (≥95th percentile + 12 mm Hg, or ≥140/90 mm Hg, whichever is lower) (treated) |Systolic BP ≥ 160 or ≥95th percentile + 30 mm Hg systolic BP, whichever is lower and/or diastolic BP ≥ 100 or ≥ 95th percentile + 20 mm Hg diastolic BP'**
  String get txtBloodPressureDialogOptions;

  /// No description provided for @txtBloodPressureHelp.
  ///
  /// In en, this message translates to:
  /// **'**Systolic blood pressure (SBP)** is the pressure exerted by the blood against the walls of the arteries when the heart beats and pumps blood out into the body. It is the top number in a blood pressure reading and is measured in millimeters of mercury (mm Hg).\n\n**Diastolic blood pressure (DBP)** is the pressure exerted by the blood against the walls of the arteries when the heart is at rest between beats. It is the bottom number in a blood pressure reading and is also measured in millimeters of mercury (mm Hg).'**
  String get txtBloodPressureHelp;

  /// No description provided for @txtBloodPressureWarning.
  ///
  /// In en, this message translates to:
  /// **'<h3 style=\"text-align:center;\">CORRECT TECHNIQUE FOR MEASURING BLOOD PRESSURE IN PEDIATRICS</h3> <p>With the patient at rest and calm, measurement should be taken with an appropriate-sized cuff for the child, with a cuff bladder that covers 2/3 of the arm\'s diameter and 2/3 of its length. Three readings should be taken and averaged. If values greater than the 90th percentile are recorded, they should be confirmed with auscultatory technique.</p><p><span style=\"color:red\">For proper use of the app, in case of recordings greater than the 90th percentile, the values to be entered must be the average of 3 readings taken during different consultations, with 3 readings per consultation.</span></p>'**
  String get txtBloodPressureWarning;

  /// No description provided for @txtCholesterolButton.
  ///
  /// In en, this message translates to:
  /// **'Cholesterol'**
  String get txtCholesterolButton;

  /// No description provided for @txtCholesterolDialog.
  ///
  /// In en, this message translates to:
  /// **'Non-HDL cholesterol (mg/dL), starting no later than age 9 - 11y and earlier per clinician discretion'**
  String get txtCholesterolDialog;

  /// No description provided for @txtCholesterolDialogOptions.
  ///
  /// In en, this message translates to:
  /// **'< 170 mg/dl|170 - 199 mg/dl|≥ 200 mg/dl'**
  String get txtCholesterolDialogOptions;

  /// No description provided for @txtCholesterolWarning.
  ///
  /// In en, this message translates to:
  /// **''**
  String get txtCholesterolWarning;

  /// No description provided for @txtCholesterolHelp.
  ///
  /// In en, this message translates to:
  /// **''**
  String get txtCholesterolHelp;

  /// No description provided for @txtLongPressGauge.
  ///
  /// In en, this message translates to:
  /// **'Long press the gauge to reset all values.'**
  String get txtLongPressGauge;

  /// No description provided for @txtGlossary.
  ///
  /// In en, this message translates to:
  /// **'Important Information'**
  String get txtGlossary;

  /// No description provided for @txtAbout.
  ///
  /// In en, this message translates to:
  /// **''**
  String get txtAbout;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
