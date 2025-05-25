// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get txtReadCarefully => 'Please read carefully before using this app';

  @override
  String get txtAppPurpose =>
      'This app calculates the estimated cardiovascular health score as defined by the';

  @override
  String get txtFundamentalsLocation =>
      'The scoring system and criteria are thoroughly explained in:';

  @override
  String get txtLifeEssentialEightObjective =>
      'Life’s Essential 8: Updating and Enhancing the American Heart Association’s Construct of Cardiovascular Health: A Presidential Advisory From the American Heart Association';

  @override
  String get txtPaperAuthors =>
      'Published by: Donald M. Lloyd-Jones, MD, ScM, FAHA, Chair; Norrina B. Allen, PhD, MPH, FAHA; Cheryl A.M. Anderson, PhD, MPH, MS, FAHA; Terrie Black, DNP, MBA, CRRN, FAHA; LaPrincess C. Brewer, MD, MPH; Randi E. Foraker, PhD, MA, FAHA; Michael A. Grandner, PhD, MTR, FAHA; Helen Lavretsky, MD, MS; Amanda Marma Perak, MD, MS, FAHA; Garima Sharma, MD; Wayne Rosamond, PhD, MS, FAHA; on behalf of the American Heart Association';

  @override
  String get txtFundamentalsLocationMainWindow =>
      'Click here to read the foundations';

  @override
  String get txtButtonAcceptTandC => 'Accept';

  @override
  String get txtButtonRejectTandC => 'Cancel';

  @override
  String get txtButtonWarnings => 'Accept';

  @override
  String get txtButtonAccept => 'Accept';

  @override
  String get txtButtonCancel => 'Cancel';

  @override
  String get txtCancelModalTitle => 'Are you sure?';

  @override
  String get txtCancelModalText => 'Do you want to discard your changes?';

  @override
  String get txtCancelModalDiscard => 'Discard';

  @override
  String get txtCancelModalVolver => 'Return';

  @override
  String get txtDietButton => 'Diet';

  @override
  String get txtDietDialog =>
      'Quantiles of DASH-style diet adherence (MEPA). Ages 2-19 y.\';';

  @override
  String get txtDietDialogOptions =>
      '9-10 MEPA score points|7-8 MEPA score points|5-6 MEPA score points|3-4 MEPA score points|0-2 MEPA score points';

  @override
  String get txtDietHelp =>
      '**Quantiles of DASH-style diet adherence (MEPA)** refers to a statistical analysis method used to assess adherence to the DASH-style diet (DASH: Dietary Approaches to Stop Hypertension), which is a dietary pattern that emphasizes the consumption of fruits, vegetables, whole grains, lean proteins, and low-fat dairy products, while limiting intake of sodium, added sugars, and saturated fats. \n\n**MEPA** is Mediterranean Eating Pattern for Americans. \n\nThe **quantiles** refer to dividing a dataset into equal parts or intervals, based on the distribution of a particular variable (in this case, adherence to the DASH-style diet), in order to analyze the data and compare different groups of individuals. The use of quantiles in this context allows for the identification of specific levels of adherence to the DASH-style diet.';

  @override
  String get txtDietWarning => '';

  @override
  String get txtPhysicalActivityButton => 'Physical Activity';

  @override
  String get txtPhysicalActivityDialog =>
      'Minutes of moderate or greater intensity activity per week. Ages: 6 to 9.';

  @override
  String get txtPhysicalActivityDialogOptions =>
      '≥ 420 minutes|360 - 419 minutes|300 - 359 minutes|240 - 299 minutes|120 - 239 minutes|1 - 119 minutes|No activity';

  @override
  String get txtPhysicalActivityHelp => '';

  @override
  String get txtBodyMassIndexButton => 'BMI';

  @override
  String get txtBodyMassIndexDialog =>
      'BMI percentiles for age and sex, starting in infancy.';

  @override
  String get txtBodyMassIndexDialogOptions =>
      '5th - < 85th percentile|85th - < 95th|95th percentile - < 120% of the 95th percentile|120% of the 95th - < 140% of the 95th percentile|≥ 140% of the 95th percentile';

  @override
  String get txtBodyMassIndextHelp =>
      '**BMI** stands for Body Mass Index, which is a measure of body fat based on an individual\'s height and weight. It is calculated by dividing an individual\'s weight in kilograms by their height in meters squared *(BMI = kg/m²)*. \n\n It is important to note that BMI is not a direct measure of body fat and does not take into account factors such as muscle mass or body composition. Therefore, it may not accurately reflect the health status of individuals with high muscle mass, such as athletes, or those with low muscle mass, such as older adults. However, for most people, BMI is a useful tool for assessing their weight status and potential health risks associated with being overweight or obese.';

  @override
  String get txtBodyMassIndexWarning => '';

  @override
  String get txtSleepButton => 'Sleep';

  @override
  String get txtSleepDialog =>
      'Average hours of sleep per night (or per 24 h for age ≤ 5)';

  @override
  String get txtSleepDialogOptions =>
      'Age-appropriate optimal range|< 1h above optimal range|< 1h above optimal range|1 - < 2h below or ≥1h above optimal range|2 - < 3h below optimal range|≥ 3h below optimal range';

  @override
  String get txtSleepWarning => '';

  @override
  String get txtSmokeExposureButton => 'Smoke Exposure';

  @override
  String get txtSmokeExposureDialog =>
      'Combustible tobacco use or inhaled NDS use at any age (per clinician discretion); or secondhand smoke exposure';

  @override
  String get txtSmokeExposureDialogOptions =>
      'Never tried |Never tried but lives with indoor smoker at home |Tried any nicotine product, but > 30d ago |Tried any nicotine product, but > 30d ago and lives with indoor smoker at home |Currently using inhaled NDS |Currently using inhaled NDS and lives with indoor smoker at home |Current combustible use (any within 30d)';

  @override
  String get txtSmokeExposureHelp =>
      '**NDS** stands for nicotine-delivery system, which is a term used to describe any device or product that delivers *nicotine* to the body, including cigarettes, e-cigarettes, vaping devices, and other tobacco products.';

  @override
  String get txtSmokeExposureWarning => '';

  @override
  String get txtDiabetesButton => 'Diabetes';

  @override
  String get txtDiabetesDialog =>
      'FBG (mg/dL) or HbA1c (%) symptom-based screening at any age or risk-based screening starting at age ≥10y of age or onset of puberty per clinician discretion';

  @override
  String get txtDiabetesDialogOptions =>
      'No history of diabetes and FBG<100 mg/dL (or HbA1c < 5.7%) | Prediabetes with FBG 100 - 125 mg/dL (or HbA1c 5.7 - 6.4%) | Diabetes with HbA1c < 7.0% | Diabetes with HbA1c 7.0 - 7.9% | Diabetes with HbA1c 8.0 - 8.9% | Diabetes with HbA1c 9.0 - 9.9% | Diabetes with HbA1c ≥ 10%';

  @override
  String get txtDiabetesHelp =>
      '**FBG** stands for Fasting Blood Glucose. This is a test that measures the level of glucose (sugar) in the blood after fasting for a certain period of time. \n\n**HbA1c** stands for Glycated Hemoglobin and is a blood test that measures the average blood glucose levels over the past 2-3 months. Hemoglobin is a protein in red blood cells that carries oxygen throughout the body. When glucose in the blood binds to hemoglobin, the result is glycated hemoglobin, or HbA1c.';

  @override
  String get txtDiabetesWarning => '';

  @override
  String get txtBloodPressureButton => 'Blood Pressure';

  @override
  String get txtBloodPressureDialog =>
      'Systolic and diastolic BP (mm Hg) percentiles for age through 12y. For age ≥ 13y use adult scoring. Screening should start no later than age 3y and earlier per clinician discretion.';

  @override
  String get txtBloodPressureDialogOptions =>
      'Optimal (<90th percentile) |Optimal (<90th percentile) (treated) |Elevated (≥90th - <95th percentile or ≥ 120/80 mm Hg to <95th percentile, whichever is lower) |Elevated (≥90th - <95th percentile or ≥ 120/80 mm Hg to <95th percentile, whichever is lower) (treated) |Stage 1 hypertension (≥95th - <95th percentile + 12 mm Hg, or 130/80 - 139/89 mm Hg, whichever is lower |Stage 1 hypertension (≥95th - <95th percentile + 12 mm Hg, or 130/80 - 139/89 mm Hg, whichever is lower (treated) |Stage 2 hypertension (≥95th percentile + 12 mm Hg, or ≥140/90 mm Hg, whichever is lower) |Stage 2 hypertension (≥95th percentile + 12 mm Hg, or ≥140/90 mm Hg, whichever is lower) (treated) |Systolic BP ≥ 160 or ≥95th percentile + 30 mm Hg systolic BP, whichever is lower and/or diastolic BP ≥ 100 or ≥ 95th percentile + 20 mm Hg diastolic BP';

  @override
  String get txtBloodPressureHelp =>
      '**Systolic blood pressure (SBP)** is the pressure exerted by the blood against the walls of the arteries when the heart beats and pumps blood out into the body. It is the top number in a blood pressure reading and is measured in millimeters of mercury (mm Hg).\n\n**Diastolic blood pressure (DBP)** is the pressure exerted by the blood against the walls of the arteries when the heart is at rest between beats. It is the bottom number in a blood pressure reading and is also measured in millimeters of mercury (mm Hg).';

  @override
  String get txtBloodPressureWarning =>
      '<h3 style=\"text-align:center;\">CORRECT TECHNIQUE FOR MEASURING BLOOD PRESSURE IN PEDIATRICS</h3> <p>With the patient at rest and calm, measurement should be taken with an appropriate-sized cuff for the child, with a cuff bladder that covers 2/3 of the arm\'s diameter and 2/3 of its length. Three readings should be taken and averaged. If values greater than the 90th percentile are recorded, they should be confirmed with auscultatory technique.</p><p><span style=\"color:red\">For proper use of the app, in case of recordings greater than the 90th percentile, the values to be entered must be the average of 3 readings taken during different consultations, with 3 readings per consultation.</span></p>';

  @override
  String get txtCholesterolButton => 'Cholesterol';

  @override
  String get txtCholesterolDialog =>
      'Non-HDL cholesterol (mg/dL), starting no later than age 9 - 11y and earlier per clinician discretion';

  @override
  String get txtCholesterolDialogOptions =>
      '< 170 mg/dl|170 - 199 mg/dl|≥ 200 mg/dl';

  @override
  String get txtCholesterolWarning => '';

  @override
  String get txtCholesterolHelp => '';

  @override
  String get txtLongPressGauge => 'Long press the gauge to reset all values.';

  @override
  String get txtGlossary => 'Important Information';

  @override
  String get txtAbout => '';
}
