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
      '≥ 420 minutes|360:419 minutes|300:359 minutes|240:299 minutes|120:239 minutes|1:119 minutes|No activity';

  @override
  String get txtPhysicalActivityHelp => '';

  @override
  String get txtBodyMassIndexButton => 'BMI';

  @override
  String get txtBodyMassIndexDialog =>
      'BMI percentiles for age and sex, starting in infancy.';

  @override
  String get txtBodyMassIndexDialogOptions =>
      '5th:< 85th percentile|85th:< 95th|95th percentile:< 120% of the 95th percentile|120% of the 95th:< 140% of the 95th percentile|≥ 140% of the 95th percentile';

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
      'Age-appropriate optimal range|< 1h above optimal range|< 1h above optimal range|1:< 2h below or ≥1h above optimal range|2:< 3h below optimal range|≥ 3h below optimal range';

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
      'No history of diabetes and FBG<100 mg/dL (or HbA1c < 5.7%) | Prediabetes with FBG 100:125 mg/dL (or HbA1c 5.7:6.4%) | Diabetes with HbA1c < 7.0% | Diabetes with HbA1c 7.0:7.9% | Diabetes with HbA1c 8.0:8.9% | Diabetes with HbA1c 9.0:9.9% | Diabetes with HbA1c ≥ 10%';

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
      'Optimal (<90th percentile) |Optimal (<90th percentile) (treated) |Elevated (≥90th:<95th percentile or ≥ 120/80 mm Hg to <95th percentile, whichever is lower) |Elevated (≥90th:<95th percentile or ≥ 120/80 mm Hg to <95th percentile, whichever is lower) (treated) |Stage 1 hypertension (≥95th:<95th percentile + 12 mm Hg, or 130/80:139/89 mm Hg, whichever is lower |Stage 1 hypertension (≥95th:<95th percentile + 12 mm Hg, or 130/80:139/89 mm Hg, whichever is lower (treated) |Stage 2 hypertension (≥95th percentile + 12 mm Hg, or ≥140/90 mm Hg, whichever is lower) |Stage 2 hypertension (≥95th percentile + 12 mm Hg, or ≥140/90 mm Hg, whichever is lower) (treated) |Systolic BP ≥ 160 or ≥95th percentile + 30 mm Hg systolic BP, whichever is lower and/or diastolic BP ≥ 100 or ≥ 95th percentile + 20 mm Hg diastolic BP';

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
      'Non-HDL cholesterol (mg/dL), starting no later than age 9:11y and earlier per clinician discretion';

  @override
  String get txtCholesterolDialogOptions =>
      '< 170 mg/dl|170:199 mg/dl|≥ 200 mg/dl';

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

  @override
  String get txtVegetalesVerdes => 'Vegetales verdes';

  @override
  String get txtVegetalesRojosNaranjas => 'Vegetales rojos o naranjas';

  @override
  String get txtLegumbres => 'Legumbres';

  @override
  String get txtTuberculosPapaBatataMandioca =>
      'Tubérculos (papa, batata, mandioca)';

  @override
  String get txtOtrosVegetales => 'Otros vegetales';

  @override
  String get txtFrutas => 'Frutas';

  @override
  String get txtPan => 'Pan';

  @override
  String get txtPastasYMasaIntegrales =>
      'Pastas y masas integrales: masa: pizza, tarta, empanada, canelon, masa de taco.';

  @override
  String get txtPastasYMasaRefinadasNoIntegrales =>
      'Pastas y masas refinadas (No integrales)';

  @override
  String get txtLacteosLecheYogurParcialmenteDescremados =>
      'Lácteos (leche, yogur) parcialmente descremados';

  @override
  String get txtQuesosSemidescremadosUntablesOSemiSolidos =>
      'Quesos semidescremados untables o semisólidos (port salut, muzzarella)';

  @override
  String get txtCarnesRojasAveYHuevoPorDia =>
      'Carnes rojas, ave y huevo por día';

  @override
  String get txtPescados => 'Pescados';

  @override
  String get txtFrutosSecosYSemillas => 'Frutos secos y semillas';

  @override
  String get txtAceites => 'Aceites';

  @override
  String get txtOnePlatePerWeek => '1 pl per wk';

  @override
  String get txtHalfPlatePerWeek => '1/2 pl per wk';

  @override
  String get txtLessThanHalfPlatePerWeek => 'LT 1/2 pl per wk';

  @override
  String get txtThreePlatesPerWeekOrOneSmallUnitDaily =>
      '3 pls per wk or 1 sm u dy';

  @override
  String get txtLessThanOnePlatePerWeek => 'LT 1 pl per wk';

  @override
  String get txtHalfPlatePerWeekOrTwoSmallMedallionsPerWeek =>
      '1/2 pl per wk or 2 sm medallions per wk';

  @override
  String get txtQuarterPlatePerWeekOrOneSmallMedallionPerWeek =>
      '1/4 pl per wk or 1 sm medallion per wk';

  @override
  String get txtLessThanQuarterPlatePerWeekOrLessThanOneSmallMedallionPerWeek =>
      'LT 1/4 pl per wk or LT 1 sm medallion per wk';

  @override
  String get txtHalfSmallUnitDailyOrQuarterPlateDailyOrThreeSmallUnitsPerWeek =>
      '1/2 sm u dy or 1/4 pl dy or 3 sm us per wk';

  @override
  String get txtOneSmallUnitDailyOrHalfPlateDailyOrThreeMediumUnitsPerWeek =>
      '1 sm u dy or 1/2 pl dy or 3 med us per wk';

  @override
  String
      get txtMoreThanOneSmallUnitDailyOrMoreThanHalfPlateDailyOrMoreThanThreeMediumUnitsPerWeek =>
          'MT 1 sm u dy or MT 1/2 pl dy or MT 3 med us per wk';

  @override
  String
      get txtThreeMediumUnitsPerWeekOrOneThirdRawPlateDailyOrOneFourthCookedPlateDaily =>
          '3 med us per wk or 1/3 raw pl dy or 1/4 cooked pl dy';

  @override
  String
      get txtOneMediumUnitPerWeekOrOneFourthRawPlateDailyOrOneFourthCookedPlateFourTimesPerWeek =>
          '1 med u per wk or 1/4 raw pl dy or 1/4 cooked pl 4 times/wk';

  @override
  String
      get txtLessThanOneMediumUnitPerWeekOrLessThanOneFourthRawPlateDailyOrLessThanOneFourthCookedPlateFourTimesPerWeek =>
          'LT 1 med u per wk or LT 1/4 raw pl dy or LT 1/4 cooked pl 4 times/wk';

  @override
  String get txtOneMediumUnitDailyOrTwoSmallUnitsDaily =>
      '1 med u dy or 2 sm us dy';

  @override
  String get txtOneSmallUnitDaily => '1 sm u dy';

  @override
  String get txtLessThanOneSmallUnitDaily => 'LT 1 sm u dy';

  @override
  String get txtOneSliceOfBreadOrOneSmallMignonOrThreeWaterCrackers =>
      '1 slice of bread or 1 sm mignon or 3 water crackers';

  @override
  String get txtTwoSlicesOfSandBreadOrTwoSmallMignonsOrSixWaterCrackers =>
      '2 slices of sand bread or 2 sm mignons or 6 water crackers';

  @override
  String
      get txtMoreThanTwoSlicesOfSandBreadOrMoreThanTwoSmallMignonsOrMoreThanSixWaterCrackers =>
          'MT 2 slices of sand bread or MT 2 sm mignons or MT 6 water crackers';

  @override
  String get txtQuarterPlateDailyOrOneServingOfDoughDaily =>
      '1/4 pl dy or 1 serv of dough dy';

  @override
  String get txtHalfPlateDailyOrTwoServingsOfDoughDaily =>
      '1/2 pl dy or 2 servs of dough dy';

  @override
  String get txtMoreThanHalfPlateDailyOrMoreThanTwoServingsOfDoughDaily =>
      'MT 1/2 pl dy or MT 2 servs of dough dy';

  @override
  String get txtHalfPlatePerDayOrTwoServingsOfDough =>
      '1/2 pl per day or 2 servs of dough';

  @override
  String get txtMoreThanHalfPlatePerDayOrMoreThanTwoServingsOfDoughPerDay =>
      'MT 1/2 pl per day or MT 2 servs of dough per day';

  @override
  String get txtThreeQuartersCupBreakfastTypeDailyOrTwoCupsTeaTypeDaily =>
      '3/4 cup breakfast type dy or 2 cups tea type dy';

  @override
  String get txtHalfCupBreakfastTypeDailyOrOneCupTeaTypeDaily =>
      '1/2 cup breakfast type dy or 1 cup tea type dy';

  @override
  String get txtLessThanHalfCupBreakfastTypeDailyOrLessThanOneCupTeaTypeDaily =>
      'LT 1/2 cup breakfast type dy or LT 1 cup tea type dy';

  @override
  String
      get txtOneServingTheSizeOfSmallMatchboxOrSizeOfHalfSUBECardOrTwoTableSpoons =>
          '1 serv the sz of a sm matchbox or sz of 1/2 SUBE card or 2 tbsp';

  @override
  String get txtHalfServingTheSizeOfSmallMatchboxOrOneDieOrOneTableSpoon =>
      '1/2 serv the sz of a sm matchbox or 1 die or 1 tbsp';

  @override
  String
      get txtLessThanHalfServingTheSizeOfSmallMatchboxOrLessThanOneDieOrLessThanOneTableSpoon =>
          'LT 1/2 serv the sz of a sm matchbox or LT 1 die or LT 1 tbsp';

  @override
  String
      get txtHalfMediumSteakPerDayOrOneAndHalfEggsDailyOrOneMediumMincedMeat =>
          '1/2 med steak per day or 1 and 1/2 eggs dy or 1 med minced meat';

  @override
  String get txtOneMediumSteakDailyOrUpToTwoEggUnitsDailyOrOneServingTheSizeOfSliceOfVealPlusOneEggDaily =>
      '1 med steak dy or up to 2 egg us dy or 1 serv the sz of a slice of veal + 1 egg dy';

  @override
  String get txtMoreThanOneMediumSteakDailyOrMoreThanTwoEggUnitsDailyOrMoreThanOneServingTheSizeOfSliceOfVealPlusOneEggDaily =>
      'MT 1 med steak dy or MT 2 egg us dy or MT 1 serv the sz of a slice of veal + 1 egg dy';

  @override
  String get txtOneMediumServingPerWeekOrOneCanPerWeek =>
      '1 med serv per wk or 1 can per wk';

  @override
  String get txtOneSmallServingPerWeekOrHalfCanPerWeek =>
      '1 sm serv per wk or 1/2 can per wk';

  @override
  String get txtLessThanOneSmallServingPerWeekOrLessThanHalfCanPerWeek =>
      'LT 1 sm serv per wk or LT 1/2 can per wk';

  @override
  String
      get txtFourWalnutHalvesOrEightAlmondsOrOneTableSpoonOfSeedsOrPeanutsDaily =>
          '4 walnut halves or 8 almonds or 1 tbsp of seeds or peanuts dy';

  @override
  String
      get txtTwoWalnutHalvesOrFourAlmondsOrOneTeaspoonOfSeedsOrPeanutsDaily =>
          '2 walnut halves or 4 almonds or 1 teaspoon of seeds or peanuts dy';

  @override
  String get txtLessThanTwoWalnutHalvesOrLessThanFourAlmondsOrLessThanOneTeaspoonOfSeedsOrPeanutsDaily =>
      'LT 2 walnut halves or LT 4 almonds or LT 1 teaspoon of seeds or peanuts dy';

  @override
  String get txtTwoTableSpoonsDessertTypeDaily => '2 tbsp dessert type dy';

  @override
  String get txtOneTableSpoonDessertTypeDaily => '1 tbsp dessert type dy';

  @override
  String get txtLessThanOneTableSpoonDessertTypeDaily =>
      'LT 1 tbsp dessert type dy';

  @override
  String get txtOneAndHalfPlatePerWeek => '1 and 1/2 pl per wk';

  @override
  String get txtFourPlatesPerWeek => '4 pls per wk';

  @override
  String get txtTwoPlatesPerWeek => '2 pls per wk';

  @override
  String get txtLessThanTwoPlatesPerWeek => 'LT 2 pls per wk';

  @override
  String get txtOnePlatePerWeekOrHalfPlatePlusOneMedallionPerWeek =>
      '1 pl per wk or 1/2 pl + 1 medallion per wk';

  @override
  String get txtHalfPlatePerWeekOrQuarterPlatePlusOneMedallionPerWeek =>
      '1/2 pl per wk or 1/4 pl + 1 medallion per wk';

  @override
  String get txtLessThanHalfPlatePerWeekOrQuarterPlatePlusOneMedallionPerWeek =>
      'LT 1/2 pl per wk or 1/4 pl + 1 medallion per wk';

  @override
  String get txtOneThirdPlateDailyOrUpToThreeMediumUnitsPerWeek =>
      '1/3 pl dy or up to 3 med us per wk';

  @override
  String get txtHalfPlateOrUpToFiveSmallUnitsPerWeek =>
      '1/2 pl or up to 5 sm us per wk';

  @override
  String get txtMoreThanHalfPlateOrMoreThanFiveSmallUnitsPerWeek =>
      'MT 1/2 pl or MT 5 sm us per wk';

  @override
  String
      get txtFourMediumUnitsPerWeekOrHalfRawPlateDailyOrQuarterCookedPlateDaily =>
          '4 med us per wk or 1/2 raw pl dy or 1/4 cooked pl dy';

  @override
  String get txtTwoMediumUnitsPerWeekOrQuarterPlateDaily =>
      '2 med us per wk or 1/4 pl dy';

  @override
  String get txtLessThanTwoMediumUnitsPerWeekOrQuarterPlateDaily =>
      'LT 2 med us per wk or 1/4 pl dy';

  @override
  String get txtOneAndHalfLargeUnitPerDayOrTwoMediumUnitsPerDay =>
      '1 and 1/2 large u per day or 2 med us per day';

  @override
  String get txtOneMediumUnitPerDay => '1 med u per day';

  @override
  String get txtLessThanOneMediumUnitPerDay => 'LT 1 med u per day';

  @override
  String get txtUpToTwoSlicesOfBreadPerDayOrTwoSmallMignonsOrSixWaterBiscuits =>
      'up to 2 slices of bread per day or 2 sm mignons or 6 water biscuits';

  @override
  String
      get txtThreeSlicesOfBreadPerDayOrThreeSmallMignonsOrNineWaterBiscuits =>
          '3 slices of bread per day or 3 sm mignons or 9 water biscuits';

  @override
  String get txtMoreThanThreeSlicesOfBreadPerDayOrMoreThanThreeSmallMignonsOrMoreThanNineWaterBiscuits =>
      'MT 3 slices of bread per day or MT 3 sm mignons or MT 9 water biscuits';

  @override
  String get txtQuarterPlateOfWholeWheatPastaPerDayOrOnePortionOfDough =>
      '1/4 pl of whole wheat pasta per day or 1 portion of dough';

  @override
  String get txtHalfPlatePerDayOrTwoPortionsOfDough =>
      '1/2 pl per day or 2 port of dough';

  @override
  String get txtMoreThanHalfPlatePerDayOrTwoPortionsOfDough =>
      'MT 1/2 pl per day or 2 port of dough';

  @override
  String get txtMoreThanHalfPlatePerDayOrMoreThanTwoPortionsOfDoughPerDay =>
      'MT 1/2 pl per day or MT 2 port of dough per day';

  @override
  String get txtTwoTeacups => '2 teacups';

  @override
  String get txtOneTeacupDaily => '1 teacup dy';

  @override
  String get txtLessThanOneTeacupDaily => 'LT 1 teacup dy';

  @override
  String get txtOnePortionTheSizeOfSmallMatchboxOrHalfTheSizeOfSUBECardOrTwoTableSpoonsDaily =>
      '1 port the sz of a sm matchbox or half the sz of a SUBE card or 2 tbsp dy';

  @override
  String get txtOnePortionTheSizeOfDiceOrOneTableSpoonDaily =>
      '1 port, the sz of a dice or 1 tbsp dy';

  @override
  String
      get txtLessThanOnePortionTheSizeOfSmallMatchboxOrLessThanOneDieOrLessThanOneTableSpoon =>
          'LT 1 port the sz of a sm matchbox or LT 1 die or LT 1 tbsp';

  @override
  String get txtOneSmallPortionWithoutWasteDailyOrUpToTwoEggUnitsDailyOrOnePortionTheSizeOfSliceOfVealPlusOneEggDaily =>
      '1 sm port without waste dy or up to 2 egg us dy or 1 port the sz of a slice of veal + 1 egg dy';

  @override
  String get txtTwoSmallPortionsWithoutWasteDailyOrUpToFourEggUnitsDailyOrOneSmallPortionPlusTwoEggUnits =>
      '2 sm ports without waste dy or up to 4 egg us dy or 1 sm port + 2 egg us';

  @override
  String get txtMoreThanTwoSmallPortionsWithoutWasteDailyOrMoreThanFourEggUnitsDailyOrMoreThanOneSmallPortionPlusTwoEggUnits =>
      'MT 2 sm ports without waste dy or MT 4 egg us dy or MT 1 sm port + 2 egg us';

  @override
  String get txtTwoMediumPortionsOrTwoCansPerWeek =>
      '2 med port or 2 cans per wk';

  @override
  String get txtOneMediumPortionOrOneCanPerWeek =>
      '1 med portion or 1 can per wk';

  @override
  String get txtLessThanOneMediumPortionOrLessThanOneCanPerWeek =>
      'LT 1 med portion or 1 can per wk';

  @override
  String get txtEightWalnutHalvesOrFifteenAlmondsOrTwoDessertTableSpoonsOfSeedsOrPeanutsPerDay =>
      '8 walnut halves or 15 almonds or 2 dessert tbsp of seeds or peanuts per day';

  @override
  String
      get txtFourWalnutHalvesOrEightAlmondsOrOneTableSpoonDailyOfSeedsOrPeanuts =>
          '4 walnut halves or 8 almonds or 1 tbsp dy of seeds or peanuts';

  @override
  String get txtLessThanFourWalnutHalvesOrLessThanEightAlmondsOrLessThanOneTableSpoonDailyOfSeedsOrPeanuts =>
      'LT 4 walnut halves or LT 8 almonds or LT 1 tbsp dy of seeds or peanuts';

  @override
  String get txtTwoTableSpoonsDaily => '2 tbsp dy';

  @override
  String get txtOneTableSpoonDaily => '1 tbsp dy';

  @override
  String get txtLessThanOneTableSpoonDaily => 'LT 1 tbsp dy';

  @override
  String get txtOneAndHalfDishPerWeek => '1 and 1/2 dish per wk';

  @override
  String get txtOneDishPerWeek => '1 dish per wk';

  @override
  String get txtLessThanOneDishPerWeek => 'LT 1 dish per wk';

  @override
  String get txtFiveDishesPerWeek => '5 dishes per wk';

  @override
  String get txtThreeDishesPerWeek => '3 dishes per wk';

  @override
  String get txtLessThanThreeDishesPerWeek => 'LT 3 dishes per wk';

  @override
  String get txtOneAndHalfDishPerWeekOrOneDishPlusOneMedallionPerWeek =>
      '1 and 1/2 dish per wk or 1 dish + 1 medallion per wk';

  @override
  String get txtOneDishPerWeekOrHalfDishPlusOneMedallionPerWeek =>
      '1 dish per wk or 1/2 dish + 1 medallion per wk';

  @override
  String get txtLessThanOneDishPerWeekOrHalfDishPlusOneMedallionPerWeek =>
      'LT 1 dish per wk or 1/2 dish + 1 medallion per wk';

  @override
  String get txtHalfDishDailyOrUpToFiveSmallUnitsPerWeek =>
      '1/2 dish dy or up to 5 sm us per wk';

  @override
  String get txtThreeQuartersDishDailyOrSmallUnitEveryDay =>
      '3/4 dish dy or sm u every day';

  @override
  String get txtMoreThanThreeQuartersDishDailyOrSmallUnitEveryDay =>
      'MT 3/4 dish dy or sm u every day';

  @override
  String
      get txtFiveMediumUnitsPerWeekOrHalfRawDishDailyOrQuarterCookedDishDaily =>
          '5 med us per wk or 1/2 raw dish dy or 1/4 cooked dish dy';

  @override
  String
      get txtTwoAndHalfMediumUnitsPerWeekOrOneThirdRawDishDailyOrQuarterCookedDish =>
          '2 and 1/2 med us per wk or 1/3 raw dish dy or 1/4 cooked dish';

  @override
  String
      get txtLessThanTwoAndHalfMediumUnitsPerWeekOrLessThanOneThirdRawDishDailyOrLessThanQuarterCookedDish =>
          'LT 2 and 1/2 med us per wk or 1/3 raw dish dy or 1/4 cooked dish';

  @override
  String get txtHalfDishOfPastaPerDayOrTwoServingsOfDoughPerDay =>
      '1/2 dish of pasta per day or 2 servs of dough per day';

  @override
  String get txtThreeQuartersDishPerDayOrTwoServingsOfDoughPerDay =>
      '3/4 dish per day or 2 servs of dough per day';

  @override
  String get txtMoreThanThreeQuartersDishPerDayOrMoreThanTwoServingsPerDay =>
      'MT 3/4 dish per day or MT 2 servs per day';

  @override
  String get txtHalfDishPerDayOrTwoServingsOfDoughPerDay =>
      '1/2 dish per day or 2 servs of dough per day';

  @override
  String get txtThreeQuartersDishPerDayOrThreeServingsOfDoughPerDay =>
      '3/4 dish per day or 3 servs of dough per day';

  @override
  String
      get txtMoreThanThreeQuartersDishPerDayOrMoreThanThreeServingsOfDoughPerDay =>
          'MT 3/4 dish per day or MT 3 servs of dough per day';

  @override
  String get txtTwoBreakfastCupSizeDaily => '2 breakfast cup sz dy';

  @override
  String get txtOneBreakfastCupSizeDaily => '1 breakfast cup sz dy';

  @override
  String get txtLessThanOneBreakfastCupSizeDaily => 'LT 1 breakfast cup sz dy';

  @override
  String
      get txtOnePortionTheSizeOfSmallMatchboxOrHalfSUBECardOrTwoTableSpoonsDaily =>
          '1 port, the sz of a sm matchbox or 1/2 SUBE card or 2 tbsp dy';

  @override
  String
      get txtOneSmallPortionWithoutWasteDailyOrUpToTwoEggUnitsOrHalfSmallPortionPlusOneEgg =>
          '1 sm port without waste dy or up to 2 egg us or 1/2 sm port + 1 egg';

  @override
  String
      get txtTenWalnutHalvesOrTwentyAlmondsOrTwoDessertTableSpoonsOfSeedsOrPeanutsPerDay =>
          '10 walnut halves or 20 almonds or 2 tbsp per day of seeds or peanuts';

  @override
  String
      get txtFiveWalnutHalvesOrTenAlmondsOrOneTableSpoonDailyOfSeedsOrPeanuts =>
          '5 walnut halves or 10 almonds or 1 tbsp dy of seeds or peanuts';

  @override
  String
      get txtLessThanFiveWalnutHalvesOrLessThanTenAlmondsOrLessThanOneTableSpoonDailyOfSeedsOrPeanuts =>
          'LT 5 walnut halves or 10 almonds or 1 tbsp dy of seeds or peanuts';

  @override
  String get txtTwoTableSpoonsPerDay => '2 tbsp per day';

  @override
  String get txtOneTableSpoonPerDay => '1 tbsp per day';

  @override
  String get txtLessThanOneTableSpoonPerDay => 'LT 1 tbsp per day';

  @override
  String get txtThreePlatesPerWeekOrOneSmallUnitPerDay =>
      '3 pls per wk or 1 sm u per day';

  @override
  String get txtOneAndHalfPlatesPerWeekOrOneSmallUnitEveryOtherDay =>
      '1 and 1/2 pls per wk or 1 sm u every other day';

  @override
  String
      get txtLessThanOneAndHalfPlatesPerWeekOrLessThanOneSmallUnitEveryOtherDay =>
          'LT 1 and 1/2 pls per wk or LT 1 sm u every other day';

  @override
  String
      get txtHalfSmallUnitPerDayOrQuarterPlatePerDayOrThreeSmallUnitsPerWeek =>
          '1/2 sm u per day or 1/4 pl per day or 3 sm us per wk';

  @override
  String get txtOneSmallUnitPerDayOrHalfPlatePerDayOrThreeMediumUnitsPerWeek =>
      '1 sm u per day or 1/2 pl per day or 3 med us per wk';

  @override
  String
      get txtMoreThanOneSmallUnitPerDayOrMoreThanHalfPlatePerDayOrMoreThanThreeMediumUnitsPerWeek =>
          'MT 1 sm u per day or MT 1/2 pl per day or MT 3 med us per wk';

  @override
  String get txtThreeMediumUnitsPerWeekOrOneThirdRawPlateOrQuarterCookedPlate =>
      '3 med us per wk or 1/3 raw pl or 1/4 cooked pl';

  @override
  String
      get txtOneMediumUnitPerWeekOrQuarterRawPlatePerDayOrQuarterPlateFourTimesPerWeek =>
          '1 med u per wk or 1/4 raw pl per day or 1/4 pl 4 times/wk';

  @override
  String
      get txtLessThanOneMediumUnitPerWeekOrQuarterRawPlatePerDayOrQuarterPlateFourTimesPerWeek =>
          'LT 1 med u per wk or 1/4 raw pl per day or 1/4 pl 4 times/wk';

  @override
  String get txtTwoMediumUnitsPerDay => '2 med us per day';

  @override
  String get txtUpToOneSlicePerDayOrOneSmallMignonPerDay =>
      'up to 1 slice per day or 1 sm mignon per day';

  @override
  String get txtTwoSlicesPerDayOrTwoSmallMignonsPerDay =>
      '2 slices per day or 2 sm mignons per day';

  @override
  String get txtMoreThanTwoSlicesPerDayOrMoreThanTwoSmallMignonsPerDay =>
      'MT 2 slices per day or MT 2 sm mignons per day';

  @override
  String get txtQuarterPlatePerDayOfWholeWheatPastaOrOneServingOfDoughPerDay =>
      '1/4 pl per day of whole wheat pasta or 1 serv of dough per day';

  @override
  String get txtHalfPlatePerDayOrTwoServingsOfDoughPerDay =>
      '1/2 pl per day or 2 servs of dough per day';

  @override
  String get txtMoreThanHalfPlatePerDayOrMoreThanTwoServingsPerDay =>
      'MT 1/2 pl per day or MT 2 servs per day';

  @override
  String get txtThreeQuartersCupForBreakfastDailyOrTwoTeaCupsDaily =>
      '3/4 cup for breakfast dy or 2 tea cups dy';

  @override
  String get txtHalfCupForBreakfastOrOneTeaCupDaily =>
      '1/2 cup for breakfast or 1 tea cup dy';

  @override
  String get txtLessThanHalfCupForBreakfastOrLessThanOneTeaCup =>
      'LT 1/2 cup for breakfast or LT 1 tea cup';

  @override
  String
      get txtOnePortionTheSizeOfSmallMatchboxOrHalfSUBECardOrTwoTableSpoons =>
          '1 portion the sz of a sm matchbox or 1/2 SUBE card or 2 tbsp';

  @override
  String get txtOnePortionTheSizeOfADie => '1 portion the sz of a die';

  @override
  String get txtLessThanOnePortionTheSizeOfADie =>
      'LT 1 portion the sz of a die';

  @override
  String
      get txtOneSmallPortionWithoutWasteFiveTimesPerWeekOrHalfSmallPortionPlusOneEggDaily =>
          '1 sm port without waste 5 times/wk or 1/2 sm port + 1 egg dy';

  @override
  String
      get txtOneMediumPortionWithoutWasteDailyOrOneSmallPortionPlusOneEggDaily =>
          '1 med port without waste dy or 1 sm port + 1 egg dy';

  @override
  String
      get txtMoreThanOneMediumPortionWithoutWasteDailyOrMoreThanOneSmallPortionPlusOneEggDaily =>
          'MT 1 med port without waste dy or MT 1 sm port + 1 egg dy';

  @override
  String get txtTwoSmallPortionsPerWeekOrOneAndHalfCansPerWeek =>
      '2 sm port per wk or 1 and 1/2 cans/wk';

  @override
  String get txtOneSmallPortionPerWeekOrOneCanPerWeek =>
      '1 sm portion per wk or 1 can/wk';

  @override
  String get txtLessThanOneSmallPortionPerWeekOrLessThanOneCanPerWeek =>
      'LT 1 sm portion per wk or 1 can/wk';

  @override
  String
      get txtSixWalnutHalvesOrTenAlmondsOrOneTableSpoonDailyOfSeedsOrPeanuts =>
          '6 walnut halves or 10 almonds or 1 tbsp dy of seeds or peanuts';

  @override
  String
      get txtThreeWalnutHalvesOrFiveAlmondsOrHalfTableSpoonDailyOfSeedsOrPeanuts =>
          '3 walnut halves or 5 almonds or 1/2 tbsp dy of seeds or peanuts';

  @override
  String
      get txtLessThanThreeWalnutHalvesOrLessThanFiveAlmondsOrLessThanHalfTableSpoonDailyOfSeedsOrPeanuts =>
          'LT 3 walnut halves or 5 almonds or 1/2 tbsp dy of seeds or peanuts';

  @override
  String get txtTwoDessertSpoonsPerDay => '2 dessert spoons per day';

  @override
  String get txtOneDessertSpoonPerDay => '1 dessert spoon per day';

  @override
  String get txtLessThanOneDessertSpoonPerDay => 'LT 1 dessert spoon per day';

  @override
  String get txtOneAndHalfPlatesPerWeek => '1 and 1/2 pls per wk';

  @override
  String
      get txtFiveAndHalfPlatesPerWeekOrOneMediumUnitPerDayOrThreeQuartersPlatePerDay =>
          '5 and 1/2 pls per wk or 1 med u per day or 3/4 pl per day';

  @override
  String get txtThreePlatesPerWeekOrOneSmallUnitPerDayOrOneThirdPlatePerDay =>
      '3 pls per wk or 1 sm u per day or 1/3 pl per day';

  @override
  String
      get txtLessThanThreePlatesPerWeekOrLessThanOneDailyUnitOrLessThanOneThirdPlatePerDay =>
          'LT 3 pls per wk or LT 1 dy u or LT 1/3 pl per day';

  @override
  String
      get txtOneAndHalfPlatesPerWeekOrHalfPlateThreeTimesPerWeekOrOneMedallionPerDay =>
          '1 and 1/2 pls per wk or 1/2 pl 3 times per wk or 1 medallion per day';

  @override
  String
      get txtOnePlatePerWeekOrHalfPlatePerWeekOrOneMedallionThreeTimesPerWeek =>
          '1 pl per wk or 1/2 pl per wk or 1 medallion 3 times per wk';

  @override
  String
      get txtLessThanOnePlatePerWeekOrLessThanHalfPlatePerWeekOrLessThanOneMedallionThreeTimesPerWeek =>
          'LT 1 pl per wk or LT 1/2 pl per wk or LT 1 medallion 3 times per wk';

  @override
  String
      get txtOneSmallUnitPerDayOrThreeMediumUnitsPerWeekOrOneThirdPlatePerDay =>
          '1 sm u per day or 3 med us per wk or 1/3 pl per day';

  @override
  String
      get txtOneMediumUnitPerDayOrThreeLargeUnitsPerWeekOrThreeQuartersPlatePerDay =>
          '1 med u per day or 3 large us per wk or 3/4 pl per day';

  @override
  String
      get txtMoreThanOneMediumUnitPerDayOrMoreThanThreeLargeUnitsPerWeekOrMoreThanThreeQuartersPlatePerDay =>
          'MT 1 med u per day or MT 3 large us per wk or MT 3/4 pl per day';

  @override
  String
      get txtFiveMediumUnitsPerWeekOrHalfRawPlateDailyOrQuarterCookedPlateDaily =>
          '5 med us per wk or 1/2 raw pl dy or 1/4 cooked pl dy';

  @override
  String
      get txtTwoAndHalfMediumUnitsPerWeekOrOneThirdRawPlateDailyOrQuarterCookedPlate =>
          '2 1/2 med us per wk or 1/3 raw pl dy or 1/4 cooked pl';

  @override
  String
      get txtLessThanTwoAndHalfMediumUnitsPerWeekOrLessThanOneThirdRawPlateDailyOrLessThanQuarterCookedPlate =>
          'LT 2 1/2 med us per wk or LT 1/3 raw pl dy or LT 1/4 cooked pl';

  @override
  String
      get txtOneAndHalfLargeUnitPerDayOrTwoMediumUnitsPerDayOrThreeSmallUnits =>
          '1 1/2 large u per day or 2 med us per day or 3 sm us';

  @override
  String get txtOneMediumUnitPerDayOrTwoSmallUnits =>
      '1 med u per day or 2 sm us';

  @override
  String get txtLessThanOneMediumUnitPerDayOrLessThanTwoSmallUnitsPerDay =>
      'LT 1 med u per day or LT 2 sm us per day';

  @override
  String get txtUpToTwoMoldTypeSlicesPerDayOrTwoSmallMignonsPerDay =>
      'up to 2 mold type slices per day or 2 sm mignons per day';

  @override
  String get txtThreeMoldTypeSlicesPerDayOrThreeSmallMignonsPerDay =>
      '3 mold type slices per day or 3 sm mignons per day';

  @override
  String
      get txtMoreThanThreeMoldTypeSlicesPerDayOrMoreThanThreeSmallMignonsPerDay =>
          'MT 3 mold type slices per day or MT 3 sm mignons per day';

  @override
  String get txtQuarterPlateOfWholeWheatPastaPerDayOrOneServingOfDough =>
      '1/4 pl of whole wheat pasta per day or 1 serv of dough';

  @override
  String get txtTwoBreakfastTypeCups => '2 breakfast type cups';

  @override
  String get txtOneBreakfastTypeCup => '1 breakfast type cup';

  @override
  String get txtLessThanOneBreakfastTypeCup => 'LT 1 breakfast type cup';

  @override
  String
      get txtOneSmallMatchboxSizePortionOrHalfSUBECardOrTwoTableSpoonsDaily =>
          '1 sm matchbox sz port or 1/2 SUBE card or 2 tbsp dy';

  @override
  String get txtOneDiceSizePortionOrOneTableSpoonDaily =>
      '1 dice sz port or 1 tbsp dy';

  @override
  String get txtLessThanOneDiceSizePortionOrLessThanOneTableSpoonDaily =>
      'LT 1 dice sz port or LT 1 tbsp dy';

  @override
  String get txtOneSmallPortionWithoutWasteDailyOrUpToTwoEggUnitsDailyOrOneSliceSizePortionOfPecetoPlusOneEggDaily =>
      '1 sm port without waste dy or up to 2 egg us dy or 1 slice sz port of peceto + 1 egg dy';

  @override
  String get txtTwoSmallPortionsWithoutWasteDailyOrUpToFourEggUnitsDailyOrOneSmallPortionPlusTwoEggUnitsDaily =>
      '2 sm ports without waste dy or up to 4 egg us dy or 1 sm port + 2 egg us dy';

  @override
  String get txtMoreThanTwoSmallPortionsWithoutWasteDailyOrMoreThanFourEggUnitsDailyOrMoreThanOneSmallPortionPlusTwoEggUnitsDaily =>
      'MT 2 sm ports without waste dy or MT 4 egg us dy or MT 1 sm port + 2 egg us dy';

  @override
  String
      get txtTenWalnutHalvesOrTwentyAlmondsOrTwoTableSpoonsDailyOfSeedsOrPeanuts =>
          '10 walnut halves or 20 almonds or 2 tbsp dy of seeds or peanuts';

  @override
  String
      get txtHalfPlateCookedDailyOrThreeQuartersPlateRawDailyOrSixMediumUnitsPerWeek =>
          '1/2 pl cooked dy or 3/4 pl raw dy or 6 med us per wk';

  @override
  String
      get txtQuarterPlateCookedDailyOrHalfPlateRawDailyOrThreeMediumUnitsPerWeek =>
          '1/4 pl cooked dy or 1/2 pl raw dy or 3 med us per wk';

  @override
  String
      get txtLessThanQuarterPlateCookedDailyOrLessThanHalfPlateRawDailyOrLessThanThreeMediumUnitsPerWeek =>
          'LT 1/4 pl cooked dy or LT 1/2 pl raw dy or LT 3 med us per wk';

  @override
  String get txtTwoPlatesPerWeekOrOnePlatePlusTwoMedallionsPerWeek =>
      '2 pls per wk or 1 pl + 2 medallions per wk';

  @override
  String
      get txtLessThanOnePlatePerWeekOrLessThanHalfPlatePlusOneMedallionPerWeek =>
          'LT 1 pl per wk or LT 1/2 pl + 1 medallion per wk';

  @override
  String
      get txtUpToSixSmallUnitsPerWeekOrThreeLargeUnitsPerWeekOrHalfPlateDaily =>
          'up to 6 sm us/wk or 3 large us/wk or 1/2 pl dy';

  @override
  String get txtUpToNineUnitsPerWeekOrFiveLargeUnitsPerWeekOrOnePlateDaily =>
      'up to 9 us/wk or 5 large us/wk or 1 pl dy';

  @override
  String
      get txtMoreThanNineUnitsPerWeekOrMoreThanFiveLargeUnitsPerWeekOrMoreThanOnePlateDaily =>
          'MT 9 us/wk or MT 5 large us/wk or MT 1 pl dy';

  @override
  String
      get txtOneMediumUnitDailyOrThreeQuartersPlateRawDailyOrHalfPlateCookedDaily =>
          '1 med u dy or 3/4 pl raw dy or 1/2 pl cooked dy';

  @override
  String get txtOneSmallUnitDailyOrHalfPlateRawDailyOrQuarterPlateCookedDaily =>
      '1 sm u dy or 1/2 pl raw dy or 1/4 pl cooked dy';

  @override
  String
      get txtLessThanOneSmallUnitDailyOrLessThanHalfPlateRawDailyOrLessThanQuarterPlateCookedDaily =>
          'LT 1 sm u dy or 1/2 pl raw dy or 1/4 pl cooked dy';

  @override
  String get txtTwoLargeUnitsPerDayOrFourSmallUnitsPerDay =>
      '2 large us per day or 4 sm us per day';

  @override
  String get txtOneLargeUnitPerDayOrTwoSmallUnitsPerDay =>
      '1 large u per day or 2 sm us per day';

  @override
  String get txtLessThanOneLargeUnitPerDayOrLessThanTwoSmallUnitsPerDay =>
      'LT 1 large u per day or 2 sm us per day';

  @override
  String get txtThreeSlicesPerDayOrTwoSmallMedallions =>
      '3 slices per day or 2 sm medallions';

  @override
  String get txtSixSlicesPerDayOrFourSmallMedallionsOrTwoSmallFlutes =>
      '6 slices per day or 4 sm medallions or 2 sm flutes';

  @override
  String
      get txtMoreThanSixSlicesPerDayOrMoreThanFourSmallMedallionsOrMoreThanTwoSmallFlutes =>
          'MT 6 slices per day or MT 4 sm medallions or MT 2 sm flutes';

  @override
  String get txtHalfPlateOfWholeWheatPastaPerDayOrOneAndHalfPortionOfDoughPerDay =>
      '1/2 pl of whole wheat pasta per day or 1 and 1/2 port of dough per day';

  @override
  String get txtOnePlatePerDayOrThreePortionsOfDoughPerDay =>
      '1 pl per day or 3 port of dough per day';

  @override
  String get txtMoreThanOnePlatePerDayOrMoreThanThreePortionsOfDoughPerDay =>
      'MT 1 pl per day or MT 3 port of dough per day';

  @override
  String get txtTwoBreakfastCups => '2 breakfast cups';

  @override
  String get txtOneBreakfastCup => '1 breakfast cup';

  @override
  String get txtLessThanOneBreakfastCup => 'LT 1 breakfast cup';

  @override
  String get txtOnePortionTheSizeOfADiceOrOneTableSpoon =>
      '1 portion the sz of a dice or 1 tbsp';

  @override
  String get txtLessThanOnePortionTheSizeOfADiceOrLessThanOneTableSpoon =>
      'LT 1 portion the sz of a dice or LT 1 tbsp';

  @override
  String get txtOneMediumPortionWithoutWasteDailyOrUpToThreeEggsDailyOrOneSmallPortionPlusTwoEggsDaily =>
      '1 med port without waste dy or up to 3 eggs dy or 1 sm port + 2 eggs dy';

  @override
  String
      get txtTwoSmallPortionsWithoutWasteDailyOrUpToFourEggsOrOneMediumPortionPlusTwoEggs =>
          '2 sm ports without waste dy or up to 4 eggs or 1 med port + 2 eggs';

  @override
  String get txtMoreThanTwoSmallPortionsWithoutWasteDailyOrUpToFourEggsDailyOrMoreThanOneMediumPortionPlusTwoEggs =>
      'MT 2 sm ports without waste dy or up to 4 eggs dy or 1 med port + 2 eggs';

  @override
  String
      get txtTwoLargePortionsPerWeekOrTwoCansPerWeekOrOneThirdPlateOfCannedFishPerWeek =>
          '2 large port per wk or 2 cans/wk or 1/3 pl of canned fish per wk';

  @override
  String get txtOneMediumPortionPerWeekOrOneCanPerWeekOrQuarterPlatePerWeek =>
      '1 med portion per wk or 1 can/wk or 1/4 pl per wk';

  @override
  String
      get txtLessThanOneMediumPortionPerWeekOrLessThanOneCanPerWeekOrLessThanQuarterPlatePerWeek =>
          'LT 1 med portion per wk or 1 can/wk or 1/4 pl per wk';

  @override
  String get txtTenWalnutHalvesPerDayOrTwentyAlmondsPerDayOrTwoTableSpoonsPerDayOfSeedsOrPeanuts =>
      '10 walnut halves per day or 20 almonds per day or 2 tbsp per day of seeds or peanuts';

  @override
  String get txtFiveWalnutHalvesPerDayOrTenAlmondsPerDayOrOneTableSpoonPerDayOfSeedsOrPeanuts =>
      '5 walnut halves per day or 10 almonds per day or 1 tbsp per day of seeds or peanuts';

  @override
  String get txtLessThanFiveWalnutHalvesPerDayOrLessThanTenAlmondsPerDayOrLessThanOneTableSpoonPerDayOfSeedsOrPeanuts =>
      'LT 5 walnut halves per day or 10 almonds per day or 1 tbsp per day of seeds or peanuts';

  @override
  String get txtThreeTableSpoonsPerDay => '3 tbsp per day';

  @override
  String get txtLessThanOnePortionSizeDiceOrLessThanOneTbspDaily =>
      'LT 1 port, the sz of a dice or LT 1 tbsp dy';

  @override
  String get txtOneSmallPortionWithoutWasteBeefPlusEggDaily =>
      '1 sm port without waste dy or up to 2 egg us dy or 1 port the sz of a slice of beef + 1 egg dy';

  @override
  String get txtTwoAndHalfMedUnitsWkThirdRawFourthCookedPlateDS =>
      '2  1/2 med us per wk or 1/3 raw pl dy or 1/4 cooked pl';

  @override
  String get txtLessThanTwoAndHalfMedUnitsWkThirdRawFourthCookedPlateDS =>
      'LT 2  1/2 med us per wk or LT 1/3 raw pl dy or LT 1/4 cooked pl';

  @override
  String get txtMoreThanNineUnitsWkFiveLargeOnePlateDailyDS =>
      'MT  9 us/wk or MT 5 large us/wk or MT 1 pl dy';
}
