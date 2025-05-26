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
  /// **'≥ 420 minutes|360:419 minutes|300:359 minutes|240:299 minutes|120:239 minutes|1:119 minutes|No activity'**
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
  /// **'5th:< 85th percentile|85th:< 95th|95th percentile:< 120% of the 95th percentile|120% of the 95th:< 140% of the 95th percentile|≥ 140% of the 95th percentile'**
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
  /// **'Age-appropriate optimal range|< 1h above optimal range|< 1h above optimal range|1:< 2h below or ≥1h above optimal range|2:< 3h below optimal range|≥ 3h below optimal range'**
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
  /// **'No history of diabetes and FBG<100 mg/dL (or HbA1c < 5.7%) | Prediabetes with FBG 100:125 mg/dL (or HbA1c 5.7:6.4%) | Diabetes with HbA1c < 7.0% | Diabetes with HbA1c 7.0:7.9% | Diabetes with HbA1c 8.0:8.9% | Diabetes with HbA1c 9.0:9.9% | Diabetes with HbA1c ≥ 10%'**
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
  /// **'Optimal (<90th percentile) |Optimal (<90th percentile) (treated) |Elevated (≥90th:<95th percentile or ≥ 120/80 mm Hg to <95th percentile, whichever is lower) |Elevated (≥90th:<95th percentile or ≥ 120/80 mm Hg to <95th percentile, whichever is lower) (treated) |Stage 1 hypertension (≥95th:<95th percentile + 12 mm Hg, or 130/80:139/89 mm Hg, whichever is lower |Stage 1 hypertension (≥95th:<95th percentile + 12 mm Hg, or 130/80:139/89 mm Hg, whichever is lower (treated) |Stage 2 hypertension (≥95th percentile + 12 mm Hg, or ≥140/90 mm Hg, whichever is lower) |Stage 2 hypertension (≥95th percentile + 12 mm Hg, or ≥140/90 mm Hg, whichever is lower) (treated) |Systolic BP ≥ 160 or ≥95th percentile + 30 mm Hg systolic BP, whichever is lower and/or diastolic BP ≥ 100 or ≥ 95th percentile + 20 mm Hg diastolic BP'**
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
  /// **'Non-HDL cholesterol (mg/dL), starting no later than age 9:11y and earlier per clinician discretion'**
  String get txtCholesterolDialog;

  /// No description provided for @txtCholesterolDialogOptions.
  ///
  /// In en, this message translates to:
  /// **'< 170 mg/dl|170:199 mg/dl|≥ 200 mg/dl'**
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

  /// No description provided for @txtVegetalesVerdes.
  ///
  /// In en, this message translates to:
  /// **'Vegetales verdes'**
  String get txtVegetalesVerdes;

  /// No description provided for @txtVegetalesRojosNaranjas.
  ///
  /// In en, this message translates to:
  /// **'Vegetales rojos o naranjas'**
  String get txtVegetalesRojosNaranjas;

  /// No description provided for @txtLegumbres.
  ///
  /// In en, this message translates to:
  /// **'Legumbres'**
  String get txtLegumbres;

  /// No description provided for @txtTuberculosPapaBatataMandioca.
  ///
  /// In en, this message translates to:
  /// **'Tubérculos (papa, batata, mandioca)'**
  String get txtTuberculosPapaBatataMandioca;

  /// No description provided for @txtOtrosVegetales.
  ///
  /// In en, this message translates to:
  /// **'Otros vegetales'**
  String get txtOtrosVegetales;

  /// No description provided for @txtFrutas.
  ///
  /// In en, this message translates to:
  /// **'Frutas'**
  String get txtFrutas;

  /// No description provided for @txtPan.
  ///
  /// In en, this message translates to:
  /// **'Pan'**
  String get txtPan;

  /// No description provided for @txtPastasYMasaIntegrales.
  ///
  /// In en, this message translates to:
  /// **'Pastas y masas integrales: masa: pizza, tarta, empanada, canelon, masa de taco.'**
  String get txtPastasYMasaIntegrales;

  /// No description provided for @txtPastasYMasaRefinadasNoIntegrales.
  ///
  /// In en, this message translates to:
  /// **'Pastas y masas refinadas (No integrales)'**
  String get txtPastasYMasaRefinadasNoIntegrales;

  /// No description provided for @txtLacteosLecheYogurParcialmenteDescremados.
  ///
  /// In en, this message translates to:
  /// **'Lácteos (leche, yogur) parcialmente descremados'**
  String get txtLacteosLecheYogurParcialmenteDescremados;

  /// No description provided for @txtQuesosSemidescremadosUntablesOSemiSolidos.
  ///
  /// In en, this message translates to:
  /// **'Quesos semidescremados untables o semisólidos (port salut, muzzarella)'**
  String get txtQuesosSemidescremadosUntablesOSemiSolidos;

  /// No description provided for @txtCarnesRojasAveYHuevoPorDia.
  ///
  /// In en, this message translates to:
  /// **'Carnes rojas, ave y huevo por día'**
  String get txtCarnesRojasAveYHuevoPorDia;

  /// No description provided for @txtPescados.
  ///
  /// In en, this message translates to:
  /// **'Pescados'**
  String get txtPescados;

  /// No description provided for @txtFrutosSecosYSemillas.
  ///
  /// In en, this message translates to:
  /// **'Frutos secos y semillas'**
  String get txtFrutosSecosYSemillas;

  /// No description provided for @txtAceites.
  ///
  /// In en, this message translates to:
  /// **'Aceites'**
  String get txtAceites;

  /// No description provided for @txtOnePlatePerWeek.
  ///
  /// In en, this message translates to:
  /// **'1 pl per wk'**
  String get txtOnePlatePerWeek;

  /// No description provided for @txtHalfPlatePerWeek.
  ///
  /// In en, this message translates to:
  /// **'1/2 pl per wk'**
  String get txtHalfPlatePerWeek;

  /// No description provided for @txtLessThanHalfPlatePerWeek.
  ///
  /// In en, this message translates to:
  /// **'LT 1/2 pl per wk'**
  String get txtLessThanHalfPlatePerWeek;

  /// No description provided for @txtThreePlatesPerWeekOrOneSmallUnitDaily.
  ///
  /// In en, this message translates to:
  /// **'3 pls per wk or 1 sm u dy'**
  String get txtThreePlatesPerWeekOrOneSmallUnitDaily;

  /// No description provided for @txtLessThanOnePlatePerWeek.
  ///
  /// In en, this message translates to:
  /// **'LT 1 pl per wk'**
  String get txtLessThanOnePlatePerWeek;

  /// No description provided for @txtHalfPlatePerWeekOrTwoSmallMedallionsPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1/2 pl per wk or 2 sm medallions per wk'**
  String get txtHalfPlatePerWeekOrTwoSmallMedallionsPerWeek;

  /// No description provided for @txtQuarterPlatePerWeekOrOneSmallMedallionPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1/4 pl per wk or 1 sm medallion per wk'**
  String get txtQuarterPlatePerWeekOrOneSmallMedallionPerWeek;

  /// No description provided for @txtLessThanQuarterPlatePerWeekOrLessThanOneSmallMedallionPerWeek.
  ///
  /// In en, this message translates to:
  /// **'LT 1/4 pl per wk or LT 1 sm medallion per wk'**
  String get txtLessThanQuarterPlatePerWeekOrLessThanOneSmallMedallionPerWeek;

  /// No description provided for @txtHalfSmallUnitDailyOrQuarterPlateDailyOrThreeSmallUnitsPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1/2 sm u dy or 1/4 pl dy or 3 sm us per wk'**
  String get txtHalfSmallUnitDailyOrQuarterPlateDailyOrThreeSmallUnitsPerWeek;

  /// No description provided for @txtOneSmallUnitDailyOrHalfPlateDailyOrThreeMediumUnitsPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1 sm u dy or 1/2 pl dy or 3 med us per wk'**
  String get txtOneSmallUnitDailyOrHalfPlateDailyOrThreeMediumUnitsPerWeek;

  /// No description provided for @txtMoreThanOneSmallUnitDailyOrMoreThanHalfPlateDailyOrMoreThanThreeMediumUnitsPerWeek.
  ///
  /// In en, this message translates to:
  /// **'MT 1 sm u dy or MT 1/2 pl dy or MT 3 med us per wk'**
  String
      get txtMoreThanOneSmallUnitDailyOrMoreThanHalfPlateDailyOrMoreThanThreeMediumUnitsPerWeek;

  /// No description provided for @txtThreeMediumUnitsPerWeekOrOneThirdRawPlateDailyOrOneFourthCookedPlateDaily.
  ///
  /// In en, this message translates to:
  /// **'3 med us per wk or 1/3 raw pl dy or 1/4 cooked pl dy'**
  String
      get txtThreeMediumUnitsPerWeekOrOneThirdRawPlateDailyOrOneFourthCookedPlateDaily;

  /// No description provided for @txtOneMediumUnitPerWeekOrOneFourthRawPlateDailyOrOneFourthCookedPlateFourTimesPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1 med u per wk or 1/4 raw pl dy or 1/4 cooked pl 4 times/wk'**
  String
      get txtOneMediumUnitPerWeekOrOneFourthRawPlateDailyOrOneFourthCookedPlateFourTimesPerWeek;

  /// No description provided for @txtLessThanOneMediumUnitPerWeekOrLessThanOneFourthRawPlateDailyOrLessThanOneFourthCookedPlateFourTimesPerWeek.
  ///
  /// In en, this message translates to:
  /// **'LT 1 med u per wk or LT 1/4 raw pl dy or LT 1/4 cooked pl 4 times/wk'**
  String
      get txtLessThanOneMediumUnitPerWeekOrLessThanOneFourthRawPlateDailyOrLessThanOneFourthCookedPlateFourTimesPerWeek;

  /// No description provided for @txtOneMediumUnitDailyOrTwoSmallUnitsDaily.
  ///
  /// In en, this message translates to:
  /// **'1 med u dy or 2 sm us dy'**
  String get txtOneMediumUnitDailyOrTwoSmallUnitsDaily;

  /// No description provided for @txtOneSmallUnitDaily.
  ///
  /// In en, this message translates to:
  /// **'1 sm u dy'**
  String get txtOneSmallUnitDaily;

  /// No description provided for @txtLessThanOneSmallUnitDaily.
  ///
  /// In en, this message translates to:
  /// **'LT 1 sm u dy'**
  String get txtLessThanOneSmallUnitDaily;

  /// No description provided for @txtOneSliceOfBreadOrOneSmallMignonOrThreeWaterCrackers.
  ///
  /// In en, this message translates to:
  /// **'1 slice of bread or 1 sm mignon or 3 water crackers'**
  String get txtOneSliceOfBreadOrOneSmallMignonOrThreeWaterCrackers;

  /// No description provided for @txtTwoSlicesOfSandBreadOrTwoSmallMignonsOrSixWaterCrackers.
  ///
  /// In en, this message translates to:
  /// **'2 slices of sand bread or 2 sm mignons or 6 water crackers'**
  String get txtTwoSlicesOfSandBreadOrTwoSmallMignonsOrSixWaterCrackers;

  /// No description provided for @txtMoreThanTwoSlicesOfSandBreadOrMoreThanTwoSmallMignonsOrMoreThanSixWaterCrackers.
  ///
  /// In en, this message translates to:
  /// **'MT 2 slices of sand bread or MT 2 sm mignons or MT 6 water crackers'**
  String
      get txtMoreThanTwoSlicesOfSandBreadOrMoreThanTwoSmallMignonsOrMoreThanSixWaterCrackers;

  /// No description provided for @txtQuarterPlateDailyOrOneServingOfDoughDaily.
  ///
  /// In en, this message translates to:
  /// **'1/4 pl dy or 1 serv of dough dy'**
  String get txtQuarterPlateDailyOrOneServingOfDoughDaily;

  /// No description provided for @txtHalfPlateDailyOrTwoServingsOfDoughDaily.
  ///
  /// In en, this message translates to:
  /// **'1/2 pl dy or 2 servs of dough dy'**
  String get txtHalfPlateDailyOrTwoServingsOfDoughDaily;

  /// No description provided for @txtMoreThanHalfPlateDailyOrMoreThanTwoServingsOfDoughDaily.
  ///
  /// In en, this message translates to:
  /// **'MT 1/2 pl dy or MT 2 servs of dough dy'**
  String get txtMoreThanHalfPlateDailyOrMoreThanTwoServingsOfDoughDaily;

  /// No description provided for @txtHalfPlatePerDayOrTwoServingsOfDough.
  ///
  /// In en, this message translates to:
  /// **'1/2 pl per day or 2 servs of dough'**
  String get txtHalfPlatePerDayOrTwoServingsOfDough;

  /// No description provided for @txtMoreThanHalfPlatePerDayOrMoreThanTwoServingsOfDoughPerDay.
  ///
  /// In en, this message translates to:
  /// **'MT 1/2 pl per day or MT 2 servs of dough per day'**
  String get txtMoreThanHalfPlatePerDayOrMoreThanTwoServingsOfDoughPerDay;

  /// No description provided for @txtThreeQuartersCupBreakfastTypeDailyOrTwoCupsTeaTypeDaily.
  ///
  /// In en, this message translates to:
  /// **'3/4 cup breakfast type dy or 2 cups tea type dy'**
  String get txtThreeQuartersCupBreakfastTypeDailyOrTwoCupsTeaTypeDaily;

  /// No description provided for @txtHalfCupBreakfastTypeDailyOrOneCupTeaTypeDaily.
  ///
  /// In en, this message translates to:
  /// **'1/2 cup breakfast type dy or 1 cup tea type dy'**
  String get txtHalfCupBreakfastTypeDailyOrOneCupTeaTypeDaily;

  /// No description provided for @txtLessThanHalfCupBreakfastTypeDailyOrLessThanOneCupTeaTypeDaily.
  ///
  /// In en, this message translates to:
  /// **'LT 1/2 cup breakfast type dy or LT 1 cup tea type dy'**
  String get txtLessThanHalfCupBreakfastTypeDailyOrLessThanOneCupTeaTypeDaily;

  /// No description provided for @txtOneServingTheSizeOfSmallMatchboxOrSizeOfHalfSUBECardOrTwoTableSpoons.
  ///
  /// In en, this message translates to:
  /// **'1 serv the sz of a sm matchbox or sz of 1/2 SUBE card or 2 tbsp'**
  String
      get txtOneServingTheSizeOfSmallMatchboxOrSizeOfHalfSUBECardOrTwoTableSpoons;

  /// No description provided for @txtHalfServingTheSizeOfSmallMatchboxOrOneDieOrOneTableSpoon.
  ///
  /// In en, this message translates to:
  /// **'1/2 serv the sz of a sm matchbox or 1 die or 1 tbsp'**
  String get txtHalfServingTheSizeOfSmallMatchboxOrOneDieOrOneTableSpoon;

  /// No description provided for @txtLessThanHalfServingTheSizeOfSmallMatchboxOrLessThanOneDieOrLessThanOneTableSpoon.
  ///
  /// In en, this message translates to:
  /// **'LT 1/2 serv the sz of a sm matchbox or LT 1 die or LT 1 tbsp'**
  String
      get txtLessThanHalfServingTheSizeOfSmallMatchboxOrLessThanOneDieOrLessThanOneTableSpoon;

  /// No description provided for @txtHalfMediumSteakPerDayOrOneAndHalfEggsDailyOrOneMediumMincedMeat.
  ///
  /// In en, this message translates to:
  /// **'1/2 med steak per day or 1 and 1/2 eggs dy or 1 med minced meat'**
  String get txtHalfMediumSteakPerDayOrOneAndHalfEggsDailyOrOneMediumMincedMeat;

  /// No description provided for @txtOneMediumSteakDailyOrUpToTwoEggUnitsDailyOrOneServingTheSizeOfSliceOfVealPlusOneEggDaily.
  ///
  /// In en, this message translates to:
  /// **'1 med steak dy or up to 2 egg us dy or 1 serv the sz of a slice of veal + 1 egg dy'**
  String
      get txtOneMediumSteakDailyOrUpToTwoEggUnitsDailyOrOneServingTheSizeOfSliceOfVealPlusOneEggDaily;

  /// No description provided for @txtMoreThanOneMediumSteakDailyOrMoreThanTwoEggUnitsDailyOrMoreThanOneServingTheSizeOfSliceOfVealPlusOneEggDaily.
  ///
  /// In en, this message translates to:
  /// **'MT 1 med steak dy or MT 2 egg us dy or MT 1 serv the sz of a slice of veal + 1 egg dy'**
  String
      get txtMoreThanOneMediumSteakDailyOrMoreThanTwoEggUnitsDailyOrMoreThanOneServingTheSizeOfSliceOfVealPlusOneEggDaily;

  /// No description provided for @txtOneMediumServingPerWeekOrOneCanPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1 med serv per wk or 1 can per wk'**
  String get txtOneMediumServingPerWeekOrOneCanPerWeek;

  /// No description provided for @txtOneSmallServingPerWeekOrHalfCanPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1 sm serv per wk or 1/2 can per wk'**
  String get txtOneSmallServingPerWeekOrHalfCanPerWeek;

  /// No description provided for @txtLessThanOneSmallServingPerWeekOrLessThanHalfCanPerWeek.
  ///
  /// In en, this message translates to:
  /// **'LT 1 sm serv per wk or LT 1/2 can per wk'**
  String get txtLessThanOneSmallServingPerWeekOrLessThanHalfCanPerWeek;

  /// No description provided for @txtFourWalnutHalvesOrEightAlmondsOrOneTableSpoonOfSeedsOrPeanutsDaily.
  ///
  /// In en, this message translates to:
  /// **'4 walnut halves or 8 almonds or 1 tbsp of seeds or peanuts dy'**
  String
      get txtFourWalnutHalvesOrEightAlmondsOrOneTableSpoonOfSeedsOrPeanutsDaily;

  /// No description provided for @txtTwoWalnutHalvesOrFourAlmondsOrOneTeaspoonOfSeedsOrPeanutsDaily.
  ///
  /// In en, this message translates to:
  /// **'2 walnut halves or 4 almonds or 1 teaspoon of seeds or peanuts dy'**
  String get txtTwoWalnutHalvesOrFourAlmondsOrOneTeaspoonOfSeedsOrPeanutsDaily;

  /// No description provided for @txtLessThanTwoWalnutHalvesOrLessThanFourAlmondsOrLessThanOneTeaspoonOfSeedsOrPeanutsDaily.
  ///
  /// In en, this message translates to:
  /// **'LT 2 walnut halves or LT 4 almonds or LT 1 teaspoon of seeds or peanuts dy'**
  String
      get txtLessThanTwoWalnutHalvesOrLessThanFourAlmondsOrLessThanOneTeaspoonOfSeedsOrPeanutsDaily;

  /// No description provided for @txtTwoTableSpoonsDessertTypeDaily.
  ///
  /// In en, this message translates to:
  /// **'2 tbsp dessert type dy'**
  String get txtTwoTableSpoonsDessertTypeDaily;

  /// No description provided for @txtOneTableSpoonDessertTypeDaily.
  ///
  /// In en, this message translates to:
  /// **'1 tbsp dessert type dy'**
  String get txtOneTableSpoonDessertTypeDaily;

  /// No description provided for @txtLessThanOneTableSpoonDessertTypeDaily.
  ///
  /// In en, this message translates to:
  /// **'LT 1 tbsp dessert type dy'**
  String get txtLessThanOneTableSpoonDessertTypeDaily;

  /// No description provided for @txtOneAndHalfPlatePerWeek.
  ///
  /// In en, this message translates to:
  /// **'1 and 1/2 pl per wk'**
  String get txtOneAndHalfPlatePerWeek;

  /// No description provided for @txtFourPlatesPerWeek.
  ///
  /// In en, this message translates to:
  /// **'4 pls per wk'**
  String get txtFourPlatesPerWeek;

  /// No description provided for @txtTwoPlatesPerWeek.
  ///
  /// In en, this message translates to:
  /// **'2 pls per wk'**
  String get txtTwoPlatesPerWeek;

  /// No description provided for @txtLessThanTwoPlatesPerWeek.
  ///
  /// In en, this message translates to:
  /// **'LT 2 pls per wk'**
  String get txtLessThanTwoPlatesPerWeek;

  /// No description provided for @txtOnePlatePerWeekOrHalfPlatePlusOneMedallionPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1 pl per wk or 1/2 pl + 1 medallion per wk'**
  String get txtOnePlatePerWeekOrHalfPlatePlusOneMedallionPerWeek;

  /// No description provided for @txtHalfPlatePerWeekOrQuarterPlatePlusOneMedallionPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1/2 pl per wk or 1/4 pl + 1 medallion per wk'**
  String get txtHalfPlatePerWeekOrQuarterPlatePlusOneMedallionPerWeek;

  /// No description provided for @txtLessThanHalfPlatePerWeekOrQuarterPlatePlusOneMedallionPerWeek.
  ///
  /// In en, this message translates to:
  /// **'LT 1/2 pl per wk or 1/4 pl + 1 medallion per wk'**
  String get txtLessThanHalfPlatePerWeekOrQuarterPlatePlusOneMedallionPerWeek;

  /// No description provided for @txtOneThirdPlateDailyOrUpToThreeMediumUnitsPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1/3 pl dy or up to 3 med us per wk'**
  String get txtOneThirdPlateDailyOrUpToThreeMediumUnitsPerWeek;

  /// No description provided for @txtHalfPlateOrUpToFiveSmallUnitsPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1/2 pl or up to 5 sm us per wk'**
  String get txtHalfPlateOrUpToFiveSmallUnitsPerWeek;

  /// No description provided for @txtMoreThanHalfPlateOrMoreThanFiveSmallUnitsPerWeek.
  ///
  /// In en, this message translates to:
  /// **'MT 1/2 pl or MT 5 sm us per wk'**
  String get txtMoreThanHalfPlateOrMoreThanFiveSmallUnitsPerWeek;

  /// No description provided for @txtFourMediumUnitsPerWeekOrHalfRawPlateDailyOrQuarterCookedPlateDaily.
  ///
  /// In en, this message translates to:
  /// **'4 med us per wk or 1/2 raw pl dy or 1/4 cooked pl dy'**
  String
      get txtFourMediumUnitsPerWeekOrHalfRawPlateDailyOrQuarterCookedPlateDaily;

  /// No description provided for @txtTwoMediumUnitsPerWeekOrQuarterPlateDaily.
  ///
  /// In en, this message translates to:
  /// **'2 med us per wk or 1/4 pl dy'**
  String get txtTwoMediumUnitsPerWeekOrQuarterPlateDaily;

  /// No description provided for @txtLessThanTwoMediumUnitsPerWeekOrQuarterPlateDaily.
  ///
  /// In en, this message translates to:
  /// **'LT 2 med us per wk or 1/4 pl dy'**
  String get txtLessThanTwoMediumUnitsPerWeekOrQuarterPlateDaily;

  /// No description provided for @txtOneAndHalfLargeUnitPerDayOrTwoMediumUnitsPerDay.
  ///
  /// In en, this message translates to:
  /// **'1 and 1/2 large u per day or 2 med us per day'**
  String get txtOneAndHalfLargeUnitPerDayOrTwoMediumUnitsPerDay;

  /// No description provided for @txtOneMediumUnitPerDay.
  ///
  /// In en, this message translates to:
  /// **'1 med u per day'**
  String get txtOneMediumUnitPerDay;

  /// No description provided for @txtLessThanOneMediumUnitPerDay.
  ///
  /// In en, this message translates to:
  /// **'LT 1 med u per day'**
  String get txtLessThanOneMediumUnitPerDay;

  /// No description provided for @txtUpToTwoSlicesOfBreadPerDayOrTwoSmallMignonsOrSixWaterBiscuits.
  ///
  /// In en, this message translates to:
  /// **'up to 2 slices of bread per day or 2 sm mignons or 6 water biscuits'**
  String get txtUpToTwoSlicesOfBreadPerDayOrTwoSmallMignonsOrSixWaterBiscuits;

  /// No description provided for @txtThreeSlicesOfBreadPerDayOrThreeSmallMignonsOrNineWaterBiscuits.
  ///
  /// In en, this message translates to:
  /// **'3 slices of bread per day or 3 sm mignons or 9 water biscuits'**
  String get txtThreeSlicesOfBreadPerDayOrThreeSmallMignonsOrNineWaterBiscuits;

  /// No description provided for @txtMoreThanThreeSlicesOfBreadPerDayOrMoreThanThreeSmallMignonsOrMoreThanNineWaterBiscuits.
  ///
  /// In en, this message translates to:
  /// **'MT 3 slices of bread per day or MT 3 sm mignons or MT 9 water biscuits'**
  String
      get txtMoreThanThreeSlicesOfBreadPerDayOrMoreThanThreeSmallMignonsOrMoreThanNineWaterBiscuits;

  /// No description provided for @txtQuarterPlateOfWholeWheatPastaPerDayOrOnePortionOfDough.
  ///
  /// In en, this message translates to:
  /// **'1/4 pl of whole wheat pasta per day or 1 portion of dough'**
  String get txtQuarterPlateOfWholeWheatPastaPerDayOrOnePortionOfDough;

  /// No description provided for @txtHalfPlatePerDayOrTwoPortionsOfDough.
  ///
  /// In en, this message translates to:
  /// **'1/2 pl per day or 2 port of dough'**
  String get txtHalfPlatePerDayOrTwoPortionsOfDough;

  /// No description provided for @txtMoreThanHalfPlatePerDayOrTwoPortionsOfDough.
  ///
  /// In en, this message translates to:
  /// **'MT 1/2 pl per day or 2 port of dough'**
  String get txtMoreThanHalfPlatePerDayOrTwoPortionsOfDough;

  /// No description provided for @txtMoreThanHalfPlatePerDayOrMoreThanTwoPortionsOfDoughPerDay.
  ///
  /// In en, this message translates to:
  /// **'MT 1/2 pl per day or MT 2 port of dough per day'**
  String get txtMoreThanHalfPlatePerDayOrMoreThanTwoPortionsOfDoughPerDay;

  /// No description provided for @txtTwoTeacups.
  ///
  /// In en, this message translates to:
  /// **'2 teacups'**
  String get txtTwoTeacups;

  /// No description provided for @txtOneTeacupDaily.
  ///
  /// In en, this message translates to:
  /// **'1 teacup dy'**
  String get txtOneTeacupDaily;

  /// No description provided for @txtLessThanOneTeacupDaily.
  ///
  /// In en, this message translates to:
  /// **'LT 1 teacup dy'**
  String get txtLessThanOneTeacupDaily;

  /// No description provided for @txtOnePortionTheSizeOfSmallMatchboxOrHalfTheSizeOfSUBECardOrTwoTableSpoonsDaily.
  ///
  /// In en, this message translates to:
  /// **'1 port the sz of a sm matchbox or half the sz of a SUBE card or 2 tbsp dy'**
  String
      get txtOnePortionTheSizeOfSmallMatchboxOrHalfTheSizeOfSUBECardOrTwoTableSpoonsDaily;

  /// No description provided for @txtOnePortionTheSizeOfDiceOrOneTableSpoonDaily.
  ///
  /// In en, this message translates to:
  /// **'1 port, the sz of a dice or 1 tbsp dy'**
  String get txtOnePortionTheSizeOfDiceOrOneTableSpoonDaily;

  /// No description provided for @txtLessThanOnePortionTheSizeOfSmallMatchboxOrLessThanOneDieOrLessThanOneTableSpoon.
  ///
  /// In en, this message translates to:
  /// **'LT 1 port the sz of a sm matchbox or LT 1 die or LT 1 tbsp'**
  String
      get txtLessThanOnePortionTheSizeOfSmallMatchboxOrLessThanOneDieOrLessThanOneTableSpoon;

  /// No description provided for @txtOneSmallPortionWithoutWasteDailyOrUpToTwoEggUnitsDailyOrOnePortionTheSizeOfSliceOfVealPlusOneEggDaily.
  ///
  /// In en, this message translates to:
  /// **'1 sm port without waste dy or up to 2 egg us dy or 1 port the sz of a slice of veal + 1 egg dy'**
  String
      get txtOneSmallPortionWithoutWasteDailyOrUpToTwoEggUnitsDailyOrOnePortionTheSizeOfSliceOfVealPlusOneEggDaily;

  /// No description provided for @txtTwoSmallPortionsWithoutWasteDailyOrUpToFourEggUnitsDailyOrOneSmallPortionPlusTwoEggUnits.
  ///
  /// In en, this message translates to:
  /// **'2 sm ports without waste dy or up to 4 egg us dy or 1 sm port + 2 egg us'**
  String
      get txtTwoSmallPortionsWithoutWasteDailyOrUpToFourEggUnitsDailyOrOneSmallPortionPlusTwoEggUnits;

  /// No description provided for @txtMoreThanTwoSmallPortionsWithoutWasteDailyOrMoreThanFourEggUnitsDailyOrMoreThanOneSmallPortionPlusTwoEggUnits.
  ///
  /// In en, this message translates to:
  /// **'MT 2 sm ports without waste dy or MT 4 egg us dy or MT 1 sm port + 2 egg us'**
  String
      get txtMoreThanTwoSmallPortionsWithoutWasteDailyOrMoreThanFourEggUnitsDailyOrMoreThanOneSmallPortionPlusTwoEggUnits;

  /// No description provided for @txtTwoMediumPortionsOrTwoCansPerWeek.
  ///
  /// In en, this message translates to:
  /// **'2 med port or 2 cans per wk'**
  String get txtTwoMediumPortionsOrTwoCansPerWeek;

  /// No description provided for @txtOneMediumPortionOrOneCanPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1 med portion or 1 can per wk'**
  String get txtOneMediumPortionOrOneCanPerWeek;

  /// No description provided for @txtLessThanOneMediumPortionOrLessThanOneCanPerWeek.
  ///
  /// In en, this message translates to:
  /// **'LT 1 med portion or 1 can per wk'**
  String get txtLessThanOneMediumPortionOrLessThanOneCanPerWeek;

  /// No description provided for @txtEightWalnutHalvesOrFifteenAlmondsOrTwoDessertTableSpoonsOfSeedsOrPeanutsPerDay.
  ///
  /// In en, this message translates to:
  /// **'8 walnut halves or 15 almonds or 2 dessert tbsp of seeds or peanuts per day'**
  String
      get txtEightWalnutHalvesOrFifteenAlmondsOrTwoDessertTableSpoonsOfSeedsOrPeanutsPerDay;

  /// No description provided for @txtFourWalnutHalvesOrEightAlmondsOrOneTableSpoonDailyOfSeedsOrPeanuts.
  ///
  /// In en, this message translates to:
  /// **'4 walnut halves or 8 almonds or 1 tbsp dy of seeds or peanuts'**
  String
      get txtFourWalnutHalvesOrEightAlmondsOrOneTableSpoonDailyOfSeedsOrPeanuts;

  /// No description provided for @txtLessThanFourWalnutHalvesOrLessThanEightAlmondsOrLessThanOneTableSpoonDailyOfSeedsOrPeanuts.
  ///
  /// In en, this message translates to:
  /// **'LT 4 walnut halves or LT 8 almonds or LT 1 tbsp dy of seeds or peanuts'**
  String
      get txtLessThanFourWalnutHalvesOrLessThanEightAlmondsOrLessThanOneTableSpoonDailyOfSeedsOrPeanuts;

  /// No description provided for @txtTwoTableSpoonsDaily.
  ///
  /// In en, this message translates to:
  /// **'2 tbsp dy'**
  String get txtTwoTableSpoonsDaily;

  /// No description provided for @txtOneTableSpoonDaily.
  ///
  /// In en, this message translates to:
  /// **'1 tbsp dy'**
  String get txtOneTableSpoonDaily;

  /// No description provided for @txtLessThanOneTableSpoonDaily.
  ///
  /// In en, this message translates to:
  /// **'LT 1 tbsp dy'**
  String get txtLessThanOneTableSpoonDaily;

  /// No description provided for @txtOneAndHalfDishPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1 and 1/2 dish per wk'**
  String get txtOneAndHalfDishPerWeek;

  /// No description provided for @txtOneDishPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1 dish per wk'**
  String get txtOneDishPerWeek;

  /// No description provided for @txtLessThanOneDishPerWeek.
  ///
  /// In en, this message translates to:
  /// **'LT 1 dish per wk'**
  String get txtLessThanOneDishPerWeek;

  /// No description provided for @txtFiveDishesPerWeek.
  ///
  /// In en, this message translates to:
  /// **'5 dishes per wk'**
  String get txtFiveDishesPerWeek;

  /// No description provided for @txtThreeDishesPerWeek.
  ///
  /// In en, this message translates to:
  /// **'3 dishes per wk'**
  String get txtThreeDishesPerWeek;

  /// No description provided for @txtLessThanThreeDishesPerWeek.
  ///
  /// In en, this message translates to:
  /// **'LT 3 dishes per wk'**
  String get txtLessThanThreeDishesPerWeek;

  /// No description provided for @txtOneAndHalfDishPerWeekOrOneDishPlusOneMedallionPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1 and 1/2 dish per wk or 1 dish + 1 medallion per wk'**
  String get txtOneAndHalfDishPerWeekOrOneDishPlusOneMedallionPerWeek;

  /// No description provided for @txtOneDishPerWeekOrHalfDishPlusOneMedallionPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1 dish per wk or 1/2 dish + 1 medallion per wk'**
  String get txtOneDishPerWeekOrHalfDishPlusOneMedallionPerWeek;

  /// No description provided for @txtLessThanOneDishPerWeekOrHalfDishPlusOneMedallionPerWeek.
  ///
  /// In en, this message translates to:
  /// **'LT 1 dish per wk or 1/2 dish + 1 medallion per wk'**
  String get txtLessThanOneDishPerWeekOrHalfDishPlusOneMedallionPerWeek;

  /// No description provided for @txtHalfDishDailyOrUpToFiveSmallUnitsPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1/2 dish dy or up to 5 sm us per wk'**
  String get txtHalfDishDailyOrUpToFiveSmallUnitsPerWeek;

  /// No description provided for @txtThreeQuartersDishDailyOrSmallUnitEveryDay.
  ///
  /// In en, this message translates to:
  /// **'3/4 dish dy or sm u every day'**
  String get txtThreeQuartersDishDailyOrSmallUnitEveryDay;

  /// No description provided for @txtMoreThanThreeQuartersDishDailyOrSmallUnitEveryDay.
  ///
  /// In en, this message translates to:
  /// **'MT 3/4 dish dy or sm u every day'**
  String get txtMoreThanThreeQuartersDishDailyOrSmallUnitEveryDay;

  /// No description provided for @txtFiveMediumUnitsPerWeekOrHalfRawDishDailyOrQuarterCookedDishDaily.
  ///
  /// In en, this message translates to:
  /// **'5 med us per wk or 1/2 raw dish dy or 1/4 cooked dish dy'**
  String
      get txtFiveMediumUnitsPerWeekOrHalfRawDishDailyOrQuarterCookedDishDaily;

  /// No description provided for @txtTwoAndHalfMediumUnitsPerWeekOrOneThirdRawDishDailyOrQuarterCookedDish.
  ///
  /// In en, this message translates to:
  /// **'2 and 1/2 med us per wk or 1/3 raw dish dy or 1/4 cooked dish'**
  String
      get txtTwoAndHalfMediumUnitsPerWeekOrOneThirdRawDishDailyOrQuarterCookedDish;

  /// No description provided for @txtLessThanTwoAndHalfMediumUnitsPerWeekOrLessThanOneThirdRawDishDailyOrLessThanQuarterCookedDish.
  ///
  /// In en, this message translates to:
  /// **'LT 2 and 1/2 med us per wk or 1/3 raw dish dy or 1/4 cooked dish'**
  String
      get txtLessThanTwoAndHalfMediumUnitsPerWeekOrLessThanOneThirdRawDishDailyOrLessThanQuarterCookedDish;

  /// No description provided for @txtHalfDishOfPastaPerDayOrTwoServingsOfDoughPerDay.
  ///
  /// In en, this message translates to:
  /// **'1/2 dish of pasta per day or 2 servs of dough per day'**
  String get txtHalfDishOfPastaPerDayOrTwoServingsOfDoughPerDay;

  /// No description provided for @txtThreeQuartersDishPerDayOrTwoServingsOfDoughPerDay.
  ///
  /// In en, this message translates to:
  /// **'3/4 dish per day or 2 servs of dough per day'**
  String get txtThreeQuartersDishPerDayOrTwoServingsOfDoughPerDay;

  /// No description provided for @txtMoreThanThreeQuartersDishPerDayOrMoreThanTwoServingsPerDay.
  ///
  /// In en, this message translates to:
  /// **'MT 3/4 dish per day or MT 2 servs per day'**
  String get txtMoreThanThreeQuartersDishPerDayOrMoreThanTwoServingsPerDay;

  /// No description provided for @txtHalfDishPerDayOrTwoServingsOfDoughPerDay.
  ///
  /// In en, this message translates to:
  /// **'1/2 dish per day or 2 servs of dough per day'**
  String get txtHalfDishPerDayOrTwoServingsOfDoughPerDay;

  /// No description provided for @txtThreeQuartersDishPerDayOrThreeServingsOfDoughPerDay.
  ///
  /// In en, this message translates to:
  /// **'3/4 dish per day or 3 servs of dough per day'**
  String get txtThreeQuartersDishPerDayOrThreeServingsOfDoughPerDay;

  /// No description provided for @txtMoreThanThreeQuartersDishPerDayOrMoreThanThreeServingsOfDoughPerDay.
  ///
  /// In en, this message translates to:
  /// **'MT 3/4 dish per day or MT 3 servs of dough per day'**
  String
      get txtMoreThanThreeQuartersDishPerDayOrMoreThanThreeServingsOfDoughPerDay;

  /// No description provided for @txtTwoBreakfastCupSizeDaily.
  ///
  /// In en, this message translates to:
  /// **'2 breakfast cup sz dy'**
  String get txtTwoBreakfastCupSizeDaily;

  /// No description provided for @txtOneBreakfastCupSizeDaily.
  ///
  /// In en, this message translates to:
  /// **'1 breakfast cup sz dy'**
  String get txtOneBreakfastCupSizeDaily;

  /// No description provided for @txtLessThanOneBreakfastCupSizeDaily.
  ///
  /// In en, this message translates to:
  /// **'LT 1 breakfast cup sz dy'**
  String get txtLessThanOneBreakfastCupSizeDaily;

  /// No description provided for @txtOnePortionTheSizeOfSmallMatchboxOrHalfSUBECardOrTwoTableSpoonsDaily.
  ///
  /// In en, this message translates to:
  /// **'1 port, the sz of a sm matchbox or 1/2 SUBE card or 2 tbsp dy'**
  String
      get txtOnePortionTheSizeOfSmallMatchboxOrHalfSUBECardOrTwoTableSpoonsDaily;

  /// No description provided for @txtOneSmallPortionWithoutWasteDailyOrUpToTwoEggUnitsOrHalfSmallPortionPlusOneEgg.
  ///
  /// In en, this message translates to:
  /// **'1 sm port without waste dy or up to 2 egg us or 1/2 sm port + 1 egg'**
  String
      get txtOneSmallPortionWithoutWasteDailyOrUpToTwoEggUnitsOrHalfSmallPortionPlusOneEgg;

  /// No description provided for @txtTenWalnutHalvesOrTwentyAlmondsOrTwoDessertTableSpoonsOfSeedsOrPeanutsPerDay.
  ///
  /// In en, this message translates to:
  /// **'10 walnut halves or 20 almonds or 2 tbsp per day of seeds or peanuts'**
  String
      get txtTenWalnutHalvesOrTwentyAlmondsOrTwoDessertTableSpoonsOfSeedsOrPeanutsPerDay;

  /// No description provided for @txtFiveWalnutHalvesOrTenAlmondsOrOneTableSpoonDailyOfSeedsOrPeanuts.
  ///
  /// In en, this message translates to:
  /// **'5 walnut halves or 10 almonds or 1 tbsp dy of seeds or peanuts'**
  String
      get txtFiveWalnutHalvesOrTenAlmondsOrOneTableSpoonDailyOfSeedsOrPeanuts;

  /// No description provided for @txtLessThanFiveWalnutHalvesOrLessThanTenAlmondsOrLessThanOneTableSpoonDailyOfSeedsOrPeanuts.
  ///
  /// In en, this message translates to:
  /// **'LT 5 walnut halves or 10 almonds or 1 tbsp dy of seeds or peanuts'**
  String
      get txtLessThanFiveWalnutHalvesOrLessThanTenAlmondsOrLessThanOneTableSpoonDailyOfSeedsOrPeanuts;

  /// No description provided for @txtTwoTableSpoonsPerDay.
  ///
  /// In en, this message translates to:
  /// **'2 tbsp per day'**
  String get txtTwoTableSpoonsPerDay;

  /// No description provided for @txtOneTableSpoonPerDay.
  ///
  /// In en, this message translates to:
  /// **'1 tbsp per day'**
  String get txtOneTableSpoonPerDay;

  /// No description provided for @txtLessThanOneTableSpoonPerDay.
  ///
  /// In en, this message translates to:
  /// **'LT 1 tbsp per day'**
  String get txtLessThanOneTableSpoonPerDay;

  /// No description provided for @txtThreePlatesPerWeekOrOneSmallUnitPerDay.
  ///
  /// In en, this message translates to:
  /// **'3 pls per wk or 1 sm u per day'**
  String get txtThreePlatesPerWeekOrOneSmallUnitPerDay;

  /// No description provided for @txtOneAndHalfPlatesPerWeekOrOneSmallUnitEveryOtherDay.
  ///
  /// In en, this message translates to:
  /// **'1 and 1/2 pls per wk or 1 sm u every other day'**
  String get txtOneAndHalfPlatesPerWeekOrOneSmallUnitEveryOtherDay;

  /// No description provided for @txtLessThanOneAndHalfPlatesPerWeekOrLessThanOneSmallUnitEveryOtherDay.
  ///
  /// In en, this message translates to:
  /// **'LT 1 and 1/2 pls per wk or LT 1 sm u every other day'**
  String
      get txtLessThanOneAndHalfPlatesPerWeekOrLessThanOneSmallUnitEveryOtherDay;

  /// No description provided for @txtHalfSmallUnitPerDayOrQuarterPlatePerDayOrThreeSmallUnitsPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1/2 sm u per day or 1/4 pl per day or 3 sm us per wk'**
  String get txtHalfSmallUnitPerDayOrQuarterPlatePerDayOrThreeSmallUnitsPerWeek;

  /// No description provided for @txtOneSmallUnitPerDayOrHalfPlatePerDayOrThreeMediumUnitsPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1 sm u per day or 1/2 pl per day or 3 med us per wk'**
  String get txtOneSmallUnitPerDayOrHalfPlatePerDayOrThreeMediumUnitsPerWeek;

  /// No description provided for @txtMoreThanOneSmallUnitPerDayOrMoreThanHalfPlatePerDayOrMoreThanThreeMediumUnitsPerWeek.
  ///
  /// In en, this message translates to:
  /// **'MT 1 sm u per day or MT 1/2 pl per day or MT 3 med us per wk'**
  String
      get txtMoreThanOneSmallUnitPerDayOrMoreThanHalfPlatePerDayOrMoreThanThreeMediumUnitsPerWeek;

  /// No description provided for @txtThreeMediumUnitsPerWeekOrOneThirdRawPlateOrQuarterCookedPlate.
  ///
  /// In en, this message translates to:
  /// **'3 med us per wk or 1/3 raw pl or 1/4 cooked pl'**
  String get txtThreeMediumUnitsPerWeekOrOneThirdRawPlateOrQuarterCookedPlate;

  /// No description provided for @txtOneMediumUnitPerWeekOrQuarterRawPlatePerDayOrQuarterPlateFourTimesPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1 med u per wk or 1/4 raw pl per day or 1/4 pl 4 times/wk'**
  String
      get txtOneMediumUnitPerWeekOrQuarterRawPlatePerDayOrQuarterPlateFourTimesPerWeek;

  /// No description provided for @txtLessThanOneMediumUnitPerWeekOrQuarterRawPlatePerDayOrQuarterPlateFourTimesPerWeek.
  ///
  /// In en, this message translates to:
  /// **'LT 1 med u per wk or 1/4 raw pl per day or 1/4 pl 4 times/wk'**
  String
      get txtLessThanOneMediumUnitPerWeekOrQuarterRawPlatePerDayOrQuarterPlateFourTimesPerWeek;

  /// No description provided for @txtTwoMediumUnitsPerDay.
  ///
  /// In en, this message translates to:
  /// **'2 med us per day'**
  String get txtTwoMediumUnitsPerDay;

  /// No description provided for @txtUpToOneSlicePerDayOrOneSmallMignonPerDay.
  ///
  /// In en, this message translates to:
  /// **'up to 1 slice per day or 1 sm mignon per day'**
  String get txtUpToOneSlicePerDayOrOneSmallMignonPerDay;

  /// No description provided for @txtTwoSlicesPerDayOrTwoSmallMignonsPerDay.
  ///
  /// In en, this message translates to:
  /// **'2 slices per day or 2 sm mignons per day'**
  String get txtTwoSlicesPerDayOrTwoSmallMignonsPerDay;

  /// No description provided for @txtMoreThanTwoSlicesPerDayOrMoreThanTwoSmallMignonsPerDay.
  ///
  /// In en, this message translates to:
  /// **'MT 2 slices per day or MT 2 sm mignons per day'**
  String get txtMoreThanTwoSlicesPerDayOrMoreThanTwoSmallMignonsPerDay;

  /// No description provided for @txtQuarterPlatePerDayOfWholeWheatPastaOrOneServingOfDoughPerDay.
  ///
  /// In en, this message translates to:
  /// **'1/4 pl per day of whole wheat pasta or 1 serv of dough per day'**
  String get txtQuarterPlatePerDayOfWholeWheatPastaOrOneServingOfDoughPerDay;

  /// No description provided for @txtHalfPlatePerDayOrTwoServingsOfDoughPerDay.
  ///
  /// In en, this message translates to:
  /// **'1/2 pl per day or 2 servs of dough per day'**
  String get txtHalfPlatePerDayOrTwoServingsOfDoughPerDay;

  /// No description provided for @txtMoreThanHalfPlatePerDayOrMoreThanTwoServingsPerDay.
  ///
  /// In en, this message translates to:
  /// **'MT 1/2 pl per day or MT 2 servs per day'**
  String get txtMoreThanHalfPlatePerDayOrMoreThanTwoServingsPerDay;

  /// No description provided for @txtThreeQuartersCupForBreakfastDailyOrTwoTeaCupsDaily.
  ///
  /// In en, this message translates to:
  /// **'3/4 cup for breakfast dy or 2 tea cups dy'**
  String get txtThreeQuartersCupForBreakfastDailyOrTwoTeaCupsDaily;

  /// No description provided for @txtHalfCupForBreakfastOrOneTeaCupDaily.
  ///
  /// In en, this message translates to:
  /// **'1/2 cup for breakfast or 1 tea cup dy'**
  String get txtHalfCupForBreakfastOrOneTeaCupDaily;

  /// No description provided for @txtLessThanHalfCupForBreakfastOrLessThanOneTeaCup.
  ///
  /// In en, this message translates to:
  /// **'LT 1/2 cup for breakfast or LT 1 tea cup'**
  String get txtLessThanHalfCupForBreakfastOrLessThanOneTeaCup;

  /// No description provided for @txtOnePortionTheSizeOfSmallMatchboxOrHalfSUBECardOrTwoTableSpoons.
  ///
  /// In en, this message translates to:
  /// **'1 portion the sz of a sm matchbox or 1/2 SUBE card or 2 tbsp'**
  String get txtOnePortionTheSizeOfSmallMatchboxOrHalfSUBECardOrTwoTableSpoons;

  /// No description provided for @txtOnePortionTheSizeOfADie.
  ///
  /// In en, this message translates to:
  /// **'1 portion the sz of a die'**
  String get txtOnePortionTheSizeOfADie;

  /// No description provided for @txtLessThanOnePortionTheSizeOfADie.
  ///
  /// In en, this message translates to:
  /// **'LT 1 portion the sz of a die'**
  String get txtLessThanOnePortionTheSizeOfADie;

  /// No description provided for @txtOneSmallPortionWithoutWasteFiveTimesPerWeekOrHalfSmallPortionPlusOneEggDaily.
  ///
  /// In en, this message translates to:
  /// **'1 sm port without waste 5 times/wk or 1/2 sm port + 1 egg dy'**
  String
      get txtOneSmallPortionWithoutWasteFiveTimesPerWeekOrHalfSmallPortionPlusOneEggDaily;

  /// No description provided for @txtOneMediumPortionWithoutWasteDailyOrOneSmallPortionPlusOneEggDaily.
  ///
  /// In en, this message translates to:
  /// **'1 med port without waste dy or 1 sm port + 1 egg dy'**
  String
      get txtOneMediumPortionWithoutWasteDailyOrOneSmallPortionPlusOneEggDaily;

  /// No description provided for @txtMoreThanOneMediumPortionWithoutWasteDailyOrMoreThanOneSmallPortionPlusOneEggDaily.
  ///
  /// In en, this message translates to:
  /// **'MT 1 med port without waste dy or MT 1 sm port + 1 egg dy'**
  String
      get txtMoreThanOneMediumPortionWithoutWasteDailyOrMoreThanOneSmallPortionPlusOneEggDaily;

  /// No description provided for @txtTwoSmallPortionsPerWeekOrOneAndHalfCansPerWeek.
  ///
  /// In en, this message translates to:
  /// **'2 sm port per wk or 1 and 1/2 cans/wk'**
  String get txtTwoSmallPortionsPerWeekOrOneAndHalfCansPerWeek;

  /// No description provided for @txtOneSmallPortionPerWeekOrOneCanPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1 sm portion per wk or 1 can/wk'**
  String get txtOneSmallPortionPerWeekOrOneCanPerWeek;

  /// No description provided for @txtLessThanOneSmallPortionPerWeekOrLessThanOneCanPerWeek.
  ///
  /// In en, this message translates to:
  /// **'LT 1 sm portion per wk or 1 can/wk'**
  String get txtLessThanOneSmallPortionPerWeekOrLessThanOneCanPerWeek;

  /// No description provided for @txtSixWalnutHalvesOrTenAlmondsOrOneTableSpoonDailyOfSeedsOrPeanuts.
  ///
  /// In en, this message translates to:
  /// **'6 walnut halves or 10 almonds or 1 tbsp dy of seeds or peanuts'**
  String get txtSixWalnutHalvesOrTenAlmondsOrOneTableSpoonDailyOfSeedsOrPeanuts;

  /// No description provided for @txtThreeWalnutHalvesOrFiveAlmondsOrHalfTableSpoonDailyOfSeedsOrPeanuts.
  ///
  /// In en, this message translates to:
  /// **'3 walnut halves or 5 almonds or 1/2 tbsp dy of seeds or peanuts'**
  String
      get txtThreeWalnutHalvesOrFiveAlmondsOrHalfTableSpoonDailyOfSeedsOrPeanuts;

  /// No description provided for @txtLessThanThreeWalnutHalvesOrLessThanFiveAlmondsOrLessThanHalfTableSpoonDailyOfSeedsOrPeanuts.
  ///
  /// In en, this message translates to:
  /// **'LT 3 walnut halves or 5 almonds or 1/2 tbsp dy of seeds or peanuts'**
  String
      get txtLessThanThreeWalnutHalvesOrLessThanFiveAlmondsOrLessThanHalfTableSpoonDailyOfSeedsOrPeanuts;

  /// No description provided for @txtTwoDessertSpoonsPerDay.
  ///
  /// In en, this message translates to:
  /// **'2 dessert spoons per day'**
  String get txtTwoDessertSpoonsPerDay;

  /// No description provided for @txtOneDessertSpoonPerDay.
  ///
  /// In en, this message translates to:
  /// **'1 dessert spoon per day'**
  String get txtOneDessertSpoonPerDay;

  /// No description provided for @txtLessThanOneDessertSpoonPerDay.
  ///
  /// In en, this message translates to:
  /// **'LT 1 dessert spoon per day'**
  String get txtLessThanOneDessertSpoonPerDay;

  /// No description provided for @txtOneAndHalfPlatesPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1 and 1/2 pls per wk'**
  String get txtOneAndHalfPlatesPerWeek;

  /// No description provided for @txtFiveAndHalfPlatesPerWeekOrOneMediumUnitPerDayOrThreeQuartersPlatePerDay.
  ///
  /// In en, this message translates to:
  /// **'5 and 1/2 pls per wk or 1 med u per day or 3/4 pl per day'**
  String
      get txtFiveAndHalfPlatesPerWeekOrOneMediumUnitPerDayOrThreeQuartersPlatePerDay;

  /// No description provided for @txtThreePlatesPerWeekOrOneSmallUnitPerDayOrOneThirdPlatePerDay.
  ///
  /// In en, this message translates to:
  /// **'3 pls per wk or 1 sm u per day or 1/3 pl per day'**
  String get txtThreePlatesPerWeekOrOneSmallUnitPerDayOrOneThirdPlatePerDay;

  /// No description provided for @txtLessThanThreePlatesPerWeekOrLessThanOneDailyUnitOrLessThanOneThirdPlatePerDay.
  ///
  /// In en, this message translates to:
  /// **'LT 3 pls per wk or LT 1 dy u or LT 1/3 pl per day'**
  String
      get txtLessThanThreePlatesPerWeekOrLessThanOneDailyUnitOrLessThanOneThirdPlatePerDay;

  /// No description provided for @txtOneAndHalfPlatesPerWeekOrHalfPlateThreeTimesPerWeekOrOneMedallionPerDay.
  ///
  /// In en, this message translates to:
  /// **'1 and 1/2 pls per wk or 1/2 pl 3 times per wk or 1 medallion per day'**
  String
      get txtOneAndHalfPlatesPerWeekOrHalfPlateThreeTimesPerWeekOrOneMedallionPerDay;

  /// No description provided for @txtOnePlatePerWeekOrHalfPlatePerWeekOrOneMedallionThreeTimesPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1 pl per wk or 1/2 pl per wk or 1 medallion 3 times per wk'**
  String
      get txtOnePlatePerWeekOrHalfPlatePerWeekOrOneMedallionThreeTimesPerWeek;

  /// No description provided for @txtLessThanOnePlatePerWeekOrLessThanHalfPlatePerWeekOrLessThanOneMedallionThreeTimesPerWeek.
  ///
  /// In en, this message translates to:
  /// **'LT 1 pl per wk or LT 1/2 pl per wk or LT 1 medallion 3 times per wk'**
  String
      get txtLessThanOnePlatePerWeekOrLessThanHalfPlatePerWeekOrLessThanOneMedallionThreeTimesPerWeek;

  /// No description provided for @txtOneSmallUnitPerDayOrThreeMediumUnitsPerWeekOrOneThirdPlatePerDay.
  ///
  /// In en, this message translates to:
  /// **'1 sm u per day or 3 med us per wk or 1/3 pl per day'**
  String
      get txtOneSmallUnitPerDayOrThreeMediumUnitsPerWeekOrOneThirdPlatePerDay;

  /// No description provided for @txtOneMediumUnitPerDayOrThreeLargeUnitsPerWeekOrThreeQuartersPlatePerDay.
  ///
  /// In en, this message translates to:
  /// **'1 med u per day or 3 large us per wk or 3/4 pl per day'**
  String
      get txtOneMediumUnitPerDayOrThreeLargeUnitsPerWeekOrThreeQuartersPlatePerDay;

  /// No description provided for @txtMoreThanOneMediumUnitPerDayOrMoreThanThreeLargeUnitsPerWeekOrMoreThanThreeQuartersPlatePerDay.
  ///
  /// In en, this message translates to:
  /// **'MT 1 med u per day or MT 3 large us per wk or MT 3/4 pl per day'**
  String
      get txtMoreThanOneMediumUnitPerDayOrMoreThanThreeLargeUnitsPerWeekOrMoreThanThreeQuartersPlatePerDay;

  /// No description provided for @txtFiveMediumUnitsPerWeekOrHalfRawPlateDailyOrQuarterCookedPlateDaily.
  ///
  /// In en, this message translates to:
  /// **'5 med us per wk or 1/2 raw pl dy or 1/4 cooked pl dy'**
  String
      get txtFiveMediumUnitsPerWeekOrHalfRawPlateDailyOrQuarterCookedPlateDaily;

  /// No description provided for @txtTwoAndHalfMediumUnitsPerWeekOrOneThirdRawPlateDailyOrQuarterCookedPlate.
  ///
  /// In en, this message translates to:
  /// **'2 1/2 med us per wk or 1/3 raw pl dy or 1/4 cooked pl'**
  String
      get txtTwoAndHalfMediumUnitsPerWeekOrOneThirdRawPlateDailyOrQuarterCookedPlate;

  /// No description provided for @txtLessThanTwoAndHalfMediumUnitsPerWeekOrLessThanOneThirdRawPlateDailyOrLessThanQuarterCookedPlate.
  ///
  /// In en, this message translates to:
  /// **'LT 2 1/2 med us per wk or LT 1/3 raw pl dy or LT 1/4 cooked pl'**
  String
      get txtLessThanTwoAndHalfMediumUnitsPerWeekOrLessThanOneThirdRawPlateDailyOrLessThanQuarterCookedPlate;

  /// No description provided for @txtOneAndHalfLargeUnitPerDayOrTwoMediumUnitsPerDayOrThreeSmallUnits.
  ///
  /// In en, this message translates to:
  /// **'1 1/2 large u per day or 2 med us per day or 3 sm us'**
  String
      get txtOneAndHalfLargeUnitPerDayOrTwoMediumUnitsPerDayOrThreeSmallUnits;

  /// No description provided for @txtOneMediumUnitPerDayOrTwoSmallUnits.
  ///
  /// In en, this message translates to:
  /// **'1 med u per day or 2 sm us'**
  String get txtOneMediumUnitPerDayOrTwoSmallUnits;

  /// No description provided for @txtLessThanOneMediumUnitPerDayOrLessThanTwoSmallUnitsPerDay.
  ///
  /// In en, this message translates to:
  /// **'LT 1 med u per day or LT 2 sm us per day'**
  String get txtLessThanOneMediumUnitPerDayOrLessThanTwoSmallUnitsPerDay;

  /// No description provided for @txtUpToTwoMoldTypeSlicesPerDayOrTwoSmallMignonsPerDay.
  ///
  /// In en, this message translates to:
  /// **'up to 2 mold type slices per day or 2 sm mignons per day'**
  String get txtUpToTwoMoldTypeSlicesPerDayOrTwoSmallMignonsPerDay;

  /// No description provided for @txtThreeMoldTypeSlicesPerDayOrThreeSmallMignonsPerDay.
  ///
  /// In en, this message translates to:
  /// **'3 mold type slices per day or 3 sm mignons per day'**
  String get txtThreeMoldTypeSlicesPerDayOrThreeSmallMignonsPerDay;

  /// No description provided for @txtMoreThanThreeMoldTypeSlicesPerDayOrMoreThanThreeSmallMignonsPerDay.
  ///
  /// In en, this message translates to:
  /// **'MT 3 mold type slices per day or MT 3 sm mignons per day'**
  String
      get txtMoreThanThreeMoldTypeSlicesPerDayOrMoreThanThreeSmallMignonsPerDay;

  /// No description provided for @txtQuarterPlateOfWholeWheatPastaPerDayOrOneServingOfDough.
  ///
  /// In en, this message translates to:
  /// **'1/4 pl of whole wheat pasta per day or 1 serv of dough'**
  String get txtQuarterPlateOfWholeWheatPastaPerDayOrOneServingOfDough;

  /// No description provided for @txtTwoBreakfastTypeCups.
  ///
  /// In en, this message translates to:
  /// **'2 breakfast type cups'**
  String get txtTwoBreakfastTypeCups;

  /// No description provided for @txtOneBreakfastTypeCup.
  ///
  /// In en, this message translates to:
  /// **'1 breakfast type cup'**
  String get txtOneBreakfastTypeCup;

  /// No description provided for @txtLessThanOneBreakfastTypeCup.
  ///
  /// In en, this message translates to:
  /// **'LT 1 breakfast type cup'**
  String get txtLessThanOneBreakfastTypeCup;

  /// No description provided for @txtOneSmallMatchboxSizePortionOrHalfSUBECardOrTwoTableSpoonsDaily.
  ///
  /// In en, this message translates to:
  /// **'1 sm matchbox sz port or 1/2 SUBE card or 2 tbsp dy'**
  String get txtOneSmallMatchboxSizePortionOrHalfSUBECardOrTwoTableSpoonsDaily;

  /// No description provided for @txtOneDiceSizePortionOrOneTableSpoonDaily.
  ///
  /// In en, this message translates to:
  /// **'1 dice sz port or 1 tbsp dy'**
  String get txtOneDiceSizePortionOrOneTableSpoonDaily;

  /// No description provided for @txtLessThanOneDiceSizePortionOrLessThanOneTableSpoonDaily.
  ///
  /// In en, this message translates to:
  /// **'LT 1 dice sz port or LT 1 tbsp dy'**
  String get txtLessThanOneDiceSizePortionOrLessThanOneTableSpoonDaily;

  /// No description provided for @txtOneSmallPortionWithoutWasteDailyOrUpToTwoEggUnitsDailyOrOneSliceSizePortionOfPecetoPlusOneEggDaily.
  ///
  /// In en, this message translates to:
  /// **'1 sm port without waste dy or up to 2 egg us dy or 1 slice sz port of peceto + 1 egg dy'**
  String
      get txtOneSmallPortionWithoutWasteDailyOrUpToTwoEggUnitsDailyOrOneSliceSizePortionOfPecetoPlusOneEggDaily;

  /// No description provided for @txtTwoSmallPortionsWithoutWasteDailyOrUpToFourEggUnitsDailyOrOneSmallPortionPlusTwoEggUnitsDaily.
  ///
  /// In en, this message translates to:
  /// **'2 sm ports without waste dy or up to 4 egg us dy or 1 sm port + 2 egg us dy'**
  String
      get txtTwoSmallPortionsWithoutWasteDailyOrUpToFourEggUnitsDailyOrOneSmallPortionPlusTwoEggUnitsDaily;

  /// No description provided for @txtMoreThanTwoSmallPortionsWithoutWasteDailyOrMoreThanFourEggUnitsDailyOrMoreThanOneSmallPortionPlusTwoEggUnitsDaily.
  ///
  /// In en, this message translates to:
  /// **'MT 2 sm ports without waste dy or MT 4 egg us dy or MT 1 sm port + 2 egg us dy'**
  String
      get txtMoreThanTwoSmallPortionsWithoutWasteDailyOrMoreThanFourEggUnitsDailyOrMoreThanOneSmallPortionPlusTwoEggUnitsDaily;

  /// No description provided for @txtTenWalnutHalvesOrTwentyAlmondsOrTwoTableSpoonsDailyOfSeedsOrPeanuts.
  ///
  /// In en, this message translates to:
  /// **'10 walnut halves or 20 almonds or 2 tbsp dy of seeds or peanuts'**
  String
      get txtTenWalnutHalvesOrTwentyAlmondsOrTwoTableSpoonsDailyOfSeedsOrPeanuts;

  /// No description provided for @txtHalfPlateCookedDailyOrThreeQuartersPlateRawDailyOrSixMediumUnitsPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1/2 pl cooked dy or 3/4 pl raw dy or 6 med us per wk'**
  String
      get txtHalfPlateCookedDailyOrThreeQuartersPlateRawDailyOrSixMediumUnitsPerWeek;

  /// No description provided for @txtQuarterPlateCookedDailyOrHalfPlateRawDailyOrThreeMediumUnitsPerWeek.
  ///
  /// In en, this message translates to:
  /// **'1/4 pl cooked dy or 1/2 pl raw dy or 3 med us per wk'**
  String
      get txtQuarterPlateCookedDailyOrHalfPlateRawDailyOrThreeMediumUnitsPerWeek;

  /// No description provided for @txtLessThanQuarterPlateCookedDailyOrLessThanHalfPlateRawDailyOrLessThanThreeMediumUnitsPerWeek.
  ///
  /// In en, this message translates to:
  /// **'LT 1/4 pl cooked dy or LT 1/2 pl raw dy or LT 3 med us per wk'**
  String
      get txtLessThanQuarterPlateCookedDailyOrLessThanHalfPlateRawDailyOrLessThanThreeMediumUnitsPerWeek;

  /// No description provided for @txtTwoPlatesPerWeekOrOnePlatePlusTwoMedallionsPerWeek.
  ///
  /// In en, this message translates to:
  /// **'2 pls per wk or 1 pl + 2 medallions per wk'**
  String get txtTwoPlatesPerWeekOrOnePlatePlusTwoMedallionsPerWeek;

  /// No description provided for @txtLessThanOnePlatePerWeekOrLessThanHalfPlatePlusOneMedallionPerWeek.
  ///
  /// In en, this message translates to:
  /// **'LT 1 pl per wk or LT 1/2 pl + 1 medallion per wk'**
  String
      get txtLessThanOnePlatePerWeekOrLessThanHalfPlatePlusOneMedallionPerWeek;

  /// No description provided for @txtUpToSixSmallUnitsPerWeekOrThreeLargeUnitsPerWeekOrHalfPlateDaily.
  ///
  /// In en, this message translates to:
  /// **'up to 6 sm us/wk or 3 large us/wk or 1/2 pl dy'**
  String
      get txtUpToSixSmallUnitsPerWeekOrThreeLargeUnitsPerWeekOrHalfPlateDaily;

  /// No description provided for @txtUpToNineUnitsPerWeekOrFiveLargeUnitsPerWeekOrOnePlateDaily.
  ///
  /// In en, this message translates to:
  /// **'up to 9 us/wk or 5 large us/wk or 1 pl dy'**
  String get txtUpToNineUnitsPerWeekOrFiveLargeUnitsPerWeekOrOnePlateDaily;

  /// No description provided for @txtMoreThanNineUnitsPerWeekOrMoreThanFiveLargeUnitsPerWeekOrMoreThanOnePlateDaily.
  ///
  /// In en, this message translates to:
  /// **'MT 9 us/wk or MT 5 large us/wk or MT 1 pl dy'**
  String
      get txtMoreThanNineUnitsPerWeekOrMoreThanFiveLargeUnitsPerWeekOrMoreThanOnePlateDaily;

  /// No description provided for @txtOneMediumUnitDailyOrThreeQuartersPlateRawDailyOrHalfPlateCookedDaily.
  ///
  /// In en, this message translates to:
  /// **'1 med u dy or 3/4 pl raw dy or 1/2 pl cooked dy'**
  String
      get txtOneMediumUnitDailyOrThreeQuartersPlateRawDailyOrHalfPlateCookedDaily;

  /// No description provided for @txtOneSmallUnitDailyOrHalfPlateRawDailyOrQuarterPlateCookedDaily.
  ///
  /// In en, this message translates to:
  /// **'1 sm u dy or 1/2 pl raw dy or 1/4 pl cooked dy'**
  String get txtOneSmallUnitDailyOrHalfPlateRawDailyOrQuarterPlateCookedDaily;

  /// No description provided for @txtLessThanOneSmallUnitDailyOrLessThanHalfPlateRawDailyOrLessThanQuarterPlateCookedDaily.
  ///
  /// In en, this message translates to:
  /// **'LT 1 sm u dy or 1/2 pl raw dy or 1/4 pl cooked dy'**
  String
      get txtLessThanOneSmallUnitDailyOrLessThanHalfPlateRawDailyOrLessThanQuarterPlateCookedDaily;

  /// No description provided for @txtTwoLargeUnitsPerDayOrFourSmallUnitsPerDay.
  ///
  /// In en, this message translates to:
  /// **'2 large us per day or 4 sm us per day'**
  String get txtTwoLargeUnitsPerDayOrFourSmallUnitsPerDay;

  /// No description provided for @txtOneLargeUnitPerDayOrTwoSmallUnitsPerDay.
  ///
  /// In en, this message translates to:
  /// **'1 large u per day or 2 sm us per day'**
  String get txtOneLargeUnitPerDayOrTwoSmallUnitsPerDay;

  /// No description provided for @txtLessThanOneLargeUnitPerDayOrLessThanTwoSmallUnitsPerDay.
  ///
  /// In en, this message translates to:
  /// **'LT 1 large u per day or 2 sm us per day'**
  String get txtLessThanOneLargeUnitPerDayOrLessThanTwoSmallUnitsPerDay;

  /// No description provided for @txtThreeSlicesPerDayOrTwoSmallMedallions.
  ///
  /// In en, this message translates to:
  /// **'3 slices per day or 2 sm medallions'**
  String get txtThreeSlicesPerDayOrTwoSmallMedallions;

  /// No description provided for @txtSixSlicesPerDayOrFourSmallMedallionsOrTwoSmallFlutes.
  ///
  /// In en, this message translates to:
  /// **'6 slices per day or 4 sm medallions or 2 sm flutes'**
  String get txtSixSlicesPerDayOrFourSmallMedallionsOrTwoSmallFlutes;

  /// No description provided for @txtMoreThanSixSlicesPerDayOrMoreThanFourSmallMedallionsOrMoreThanTwoSmallFlutes.
  ///
  /// In en, this message translates to:
  /// **'MT 6 slices per day or MT 4 sm medallions or MT 2 sm flutes'**
  String
      get txtMoreThanSixSlicesPerDayOrMoreThanFourSmallMedallionsOrMoreThanTwoSmallFlutes;

  /// No description provided for @txtHalfPlateOfWholeWheatPastaPerDayOrOneAndHalfPortionOfDoughPerDay.
  ///
  /// In en, this message translates to:
  /// **'1/2 pl of whole wheat pasta per day or 1 and 1/2 port of dough per day'**
  String
      get txtHalfPlateOfWholeWheatPastaPerDayOrOneAndHalfPortionOfDoughPerDay;

  /// No description provided for @txtOnePlatePerDayOrThreePortionsOfDoughPerDay.
  ///
  /// In en, this message translates to:
  /// **'1 pl per day or 3 port of dough per day'**
  String get txtOnePlatePerDayOrThreePortionsOfDoughPerDay;

  /// No description provided for @txtMoreThanOnePlatePerDayOrMoreThanThreePortionsOfDoughPerDay.
  ///
  /// In en, this message translates to:
  /// **'MT 1 pl per day or MT 3 port of dough per day'**
  String get txtMoreThanOnePlatePerDayOrMoreThanThreePortionsOfDoughPerDay;

  /// No description provided for @txtTwoBreakfastCups.
  ///
  /// In en, this message translates to:
  /// **'2 breakfast cups'**
  String get txtTwoBreakfastCups;

  /// No description provided for @txtOneBreakfastCup.
  ///
  /// In en, this message translates to:
  /// **'1 breakfast cup'**
  String get txtOneBreakfastCup;

  /// No description provided for @txtLessThanOneBreakfastCup.
  ///
  /// In en, this message translates to:
  /// **'LT 1 breakfast cup'**
  String get txtLessThanOneBreakfastCup;

  /// No description provided for @txtOnePortionTheSizeOfADiceOrOneTableSpoon.
  ///
  /// In en, this message translates to:
  /// **'1 portion the sz of a dice or 1 tbsp'**
  String get txtOnePortionTheSizeOfADiceOrOneTableSpoon;

  /// No description provided for @txtLessThanOnePortionTheSizeOfADiceOrLessThanOneTableSpoon.
  ///
  /// In en, this message translates to:
  /// **'LT 1 portion the sz of a dice or LT 1 tbsp'**
  String get txtLessThanOnePortionTheSizeOfADiceOrLessThanOneTableSpoon;

  /// No description provided for @txtOneMediumPortionWithoutWasteDailyOrUpToThreeEggsDailyOrOneSmallPortionPlusTwoEggsDaily.
  ///
  /// In en, this message translates to:
  /// **'1 med port without waste dy or up to 3 eggs dy or 1 sm port + 2 eggs dy'**
  String
      get txtOneMediumPortionWithoutWasteDailyOrUpToThreeEggsDailyOrOneSmallPortionPlusTwoEggsDaily;

  /// No description provided for @txtTwoSmallPortionsWithoutWasteDailyOrUpToFourEggsOrOneMediumPortionPlusTwoEggs.
  ///
  /// In en, this message translates to:
  /// **'2 sm ports without waste dy or up to 4 eggs or 1 med port + 2 eggs'**
  String
      get txtTwoSmallPortionsWithoutWasteDailyOrUpToFourEggsOrOneMediumPortionPlusTwoEggs;

  /// No description provided for @txtMoreThanTwoSmallPortionsWithoutWasteDailyOrUpToFourEggsDailyOrMoreThanOneMediumPortionPlusTwoEggs.
  ///
  /// In en, this message translates to:
  /// **'MT 2 sm ports without waste dy or up to 4 eggs dy or 1 med port + 2 eggs'**
  String
      get txtMoreThanTwoSmallPortionsWithoutWasteDailyOrUpToFourEggsDailyOrMoreThanOneMediumPortionPlusTwoEggs;

  /// No description provided for @txtTwoLargePortionsPerWeekOrTwoCansPerWeekOrOneThirdPlateOfCannedFishPerWeek.
  ///
  /// In en, this message translates to:
  /// **'2 large port per wk or 2 cans/wk or 1/3 pl of canned fish per wk'**
  String
      get txtTwoLargePortionsPerWeekOrTwoCansPerWeekOrOneThirdPlateOfCannedFishPerWeek;

  /// No description provided for @txtOneMediumPortionPerWeekOrOneCanPerWeekOrQuarterPlatePerWeek.
  ///
  /// In en, this message translates to:
  /// **'1 med portion per wk or 1 can/wk or 1/4 pl per wk'**
  String get txtOneMediumPortionPerWeekOrOneCanPerWeekOrQuarterPlatePerWeek;

  /// No description provided for @txtLessThanOneMediumPortionPerWeekOrLessThanOneCanPerWeekOrLessThanQuarterPlatePerWeek.
  ///
  /// In en, this message translates to:
  /// **'LT 1 med portion per wk or 1 can/wk or 1/4 pl per wk'**
  String
      get txtLessThanOneMediumPortionPerWeekOrLessThanOneCanPerWeekOrLessThanQuarterPlatePerWeek;

  /// No description provided for @txtTenWalnutHalvesPerDayOrTwentyAlmondsPerDayOrTwoTableSpoonsPerDayOfSeedsOrPeanuts.
  ///
  /// In en, this message translates to:
  /// **'10 walnut halves per day or 20 almonds per day or 2 tbsp per day of seeds or peanuts'**
  String
      get txtTenWalnutHalvesPerDayOrTwentyAlmondsPerDayOrTwoTableSpoonsPerDayOfSeedsOrPeanuts;

  /// No description provided for @txtFiveWalnutHalvesPerDayOrTenAlmondsPerDayOrOneTableSpoonPerDayOfSeedsOrPeanuts.
  ///
  /// In en, this message translates to:
  /// **'5 walnut halves per day or 10 almonds per day or 1 tbsp per day of seeds or peanuts'**
  String
      get txtFiveWalnutHalvesPerDayOrTenAlmondsPerDayOrOneTableSpoonPerDayOfSeedsOrPeanuts;

  /// No description provided for @txtLessThanFiveWalnutHalvesPerDayOrLessThanTenAlmondsPerDayOrLessThanOneTableSpoonPerDayOfSeedsOrPeanuts.
  ///
  /// In en, this message translates to:
  /// **'LT 5 walnut halves per day or 10 almonds per day or 1 tbsp per day of seeds or peanuts'**
  String
      get txtLessThanFiveWalnutHalvesPerDayOrLessThanTenAlmondsPerDayOrLessThanOneTableSpoonPerDayOfSeedsOrPeanuts;

  /// No description provided for @txtThreeTableSpoonsPerDay.
  ///
  /// In en, this message translates to:
  /// **'3 tbsp per day'**
  String get txtThreeTableSpoonsPerDay;

  /// No description provided for @txtLessThanOnePortionSizeDiceOrLessThanOneTbspDaily.
  ///
  /// In en, this message translates to:
  /// **'LT 1 port, the sz of a dice or LT 1 tbsp dy'**
  String get txtLessThanOnePortionSizeDiceOrLessThanOneTbspDaily;

  /// No description provided for @txtOneSmallPortionWithoutWasteBeefPlusEggDaily.
  ///
  /// In en, this message translates to:
  /// **'1 sm port without waste dy or up to 2 egg us dy or 1 port the sz of a slice of beef + 1 egg dy'**
  String get txtOneSmallPortionWithoutWasteBeefPlusEggDaily;

  /// No description provided for @txtTwoAndHalfMedUnitsWkThirdRawFourthCookedPlateDS.
  ///
  /// In en, this message translates to:
  /// **'2  1/2 med us per wk or 1/3 raw pl dy or 1/4 cooked pl'**
  String get txtTwoAndHalfMedUnitsWkThirdRawFourthCookedPlateDS;

  /// No description provided for @txtLessThanTwoAndHalfMedUnitsWkThirdRawFourthCookedPlateDS.
  ///
  /// In en, this message translates to:
  /// **'LT 2  1/2 med us per wk or LT 1/3 raw pl dy or LT 1/4 cooked pl'**
  String get txtLessThanTwoAndHalfMedUnitsWkThirdRawFourthCookedPlateDS;

  /// No description provided for @txtMoreThanNineUnitsWkFiveLargeOnePlateDailyDS.
  ///
  /// In en, this message translates to:
  /// **'MT  9 us/wk or MT 5 large us/wk or MT 1 pl dy'**
  String get txtMoreThanNineUnitsWkFiveLargeOnePlateDailyDS;
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
