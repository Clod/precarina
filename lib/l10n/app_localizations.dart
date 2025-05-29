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
    Locale('es'),
  ];

  /// No description provided for @txtPrecarina.
  ///
  /// In en, this message translates to:
  /// **'PRECARINA'**
  String get txtPrecarina;

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
  /// **'No history of diabetes and FBG<100 (or HbA1c < 5.7) |No diabetes and FBG 100 - 125 (or HbA1c 5.7 - 6.4) (prediabetes) |Diabetes with HbA1c < 7.0 |Diabetes with HbA1c 7.0 - 7.9 |Diabetes with HbA1c 8.0 - 8.9 |Diabetes with HbA1c 9.0 - 9.9 |Diabetes with HbA1c ≥ 10'**
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
  /// **'Glossary'**
  String get txtGlossary;

  /// No description provided for @txtAbout.
  ///
  /// In en, this message translates to:
  /// **'This app has been developed based on the scientific and medical knowledge of a team of pediatricians from Dr. Ricardo Gutiérrez Children\'s Hospital in Buenos Aires, including:<br/><strong>Ángela Sardella</strong> - Médica Pediatra y Cardióloga Pediatra. <br/><strong>Marina Vaccari</strong> - Médica Pediatra y Cardióloga Infantil certificada en hipertensión arterial. <br/><strong>Maria Sol Elorriaga</strong> - Médica Pediatra, Cardióloga infantil y Deportóloga. <br/><strong>Barbara Wagmaister</strong> - Médica Pediatra y Cardióloga Pediatra.<br/><strong>Miriam Tonietti</strong> - Médica Pediatra especialista en Nutrición y Diabetes.</strong> <br/><strong>Patricia Palenque</strong> - Licenciada en Nutrición y Docente adscripta de la U.B.A.<span style=\"color:red\"><p>We suggest that this app be primarily considered as a tool for HEALTH PROFESSIONALS to assess and promote a healthy lifestyle in pediatric clinical practice, especially for younger ages. Formal scoring is optional and physicians should emphasize lifelong concepts and well-being rather than specific scores, given the scarcity of data to support a scoring framework.<br></br>Cardiovascular health should be assessed from childhood. Numerous studies have shown that there are abnormalities in pediatric ages and it is associated with subclinical CVD in middle age.</p></span><br></br> <p>The short and medium-term health outcomes (including tracking metrics in adolescence and adulthood) are strong enough for diet, physical activity (screen time and play), sleep, exposure to secondhand smoke, and body weight\n to be addressed and advised during routine visits for healthy children.</p>'**
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

  /// No description provided for @txtImportantNotice.
  ///
  /// In en, this message translates to:
  /// **'IMPORTANT NOTICE'**
  String get txtImportantNotice;

  /// No description provided for @txtAppleWarning.
  ///
  /// In en, this message translates to:
  /// **'<p style=\"text-align:center\"><span style=\"font-size:16px\"><strong><span style=\"color:#ffffff\">IMPORTANT</span></strong></span></p>\n\n<p style=\"text-align:center\"><span style=\"font-size:14px\"><span style=\"color:#ffffff\">After loading all the information, the score will be displayed. It is just indicative and</span></span></p>\n\n<p style=\"text-align:center\"><span style=\"font-size:14px\"><span style=\"color:#ffffff\"><u>CANNOT REPLACE REGULAR MEDICAL CHECK-UPS</u></span></span></p>\n'**
  String get txtAppleWarning;

  /// No description provided for @patientsDataInputTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter Patient\'s Data'**
  String get patientsDataInputTitle;

  /// No description provided for @txtSex.
  ///
  /// In en, this message translates to:
  /// **'Sex: '**
  String get txtSex;

  /// No description provided for @txtAge.
  ///
  /// In en, this message translates to:
  /// **'Age: '**
  String get txtAge;

  /// No description provided for @txtWeight.
  ///
  /// In en, this message translates to:
  /// **'Weight: '**
  String get txtWeight;

  /// No description provided for @txtHeight.
  ///
  /// In en, this message translates to:
  /// **'Height: '**
  String get txtHeight;

  /// No description provided for @inputSex.
  ///
  /// In en, this message translates to:
  /// **'Sex'**
  String get inputSex;

  /// No description provided for @sexFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get sexFemale;

  /// No description provided for @sexMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get sexMale;

  /// No description provided for @inputHeight.
  ///
  /// In en, this message translates to:
  /// **'Enter height'**
  String get inputHeight;

  /// No description provided for @inputWeight.
  ///
  /// In en, this message translates to:
  /// **'Enter weight'**
  String get inputWeight;

  /// No description provided for @hintWeightKilos.
  ///
  /// In en, this message translates to:
  /// **'Eg: 42'**
  String get hintWeightKilos;

  /// No description provided for @hintWeightGramos.
  ///
  /// In en, this message translates to:
  /// **'Eg: 300'**
  String get hintWeightGramos;

  /// No description provided for @hintHeight.
  ///
  /// In en, this message translates to:
  /// **'Eg.: 123,5'**
  String get hintHeight;

  /// No description provided for @inputBirthDate.
  ///
  /// In en, this message translates to:
  /// **'Enter birth date or age:'**
  String get inputBirthDate;

  /// No description provided for @birthDate.
  ///
  /// In en, this message translates to:
  /// **'Date of\n birth'**
  String get birthDate;

  /// No description provided for @labelYears.
  ///
  /// In en, this message translates to:
  /// **'Years'**
  String get labelYears;

  /// No description provided for @labelMonths.
  ///
  /// In en, this message translates to:
  /// **'Months'**
  String get labelMonths;

  /// No description provided for @suffixAno.
  ///
  /// In en, this message translates to:
  /// **' year'**
  String get suffixAno;

  /// No description provided for @suffixAnos.
  ///
  /// In en, this message translates to:
  /// **' years'**
  String get suffixAnos;

  /// No description provided for @suffixMes.
  ///
  /// In en, this message translates to:
  /// **' month'**
  String get suffixMes;

  /// No description provided for @suffixMeses.
  ///
  /// In en, this message translates to:
  /// **' months'**
  String get suffixMeses;

  /// No description provided for @btnResetFields.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get btnResetFields;

  /// No description provided for @btnContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get btnContinue;

  /// No description provided for @physicalActivityQ1.
  ///
  /// In en, this message translates to:
  /// **'Q1. How many days per week do you engage in sports, games, physical exercises, dance or other physical activities?'**
  String get physicalActivityQ1;

  /// No description provided for @physicalActivityQ1Note.
  ///
  /// In en, this message translates to:
  /// **'(Consider only activities practiced outside of school)'**
  String get physicalActivityQ1Note;

  /// No description provided for @physicalActivityQ1Opt1.
  ///
  /// In en, this message translates to:
  /// **'None (skip to Q3)'**
  String get physicalActivityQ1Opt1;

  /// No description provided for @physicalActivityQ1Opt2.
  ///
  /// In en, this message translates to:
  /// **'1 day per week'**
  String get physicalActivityQ1Opt2;

  /// No description provided for @physicalActivityQ1Opt3.
  ///
  /// In en, this message translates to:
  /// **'2 days per week'**
  String get physicalActivityQ1Opt3;

  /// No description provided for @physicalActivityQ1Opt4.
  ///
  /// In en, this message translates to:
  /// **'3 days per week'**
  String get physicalActivityQ1Opt4;

  /// No description provided for @physicalActivityQ1Opt5.
  ///
  /// In en, this message translates to:
  /// **'4 days per week'**
  String get physicalActivityQ1Opt5;

  /// No description provided for @physicalActivityQ1Opt6.
  ///
  /// In en, this message translates to:
  /// **'5 days per week'**
  String get physicalActivityQ1Opt6;

  /// No description provided for @physicalActivityQ1Opt7.
  ///
  /// In en, this message translates to:
  /// **'6 days per week'**
  String get physicalActivityQ1Opt7;

  /// No description provided for @physicalActivityQ1Opt8.
  ///
  /// In en, this message translates to:
  /// **'Every day'**
  String get physicalActivityQ1Opt8;

  /// No description provided for @physicalActivityQ2.
  ///
  /// In en, this message translates to:
  /// **'Q2. How much total weekly time do you usually dedicate to sports, games, physical exercises, dance or other physical activities on those days?'**
  String get physicalActivityQ2;

  /// No description provided for @physicalActivityQ3.
  ///
  /// In en, this message translates to:
  /// **'Q3. How do you usually commute to school?'**
  String get physicalActivityQ3;

  /// No description provided for @physicalActivityQ3Opt1.
  ///
  /// In en, this message translates to:
  /// **'Walking'**
  String get physicalActivityQ3Opt1;

  /// No description provided for @physicalActivityQ3Opt2.
  ///
  /// In en, this message translates to:
  /// **'Bicycle'**
  String get physicalActivityQ3Opt2;

  /// No description provided for @physicalActivityQ3Opt3.
  ///
  /// In en, this message translates to:
  /// **'Motorized transportation (car, motorcycle, bus, subway, tram, train)'**
  String get physicalActivityQ3Opt3;

  /// No description provided for @physicalActivityQ4.
  ///
  /// In en, this message translates to:
  /// **'Q4. How many blocks away from your home is the school you attend?'**
  String get physicalActivityQ4;

  /// No description provided for @physicalActivityBlocks.
  ///
  /// In en, this message translates to:
  /// **' blocks'**
  String get physicalActivityBlocks;

  /// No description provided for @physicalActivityQ5.
  ///
  /// In en, this message translates to:
  /// **'Q5. How many times per week do you have Physical Education classes at school?'**
  String get physicalActivityQ5;

  /// No description provided for @physicalActivityQ5Opt0.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get physicalActivityQ5Opt0;

  /// No description provided for @physicalActivityQ5Opt1.
  ///
  /// In en, this message translates to:
  /// **'1 time per week'**
  String get physicalActivityQ5Opt1;

  /// No description provided for @physicalActivityQ5Opt2.
  ///
  /// In en, this message translates to:
  /// **'2 times per week'**
  String get physicalActivityQ5Opt2;

  /// No description provided for @physicalActivityQ5Opt3.
  ///
  /// In en, this message translates to:
  /// **'3 times per week'**
  String get physicalActivityQ5Opt3;

  /// No description provided for @physicalActivityQ5Opt4.
  ///
  /// In en, this message translates to:
  /// **'4 times per week'**
  String get physicalActivityQ5Opt4;

  /// No description provided for @physicalActivityQ5Opt5.
  ///
  /// In en, this message translates to:
  /// **'5 times per week'**
  String get physicalActivityQ5Opt5;

  /// No description provided for @physicalActivityQ5Opt6.
  ///
  /// In en, this message translates to:
  /// **'6 times per week'**
  String get physicalActivityQ5Opt6;

  /// No description provided for @physicalActivityQ6.
  ///
  /// In en, this message translates to:
  /// **'Q6. How many minutes per day, on average, do you spend in front of a computer, tablet, cell phone, or television screen?'**
  String get physicalActivityQ6;

  /// No description provided for @physicalActivityMinutes.
  ///
  /// In en, this message translates to:
  /// **' daily minutes'**
  String get physicalActivityMinutes;

  /// No description provided for @physicalActivitySedentaryWarning.
  ///
  /// In en, this message translates to:
  /// **' but is considered SEDENTARY if equal to or exceeding two hours of screen time per day.'**
  String get physicalActivitySedentaryWarning;

  /// No description provided for @txtBMI.
  ///
  /// In en, this message translates to:
  /// **'Body Mass Index: '**
  String get txtBMI;

  /// No description provided for @txtPercentile.
  ///
  /// In en, this message translates to:
  /// **'Percentile: '**
  String get txtPercentile;

  /// No description provided for @txtDiagnose.
  ///
  /// In en, this message translates to:
  /// **'Diagnose: '**
  String get txtDiagnose;

  /// No description provided for @txtPressCalc.
  ///
  /// In en, this message translates to:
  /// **'Press \"Calculate\"'**
  String get txtPressCalc;

  /// No description provided for @txtTradNotLaded.
  ///
  /// In en, this message translates to:
  /// **'Translator not loaded \n Please notify developer.'**
  String get txtTradNotLaded;

  /// No description provided for @txtDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get txtDone;

  /// No description provided for @txtSevereObesity.
  ///
  /// In en, this message translates to:
  /// **'Severe obesity'**
  String get txtSevereObesity;

  /// No description provided for @txtObesity.
  ///
  /// In en, this message translates to:
  /// **'Obesity'**
  String get txtObesity;

  /// No description provided for @txtOverWeight.
  ///
  /// In en, this message translates to:
  /// **'Overwight'**
  String get txtOverWeight;

  /// No description provided for @txtNormalWeight.
  ///
  /// In en, this message translates to:
  /// **'Normal weight'**
  String get txtNormalWeight;

  /// No description provided for @txtTotalSleepTime.
  ///
  /// In en, this message translates to:
  /// **'Total daily sleep time\nincluding regular naps.'**
  String get txtTotalSleepTime;

  /// No description provided for @txtImportant.
  ///
  /// In en, this message translates to:
  /// **'IMPORTANT\nREAD CAREFULLY!'**
  String get txtImportant;

  /// No description provided for @txtExamplePAS.
  ///
  /// In en, this message translates to:
  /// **'Ex.: 120'**
  String get txtExamplePAS;

  /// No description provided for @txtExamplePAD.
  ///
  /// In en, this message translates to:
  /// **'Ex.: 80'**
  String get txtExamplePAD;

  /// No description provided for @txtPAS.
  ///
  /// In en, this message translates to:
  /// **'Sistolic BP:   '**
  String get txtPAS;

  /// No description provided for @txtPAD.
  ///
  /// In en, this message translates to:
  /// **'Diastolic BP:  '**
  String get txtPAD;

  /// No description provided for @txtReceivesMedication.
  ///
  /// In en, this message translates to:
  /// **'Receives medication'**
  String get txtReceivesMedication;

  /// No description provided for @txtRequired.
  ///
  /// In en, this message translates to:
  /// **' Required'**
  String get txtRequired;

  /// No description provided for @txtCalculate.
  ///
  /// In en, this message translates to:
  /// **'Calculate'**
  String get txtCalculate;

  /// No description provided for @txtOK.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get txtOK;

  /// No description provided for @txtCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get txtCancel;

  /// No description provided for @txtAccept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get txtAccept;

  /// No description provided for @txtPatientNormal.
  ///
  /// In en, this message translates to:
  /// **'Patient with normal BP'**
  String get txtPatientNormal;

  /// No description provided for @txtPatHT.
  ///
  /// In en, this message translates to:
  /// **'Prehipertense patient'**
  String get txtPatHT;

  /// No description provided for @txtPatHt1.
  ///
  /// In en, this message translates to:
  /// **'Hipertense 1'**
  String get txtPatHt1;

  /// No description provided for @txtPatHt2.
  ///
  /// In en, this message translates to:
  /// **'Hipertense 2'**
  String get txtPatHt2;

  /// No description provided for @txtYes.
  ///
  /// In en, this message translates to:
  /// **'Y'**
  String get txtYes;

  /// No description provided for @txtNo.
  ///
  /// In en, this message translates to:
  /// **'N'**
  String get txtNo;

  /// No description provided for @txtScore.
  ///
  /// In en, this message translates to:
  /// **'Score: '**
  String get txtScore;

  /// No description provided for @resultAgeOver16.
  ///
  /// In en, this message translates to:
  /// **'Since the age of 16, percentiles are not evaluated, but rather the actual values of blood pressure are considered.'**
  String get resultAgeOver16;

  /// No description provided for @resultPasUnder_50.
  ///
  /// In en, this message translates to:
  /// **'The determined SBP percentile is less than the 50th percentile\n'**
  String get resultPasUnder_50;

  /// No description provided for @resultPasEqual_50.
  ///
  /// In en, this message translates to:
  /// **'The determined SBP percentile is equal to the 50th percentile\n'**
  String get resultPasEqual_50;

  /// No description provided for @resultPas_50to90.
  ///
  /// In en, this message translates to:
  /// **'The determined SBP percentile is between the 50th and 90th percentiles\n'**
  String get resultPas_50to90;

  /// No description provided for @resultPas_90to95.
  ///
  /// In en, this message translates to:
  /// **'The determined SBP percentile is between the 90th and 95th percentiles\n'**
  String get resultPas_90to95;

  /// No description provided for @resultPas_95to95plus12.
  ///
  /// In en, this message translates to:
  /// **'The determined SBP percentile is between the 95th and 95th + 12 mmHg\n'**
  String get resultPas_95to95plus12;

  /// No description provided for @resultPasAbove_95plus12.
  ///
  /// In en, this message translates to:
  /// **'The determined SBP percentile is above the 95th percentile + 12 mmHg\n'**
  String get resultPasAbove_95plus12;

  /// No description provided for @resultPadUnder_50.
  ///
  /// In en, this message translates to:
  /// **'The determined DBP percentile is less than the 50th percentile\n'**
  String get resultPadUnder_50;

  /// No description provided for @resultPadEqual_50.
  ///
  /// In en, this message translates to:
  /// **'The determined DBP percentile is equal to the 50th percentile\n'**
  String get resultPadEqual_50;

  /// No description provided for @resultPad_50to90.
  ///
  /// In en, this message translates to:
  /// **'The determined DBP percentile is between the 50th and 90th percentiles\n'**
  String get resultPad_50to90;

  /// No description provided for @resultPad_90to95.
  ///
  /// In en, this message translates to:
  /// **'The determined DBP percentile is between the 90th and 95th percentiles\n'**
  String get resultPad_90to95;

  /// No description provided for @resultPad_95to95plus12.
  ///
  /// In en, this message translates to:
  /// **'The determined DBP percentile is between the 95th and 95th + 12 mmHg\n'**
  String get resultPad_95to95plus12;

  /// No description provided for @resultPadAbove_95plus12.
  ///
  /// In en, this message translates to:
  /// **'The determined DBP percentile is above the 95th percentile + 12 mmHg\n'**
  String get resultPadAbove_95plus12;

  /// No description provided for @patientDiagnoseHT3.
  ///
  /// In en, this message translates to:
  /// **'Patient diagnosed with stage 3 hypertension'**
  String get patientDiagnoseHT3;

  /// No description provided for @patientDiagnoseHT2.
  ///
  /// In en, this message translates to:
  /// **'Patient diagnosed with stage 2 hypertension'**
  String get patientDiagnoseHT2;

  /// No description provided for @patientDiagnoseHT1.
  ///
  /// In en, this message translates to:
  /// **'Patient diagnosed with stage 1 hypertension'**
  String get patientDiagnoseHT1;

  /// No description provided for @patientDiagnoseHT.
  ///
  /// In en, this message translates to:
  /// **'Patient diagnosed as prehypertensive'**
  String get patientDiagnoseHT;

  /// No description provided for @patientDiagnoseNorm.
  ///
  /// In en, this message translates to:
  /// **'Patient diagnosed as normotensive'**
  String get patientDiagnoseNorm;

  /// No description provided for @txtApplicationLegalese.
  ///
  /// In en, this message translates to:
  /// **'This app is free and open-source as its sole purpose is to promote cardiovascular health from childhood.'**
  String get txtApplicationLegalese;

  /// No description provided for @txtAboutApp.
  ///
  /// In en, this message translates to:
  /// **'About PRECARINA'**
  String get txtAboutApp;

  /// No description provided for @txtHelpFood.
  ///
  /// In en, this message translates to:
  /// **'<p>The current food environment is characterized by a high supply and accessibility of energy-dense and nutritionally poor foods, with high levels of salt, sugar, and fats. These foods have replaced the consumption of natural foods that provide fiber, vitamins, and other beneficial nutrients for health. This shift in consumption patterns poses a significant risk to cardiovascular health.</p>\n<p>It is recommended to incorporate foods from all food groups daily and engage in at least 30 minutes of physical activity. Drink 8 glasses of safe water daily. Consume 5 servings of fruits and vegetables daily, including a variety of types and colors. Reduce the use of salt and the consumption of foods high in sodium. Limit the intake of sugary beverages and foods with high levels of fats, sugars, and salt. Consume daily servings of low-fat milk, yogurt, or cheese. Include lean meats in the diet, increase fish consumption, and include eggs. Consume legumes. Use raw oil as a condiment and incorporate nuts or seeds. Limit the consumption of alcoholic beverages.</p>\n<h2 id=\"bibliography\">Bibliography</h2>\n<ol>\n<li><a href=\"https://www.argentina.gob.ar/alimentacion-saludable/comer-sano\">Manual for the application of the Dietary Guidelines for the Argentine population.</a></li><li>Dietary Guidelines for Americans 2020-25. t DietaryGuidelines.gov</li></ol>\n'**
  String get txtHelpFood;

  /// No description provided for @txtBmiHelp.
  ///
  /// In en, this message translates to:
  /// **'The body mass index (BMI) is the most commonly used criterion to measure body mass in relation to height. It is a practical and universally applicable indicator, cheap, and non-invasive to identify overweight and obesity.</p><p lang=\"es-ES\">In children and adolescents, percentile charts are used to define overweight (> 85th percentile and < 95th percentile), obesity (> 95th percentile), and severe obesity (> 99th percentile). Therefore, for the PRECARINA application, we trained a Machine Learning model using data from the World Health Organization (WHO) and the National Health Center to estimate the BMI percentile.</p><h2 lang=\"es-ES\" class=\"western\">Bibliography</h2><p><span lang=\"es-ES\">Manual de Obesidad en Pediatría. Editorial Lugo</span>nes. 2023</p><p><br/><br/></p>'**
  String get txtBmiHelp;

  /// No description provided for @txtCholesterolDialogOptions_.
  ///
  /// In en, this message translates to:
  /// **'<100 |<100 (drug-treated) |100 - 119 |120 - 144 |145 - 189 |≥ 190'**
  String get txtCholesterolDialogOptions_;

  /// No description provided for @txtPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get txtPrivacyPolicy;
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
    'that was used.',
  );
}
