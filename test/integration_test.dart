// Imports
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import 'package:precarina/model/precarina_model.dart';
import 'package:precarina/main_screen.dart';
import 'package:precarina/input_data_page.dart';
import 'package:flutter/material.dart';
import 'package:precarina/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final precarinaModel = PrecarinaModel(); // Create the model instance

  testWidgets('Full app integration test', (WidgetTester tester) async {
    // Pump the app
    await tester.pumpWidget(
      ChangeNotifierProvider<PrecarinaModel>.value(
        value: precarinaModel,
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'), // English
            Locale('es', 'ES'), // Spanish
          ],
          home: const InputDataPage(), // Assuming InputDataPage is the initial screen
        ),
      ),
    );
    await tester.pumpAndSettle(); // Wait for InputDataPage to settle

    // 1. Verify InputDataPage is present.
    //    Looking for the title "Patient Data Input" which is a Text widget.
    //    The key "patientsDataInputTitle" is used with .i18n()
    //    For English, let's assume it's "Patient Data Input"
    expect(find.text('Patient Data Input'), findsOneWidget);

    // 2. Enter patient data:
    // Sex: Tap the "Male" RadioListTile.
    // The text "Male" comes from "sexMale".i18n()
    await tester.tap(find.widgetWithText(RadioListTile, 'Male'));
    await tester.pumpAndSettle();

    // Height: Enter "140,0" into the FormBuilderTextField with name "HeightKey"
    // The mask is '###,#' so we need to include the comma.
    final heightFieldFinder = find.byWidgetPredicate(
      (Widget widget) => widget is FormBuilderTextField && widget.name == 'HeightKey',
    );
    expect(heightFieldFinder, findsOneWidget);
    await tester.enterText(heightFieldFinder, '140,0');
    await tester.pumpAndSettle();

    // Weight Kilos: Enter "35" into the FormBuilderTextField with name "WeightKilos"
    final weightKilosFieldFinder = find.byWidgetPredicate(
      (Widget widget) => widget is FormBuilderTextField && widget.name == 'WeightKilos',
    );
    expect(weightKilosFieldFinder, findsOneWidget);
    await tester.enterText(weightKilosFieldFinder, '35');
    await tester.pumpAndSettle();

    // Weight Grams: Enter "500" into the FormBuilderTextField with name "WeightGrams"
    final weightGramsFieldFinder = find.byWidgetPredicate(
      (Widget widget) => widget is FormBuilderTextField && widget.name == 'WeightGrams',
    );
    expect(weightGramsFieldFinder, findsOneWidget);
    await tester.enterText(weightGramsFieldFinder, '500');
    await tester.pumpAndSettle();
    
    // Age Years: Select "10 years" from FormBuilderDropdown with name "Age Years"
    // The text for "10 years" might be "10 year" or "10 years" depending on localization suffixAno/suffixAnos
    // Assuming "10 years" for English.
    final ageYearsDropdownFinder = find.byWidgetPredicate(
      (Widget widget) => widget is FormBuilderDropdown && widget.name == 'Age Years',
    );
    expect(ageYearsDropdownFinder, findsOneWidget);
    await tester.tap(ageYearsDropdownFinder);
    await tester.pumpAndSettle(); // Wait for dropdown items to appear
    await tester.tap(find.text('10 years').last); // .last is safer if text appears multiple times
    await tester.pumpAndSettle();

    // Age Months: Select "0 months" from FormBuilderDropdown with name "Age Months"
    // Assuming "0 months" for English.
    final ageMonthsDropdownFinder = find.byWidgetPredicate(
      (Widget widget) => widget is FormBuilderDropdown && widget.name == 'Age Months',
    );
    expect(ageMonthsDropdownFinder, findsOneWidget);
    await tester.tap(ageMonthsDropdownFinder);
    await tester.pumpAndSettle(); // Wait for dropdown items to appear
    await tester.tap(find.text('0 months').last);
    await tester.pumpAndSettle();

    // 3. Tap the "Continue" button.
    // The text "Continue" comes from "btnContinue".i18n()
    await tester.tap(find.widgetWithText(ElevatedButton, 'Continue'));
    await tester.pumpAndSettle(); // Wait for navigation

    // 4. Verify navigation to MainScreen.
    // Look for the "Diet" button, text comes from txtDietButton.i18n()
    final dietButtonOnMainScreen = find.widgetWithText(ElevatedButton, 'Diet');
    expect(dietButtonOnMainScreen, findsOneWidget);

    // **DietScreen Test**

    // 1. Navigate to DietScreen
    await tester.tap(dietButtonOnMainScreen);
    await tester.pumpAndSettle();

    // Verify DietScreen is present by its AppBar title "Diet"
    expect(find.widgetWithText(AppBar, 'Diet'), findsOneWidget);
    await tester.pumpAndSettle(); // Ensure screen is fully loaded

    // Data for diet items (Male, 10 years old -> sex index 0, age range index 1)
    // Titles are used to find DietItemWidget, then first ChoiceChip within it.
    // Using i18n keys directly as text finders. This might need adjustment if English strings differ significantly.
    final dietItemTitles = [
      "Vegetales verdes".i18n(),
      "Vegetales rojos/naranjas".i18n(),
      "Legumbres".i18n(),
      "Tubérculos (papa, batata, mandioca)".i18n(),
      "Otros vegetales".i18n(),
      "Frutas".i18n(),
      "Pan".i18n(),
      "Pastas y masas integrales: masa: pizza, tarta, empanada, canelon, masa de taco.".i18n(),
      "Pastas y masas refinadas (No integrales)".i18n(),
      "Lácteos (leche, yogur) parcialmente descremados".i18n(),
      "Quesos semidescremados untables o semisólidos (port salut, muzzarella)".i18n(),
      "Carnes rojas, ave y huevo por día".i18n(),
      "Pescados".i18n(),
      "Frutos secos y semillas".i18n(),
      "Aceites".i18n()
    ];

    // Options for Male, Age 9-13 (indexSex = 0, indexAgeRange = 1)
    // We will tap the first option for each item: opciones[0][1][itemIndex][0]
    final dietItemFirstOptionTexts = [
      "1 and 1/2 pls per wk".i18n(), // Vegetales verdes
      "5 and 1/2 pls per wk or 1 med u per day or 3/4 pl per day".i18n(), // Vegetales rojos/naranjas
      "1 and 1/2 pls per wk or 1/2 pl 3 times per wk or 1 medallion per day".i18n(), // Legumbres
      "1 sm u per day or 3 med us per wk or 1/3 pl per day".i18n(), // Tubérculos
      "5 med us per wk or 1/2 raw pl dy or 1/4 cooked pl dy".i18n(), // Otros vegetales
      "1  1/2 large u per day or 2 med us per day or 3 sm us".i18n(), // Frutas
      "up to 2 mold type slices per day or 2 sm mignons per day".i18n(), // Pan
      "1/4 pl of whole wheat pasta per day or 1 serv of dough".i18n(), // Pastas y masas integrales
      "1/4 pl of whole wheat pasta per day or 1 serv of dough".i18n(), // Pastas y masas refinadas
      "2 breakfast type cups".i18n(), // Lácteos
      "1 sm matchbox sz port or 1/2 SUBE card or 2 tbsp dy".i18n(), // Quesos
      "1 sm port without waste dy or up to 2 egg us dy or 1 slice sz port of peceto + 1 egg dy".i18n(), // Carnes
      "2 med port or 2 cans per wk".i18n(), // Pescados
      "10 walnut halves or 20 almonds or 2 tbsp dy of seeds or peanuts".i18n(), // Frutos secos
      "2 tbsp dy".i18n() // Aceites
    ];

    for (int i = 0; i < dietItemTitles.length; i++) {
      final itemTitle = dietItemTitles[i];
      final chipTextToTap = dietItemFirstOptionTexts[i];

      // Find the DietItemWidget by its title
      // The title is a Text widget within DietItemWidget
      final dietItemFinder = find.widgetWithText(DietItemWidget, itemTitle);
      
      // Scroll to the item if not visible. Drag the list view itself.
      // We find the ListView first.
      final listViewFinder = find.byType(ListView);
      await tester.scrollUntilVisible(dietItemFinder, 50.0, scrollable: listViewFinder);
      await tester.pumpAndSettle();

      // Find the specific ChoiceChip within this DietItemWidget
      final choiceChipFinder = find.descendant(
        of: dietItemFinder,
        matching: find.widgetWithText(ChoiceChip, chipTextToTap),
      );
      expect(choiceChipFinder, findsOneWidget, reason: 'ChoiceChip for "${itemTitle}" with option "${chipTextToTap}" not found');
      
      await tester.tap(choiceChipFinder);
      await tester.pumpAndSettle();
    }

    // 3. Save data and verify MainScreen update
    // Find and tap the "Accept" button. Text "Accept" from AppLocalizations.of(context)!.txtButtonAccept
    final acceptButtonFinder = find.widgetWithText(ElevatedButton, 'Accept');
    await tester.scrollUntilVisible(acceptButtonFinder, 50.0, scrollable: find.byType(ListView)); // Ensure Accept is visible
    await tester.pumpAndSettle();
    expect(acceptButtonFinder, findsOneWidget);
    await tester.tap(acceptButtonFinder);
    await tester.pumpAndSettle(); // Allow SnackBar to appear

    // Handle SnackBar: Find and tap "OK"
    // The SnackBar's action button is a TextButton with text 'OK'
    final snackBarOkButtonFinder = find.widgetWithText(TextButton, 'OK');
    expect(snackBarOkButtonFinder, findsOneWidget);
    await tester.tap(snackBarOkButtonFinder);
    await tester.pumpAndSettle(); // Allow navigation back to MainScreen

    // Verify MainScreen is present again
    expect(dietButtonOnMainScreen, findsOneWidget); // Check for the Diet button on MainScreen

    // Verify dietValue in PrecarinaModel
    // Access the model. The context for Provider.of can be any descendant of the Provider.
    // Here, using the element of the MainScreen (or specifically, the diet button's parent)
    final mainScreenElement = tester.element(dietButtonOnMainScreen);
    final updatedModel = Provider.of<PrecarinaModel>(mainScreenElement, listen: false);
    
    expect(updatedModel.dietValue, isNotNull);
    // We could calculate the expected score, but it's complex. For now, just check it's not null.
    // The first option tapped for each item corresponds to a score of 2 (due to reversal in _calculateScore).
    // There are 15 items. So, 15 * 2 = 30. Then (30 * 3.3333333).round().
    // (30 * 10/3).round() = 100. So dietValue should be 100.
    expect(updatedModel.dietValue, 100);


    // Verify UI update on MainScreen for the diet score (LinearGaugeFlexible)
    // This is complex. The LinearGaugeFlexible is within a Row built by buildOneRow.
    // The first buildOneRow is for Diet.
    final dietRowMatcher = find.ancestor(
        of: dietButtonOnMainScreen,
        matching: find.byType(Row)
    );
    final linearGaugeMatcher = find.descendant(
        of: dietRowMatcher,
        matching: find.byType(LinearGaugeFlexible)
    );
    expect(linearGaugeMatcher, findsOneWidget);

    // Check the valueToSignal property of the LinearGaugeFlexible
    final LinearGaugeFlexible dietGauge = tester.widget<LinearGaugeFlexible>(linearGaugeMatcher);
    expect(dietGauge.valueToSignal, updatedModel.dietValue);
    expect(dietGauge.valueToSignal, 100);

    // **PhysicalActivityScreen Test**
    await tester.pumpAndSettle(); // Ensure MainScreen is settled

    // 1. Navigate to PhysicalActivityScreen
    final physicalActivityButtonOnMainScreen = find.widgetWithText(ElevatedButton, 'Physical Activity');
    expect(physicalActivityButtonOnMainScreen, findsOneWidget, reason: "Physical Activity button on MainScreen not found");
    await tester.tap(physicalActivityButtonOnMainScreen);
    await tester.pumpAndSettle();

    // Verify PhysicalActivityScreen is present (AppBar title or PhysicalActivitySurvey)
    expect(find.widgetWithText(AppBar, 'Physical Activity'), findsOneWidget, reason: "PhysicalActivityScreen AppBar not found");
    expect(find.byType(PhysicalActivitySurvey), findsOneWidget, reason: "PhysicalActivitySurvey widget not found");
    await tester.pumpAndSettle();

    // Helper to find RadioListTile by its title text, ensuring it's visible
    Future<void> tapRadioListTileByText(String text) async {
      final radioFinder = find.widgetWithText(RadioListTile, text);
      await tester.scrollUntilVisible(radioFinder, 50.0, scrollable: find.byType(SingleChildScrollView));
      await tester.pumpAndSettle();
      expect(radioFinder, findsOneWidget, reason: "RadioListTile with text '$text' not found");
      await tester.tap(radioFinder);
      await tester.pumpAndSettle();
    }

    // Helper to find FormBuilderTextField by name, ensuring it's visible, and enter text
    Future<void> enterTextInFormBuilderField(String fieldName, String text) async {
      final textFieldFinder = find.byWidgetPredicate(
        (Widget widget) => widget is FormBuilderTextField && widget.name == fieldName,
      );
      await tester.scrollUntilVisible(textFieldFinder, 50.0, scrollable: find.byType(SingleChildScrollView));
      await tester.pumpAndSettle();
      expect(textFieldFinder, findsOneWidget, reason: "FormBuilderTextField with name '$fieldName' not found");
      await tester.enterText(textFieldFinder, text);
      await tester.pumpAndSettle();
    }
    
    // 2. Interact with PhysicalActivityScreen widgets
    // Q1: Days with physical activity - Tap "3 days" ("physicalActivityQ1Opt4".i18n())
    // Note: RadioListTile values are 0-7. "3 days" corresponds to value 3.
    await tapRadioListTileByText("physicalActivityQ1Opt4".i18n()); // This assumes "physicalActivityQ1Opt4" is the text for "3 days"

    // Q2: Weekly minutes of activity - Enter "180"
    await enterTextInFormBuilderField("WeeklyMinsOfActivity", "180");

    // Q3: Transport to school - Tap "Walking" ("physicalActivityQ3Opt1".i18n())
    await tapRadioListTileByText("physicalActivityQ3Opt1".i18n());

    // Q4: Blocks to school - Enter "10"
    await enterTextInFormBuilderField("BlocksToSchool", "10");
    
    // Q5: PE classes per week - Tap "3 classes" which is "physicalActivityQ5Opt4".i18n() (value 3)
    await tapRadioListTileByText("physicalActivityQ5Opt4".i18n());

    // Q6: Daily minutes of screen time - Enter "60"
    await enterTextInFormBuilderField("DailyMinsOfScreen", "60");

    // 3. Save data and verify MainScreen update
    final acceptButtonPAS = find.widgetWithText(ElevatedButton, 'Accept');
    await tester.scrollUntilVisible(acceptButtonPAS, 50.0, scrollable: find.byType(SingleChildScrollView));
    await tester.pumpAndSettle();
    expect(acceptButtonPAS, findsOneWidget, reason: "'Accept' button on PhysicalActivityScreen not found");
    await tester.tap(acceptButtonPAS);
    await tester.pumpAndSettle(); // Allow SnackBar to appear

    // Handle SnackBar: Find and tap "Ok"
    final snackBarOkButtonPAS = find.widgetWithText(TextButton, 'Ok'); // SnackBar button is 'Ok'
    expect(snackBarOkButtonPAS, findsOneWidget, reason: "SnackBar 'Ok' button not found");
    // Verify SnackBar background color (optional, but good for completeness)
    // For _dailyMinsOfScreenValue = 60, isRedBackground should be false, so default (black)
    final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
    expect(snackBar.backgroundColor, Colors.black, reason: "SnackBar background should be black for non-excessive screen time");

    await tester.tap(snackBarOkButtonPAS);
    await tester.pumpAndSettle(); // Allow navigation back to MainScreen

    // Verify MainScreen is present again
    expect(physicalActivityButtonOnMainScreen, findsOneWidget, reason: "Physical Activity button on MainScreen not found after returning");

    // Verify physicalActivityValue in PrecarinaModel
    // Access the model again (or use the existing `updatedModel` if it's the same instance and scope)
    final paScreenElement = tester.element(physicalActivityButtonOnMainScreen);
    final paModel = Provider.of<PrecarinaModel>(paScreenElement, listen: false);
    
    expect(paModel.physicalActivityValue, isNotNull, reason: "physicalActivityValue is null");
    expect(paModel.physicalActivityValue, 100, reason: "Calculated physicalActivityValue is not 100"); // Based on calculation: tad=25, tate=19, tef=19 => total=63. (100*63/45)=140, capped to 100.

    // Verify UI update on MainScreen for the physical activity score
    final paRowMatcher = find.ancestor(
        of: physicalActivityButtonOnMainScreen,
        matching: find.byType(Row)
    );
    final paLinearGaugeMatcher = find.descendant(
        of: paRowMatcher,
        matching: find.byType(LinearGaugeFlexible)
    );
    expect(paLinearGaugeMatcher, findsOneWidget, reason: "LinearGaugeFlexible for Physical Activity not found");

    final LinearGaugeFlexible paGauge = tester.widget<LinearGaugeFlexible>(paLinearGaugeMatcher);
    expect(paGauge.valueToSignal, paModel.physicalActivityValue, reason: "Gauge value does not match model value for Physical Activity");
    expect(paGauge.valueToSignal, 100, reason: "Gauge value is not 100 for Physical Activity");

    // **SmokeExposureScreen Test**
    await tester.pumpAndSettle(); // Ensure MainScreen is settled

    // 1. Navigate to SmokeExposureScreen
    final smokeExposureButtonOnMainScreen = find.widgetWithText(ElevatedButton, 'Smoke Exposure');
    expect(smokeExposureButtonOnMainScreen, findsOneWidget, reason: "Smoke Exposure button on MainScreen not found");
    await tester.tap(smokeExposureButtonOnMainScreen);
    await tester.pumpAndSettle();

    // Verify SmokeExposureScreen is present by its AppBar title
    expect(find.widgetWithText(AppBar, 'Smoke Exposure'), findsOneWidget, reason: "SmokeExposureScreen AppBar not found");
    await tester.pumpAndSettle();

    // 2. Interact with SmokeExposureScreen widgets
    // Get the text for the "Never exposed" option (score 100), which is the first option.
    // We need a context to access AppLocalizations. Use the context of the screen itself.
    final smokeScreenElement = tester.element(find.byType(SmokeExposureScreen));
    final smokeOptionsTexts = AppLocalizations.of(smokeScreenElement)!.txtSmokeExposureDialogOptions.split("|");
    final neverExposedOptionText = smokeOptionsTexts[0]; // Corresponds to value 100

    final radioNeverExposedFinder = find.widgetWithText(RadioListTile, neverExposedOptionText);
    // Ensure the RadioListTile is visible by scrolling if necessary
    await tester.scrollUntilVisible(radioNeverExposedFinder, 50.0, scrollable: find.byType(SingleChildScrollView));
    await tester.pumpAndSettle();
    expect(radioNeverExposedFinder, findsOneWidget, reason: "RadioListTile for '$neverExposedOptionText' not found");
    
    await tester.tap(radioNeverExposedFinder);
    await tester.pumpAndSettle();

    // 3. Save data and verify MainScreen update
    final acceptButtonSES = find.widgetWithText(ElevatedButton, 'Accept');
    // Ensure the accept button is visible
    await tester.scrollUntilVisible(acceptButtonSES, 50.0, scrollable: find.byType(SingleChildScrollView));
    await tester.pumpAndSettle();
    expect(acceptButtonSES, findsOneWidget, reason: "'Accept' button on SmokeExposureScreen not found");
    
    await tester.tap(acceptButtonSES);
    await tester.pumpAndSettle(); // Allow navigation back to MainScreen

    // Verify MainScreen is present again
    expect(smokeExposureButtonOnMainScreen, findsOneWidget, reason: "Smoke Exposure button on MainScreen not found after returning");

    // Verify smokeValue in PrecarinaModel
    final smokeModel = Provider.of<PrecarinaModel>(smokeScreenElement, listen: false); // Can reuse smokeScreenElement for context
    
    expect(smokeModel.smokeValue, isNotNull, reason: "smokeValue is null");
    expect(smokeModel.smokeValue, 100, reason: "smokeValue is not 100 for 'Never exposed'");

    // Verify UI update on MainScreen for the smoke exposure score
    final smokeRowMatcher = find.ancestor(
        of: smokeExposureButtonOnMainScreen,
        matching: find.byType(Row)
    );
    final smokeLinearGaugeMatcher = find.descendant(
        of: smokeRowMatcher,
        matching: find.byType(LinearGaugeFlexible)
    );
    expect(smokeLinearGaugeMatcher, findsOneWidget, reason: "LinearGaugeFlexible for Smoke Exposure not found");

    final LinearGaugeFlexible smokeGauge = tester.widget<LinearGaugeFlexible>(smokeLinearGaugeMatcher);
    expect(smokeGauge.valueToSignal, smokeModel.smokeValue, reason: "Gauge value does not match model value for Smoke Exposure");
    expect(smokeGauge.valueToSignal, 100, reason: "Gauge value is not 100 for Smoke Exposure");

    // **SleepScreen Test**
    await tester.pumpAndSettle(); // Ensure MainScreen is settled

    // 1. Navigate to SleepScreen
    final sleepButtonOnMainScreen = find.widgetWithText(ElevatedButton, 'Sleep');
    expect(sleepButtonOnMainScreen, findsOneWidget, reason: "Sleep button on MainScreen not found");
    await tester.tap(sleepButtonOnMainScreen);
    await tester.pumpAndSettle();

    // Verify SleepScreen is present by its AppBar title
    expect(find.widgetWithText(AppBar, 'Sleep'), findsOneWidget, reason: "SleepScreen AppBar not found");
    expect(find.byType(CupertinoSpinBox), findsOneWidget, reason: "CupertinoSpinBox not found on SleepScreen");
    await tester.pumpAndSettle();

    // 2. Interact with SleepScreen widgets (CupertinoSpinBox)
    // The CupertinoSpinBox starts at 0. We want to reach 10 for a 10-year-old.
    // The increment button in CupertinoSpinBox is typically an Icon.
    // Let's assume Icons.add or Icons.arrow_upward based on typical SpinBox design.
    // The flutter_spinbox package might use specific icons or tappable areas.
    // A common pattern is two IconButtons, first for decrement, second for increment.
    final Finder incrementButtonFinder = find.descendant(
        of: find.byType(CupertinoSpinBox),
        matching: find.byType(IconButton),
    ).last; // Assuming increment is the second IconButton
    
    expect(incrementButtonFinder, findsOneWidget, reason: "Increment button for CupertinoSpinBox not found");

    for (int i = 0; i < 10; i++) {
      await tester.tap(incrementButtonFinder);
      await tester.pump(); // pump might be sufficient and faster than pumpAndSettle for rapid taps
    }
    await tester.pumpAndSettle(); // Settle after all taps

    // Verify the displayed value in CupertinoSpinBox is "10"
    // The value is usually displayed in a Text widget within the SpinBox.
    // The CupertinoSpinBox widget itself will also have the updated value.
    final CupertinoSpinBox sleepSpinBox = tester.widget<CupertinoSpinBox>(find.byType(CupertinoSpinBox));
    expect(sleepSpinBox.value, 10.0, reason: "CupertinoSpinBox value is not 10 after incrementing");
    // Also check the visible text if easily findable
    expect(find.descendant(of: find.byType(CupertinoSpinBox), matching: find.text('10')), findsOneWidget, reason: "Text '10' not found in CupertinoSpinBox");


    // 3. Save data and verify MainScreen update
    final acceptButtonSleep = find.widgetWithText(ElevatedButton, 'Accept');
    // Ensure the accept button is visible (though likely is, as not much content on this screen)
    await tester.scrollUntilVisible(acceptButtonSleep, 50.0, scrollable: find.byType(SingleChildScrollView).first);
    await tester.pumpAndSettle();
    expect(acceptButtonSleep, findsOneWidget, reason: "'Accept' button on SleepScreen not found");
    
    await tester.tap(acceptButtonSleep);
    await tester.pumpAndSettle(); // Allow navigation back to MainScreen

    // Verify MainScreen is present again
    expect(sleepButtonOnMainScreen, findsOneWidget, reason: "Sleep button on MainScreen not found after returning");

    // Verify sleepValue in PrecarinaModel
    final sleepScreenElement = tester.element(sleepButtonOnMainScreen); // context for provider
    final sleepModel = Provider.of<PrecarinaModel>(sleepScreenElement, listen: false);
    
    expect(sleepModel.sleepValue, isNotNull, reason: "sleepValue is null");
    expect(sleepModel.sleepValue, 100, reason: "sleepValue is not 100 for 10 hours of sleep at age 10");

    // Verify UI update on MainScreen for the sleep score
    final sleepRowMatcher = find.ancestor(
        of: sleepButtonOnMainScreen,
        matching: find.byType(Row)
    );
    final sleepLinearGaugeMatcher = find.descendant(
        of: sleepRowMatcher,
        matching: find.byType(LinearGaugeFlexible)
    );
    expect(sleepLinearGaugeMatcher, findsOneWidget, reason: "LinearGaugeFlexible for Sleep not found");

    final LinearGaugeFlexible sleepGauge = tester.widget<LinearGaugeFlexible>(sleepLinearGaugeMatcher);
    expect(sleepGauge.valueToSignal, sleepModel.sleepValue, reason: "Gauge value does not match model value for Sleep");
    expect(sleepGauge.valueToSignal, 100, reason: "Gauge value is not 100 for Sleep");

    // **BodyMassIndexScreen Test**
    await tester.pumpAndSettle(); // Ensure MainScreen is settled

    // 1. Navigate to BodyMassIndexScreen
    final bmiButtonOnMainScreen = find.widgetWithText(ElevatedButton, 'Body Mass Index');
    expect(bmiButtonOnMainScreen, findsOneWidget, reason: "Body Mass Index button on MainScreen not found");
    await tester.tap(bmiButtonOnMainScreen);
    await tester.pumpAndSettle();

    // Verify BodyMassIndexScreen is present by its AppBar title
    expect(find.widgetWithText(AppBar, 'Body Mass Index'), findsOneWidget, reason: "BodyMassIndexScreen AppBar not found");
    await tester.pumpAndSettle(); // Allow time for model loading if any async work in initState

    // 2. Interact with BodyMassIndexScreen widgets: Tap "Calculate"
    final calculateButton = find.widgetWithText(ElevatedButton, 'Calculate');
    expect(calculateButton, findsOneWidget, reason: "'Calculate' button not found");
    await tester.tap(calculateButton);
    await tester.pumpAndSettle(); // Allow calculations and UI update

    // 3. Verify displayed values and score
    // BMI: Expected "18.11"
    expect(find.text('18.11'), findsOneWidget, reason: "BMI value '18.11' not found");

    // Percentile: Check if text containing "%" is displayed after the "Percentile" label.
    // This is a bit indirect but checks if some percentile is shown.
    final percentileLabelFinder = find.text("Percentile".i18n()); // Use i18n key for label
    expect(percentileLabelFinder, findsOneWidget);
    // Find a Text widget that is a descendant of the Column containing the percentile label and has '%'
    final percentileValueFinder = find.descendant(
      of: find.ancestor(of: percentileLabelFinder, matching: find.byType(Column)),
      matching: find.textContaining('%')
    );
    expect(percentileValueFinder, findsWidgets, reason: "Percentile value (containing '%') not found");


    // Diagnose: Expected "Normal weight" ("txtNormalWeight".i18n())
    // Need context for AppLocalizations
    final bmiScreenElement = tester.element(find.byType(BodyMassIndexScreen));
    final expectedDiagnoseText = AppLocalizations.of(bmiScreenElement)!.txtNormalWeight;
    expect(find.text(expectedDiagnoseText), findsOneWidget, reason: "Diagnose text '$expectedDiagnoseText' not found");
    
    // Score: Expected "100"
    // The score is initially "Press Calculate", then updates.
    // The text widget for score is directly under the "Score" label.
    final scoreLabelFinder = find.text("Score".i18n());
    expect(scoreLabelFinder, findsOneWidget);
     // The actual score "100" should be present.
    expect(find.text('100'), findsAtLeastNWidgets(1), reason: "Score '100' not found after calculation");


    // 4. Save data and verify MainScreen update
    final acceptButtonBMI = find.widgetWithText(ElevatedButton, 'Accept');
    expect(acceptButtonBMI, findsOneWidget, reason: "'Accept' button on BodyMassIndexScreen not found");
    await tester.tap(acceptButtonBMI);
    await tester.pumpAndSettle(); // Allow navigation back to MainScreen

    // Verify MainScreen is present again
    expect(bmiButtonOnMainScreen, findsOneWidget, reason: "Body Mass Index button on MainScreen not found after returning");

    // Verify bmiValue in PrecarinaModel
    final bmiModel = Provider.of<PrecarinaModel>(bmiScreenElement, listen: false); // Can reuse bmiScreenElement for context
    
    expect(bmiModel.bmiValue, isNotNull, reason: "bmiValue is null");
    expect(bmiModel.bmiValue, 100, reason: "bmiValue is not 100 for the calculated BMI");

    // Verify UI update on MainScreen for the BMI score
    final bmiRowMatcher = find.ancestor(
        of: bmiButtonOnMainScreen,
        matching: find.byType(Row)
    );
    final bmiLinearGaugeMatcher = find.descendant(
        of: bmiRowMatcher,
        matching: find.byType(LinearGaugeFlexible)
    );
    expect(bmiLinearGaugeMatcher, findsOneWidget, reason: "LinearGaugeFlexible for Body Mass Index not found");

    final LinearGaugeFlexible bmiGauge = tester.widget<LinearGaugeFlexible>(bmiLinearGaugeMatcher);
    expect(bmiGauge.valueToSignal, bmiModel.bmiValue, reason: "Gauge value does not match model value for Body Mass Index");
    expect(bmiGauge.valueToSignal, 100, reason: "Gauge value is not 100 for Body Mass Index");

    // **CholesterolScreen Test**
    await tester.pumpAndSettle(); // Ensure MainScreen is settled

    // 1. Navigate to CholesterolScreen
    final cholesterolButtonOnMainScreen = find.widgetWithText(ElevatedButton, 'Cholesterol');
    expect(cholesterolButtonOnMainScreen, findsOneWidget, reason: "Cholesterol button on MainScreen not found");
    await tester.tap(cholesterolButtonOnMainScreen);
    await tester.pumpAndSettle();

    // Verify CholesterolScreen is present by its AppBar title
    expect(find.widgetWithText(AppBar, 'Cholesterol'), findsOneWidget, reason: "CholesterolScreen AppBar not found");
    await tester.pumpAndSettle();

    // 2. Interact with CholesterolScreen widgets
    // Get the text for the first option (score 100).
    final cholesterolScreenElement = tester.element(find.byType(CholesterolScreen));
    final cholesterolOptionsTexts = AppLocalizations.of(cholesterolScreenElement)!.txtCholesterolDialogOptions.split("|");
    final firstCholesterolOptionText = cholesterolOptionsTexts[0]; // Corresponds to value 100

    final radioFirstCholesterolFinder = find.widgetWithText(RadioListTile, firstCholesterolOptionText);
    // Ensure the RadioListTile is visible by scrolling if necessary (though likely not needed for a few options)
    await tester.scrollUntilVisible(radioFirstCholesterolFinder, 50.0, scrollable: find.byType(SingleChildScrollView).first);
    await tester.pumpAndSettle();
    expect(radioFirstCholesterolFinder, findsOneWidget, reason: "RadioListTile for '$firstCholesterolOptionText' not found");
    
    await tester.tap(radioFirstCholesterolFinder);
    await tester.pumpAndSettle();

    // 3. Save data and verify MainScreen update
    final acceptButtonCholesterol = find.widgetWithText(ElevatedButton, 'Accept');
    // Ensure the accept button is visible
    await tester.scrollUntilVisible(acceptButtonCholesterol, 50.0, scrollable: find.byType(SingleChildScrollView).first);
    await tester.pumpAndSettle();
    expect(acceptButtonCholesterol, findsOneWidget, reason: "'Accept' button on CholesterolScreen not found");
    
    await tester.tap(acceptButtonCholesterol);
    await tester.pumpAndSettle(); // Allow navigation back to MainScreen

    // Verify MainScreen is present again
    expect(cholesterolButtonOnMainScreen, findsOneWidget, reason: "Cholesterol button on MainScreen not found after returning");

    // Verify cholesterolValue in PrecarinaModel
    final cholesterolModel = Provider.of<PrecarinaModel>(cholesterolScreenElement, listen: false);
    
    expect(cholesterolModel.cholesterolValue, isNotNull, reason: "cholesterolValue is null");
    expect(cholesterolModel.cholesterolValue, 100, reason: "cholesterolValue is not 100 for the first option");

    // Verify UI update on MainScreen for the cholesterol score
    final cholesterolRowMatcher = find.ancestor(
        of: cholesterolButtonOnMainScreen,
        matching: find.byType(Row)
    );
    final cholesterolLinearGaugeMatcher = find.descendant(
        of: cholesterolRowMatcher,
        matching: find.byType(LinearGaugeFlexible)
    );
    expect(cholesterolLinearGaugeMatcher, findsOneWidget, reason: "LinearGaugeFlexible for Cholesterol not found");

    final LinearGaugeFlexible cholesterolGauge = tester.widget<LinearGaugeFlexible>(cholesterolLinearGaugeMatcher);
    expect(cholesterolGauge.valueToSignal, cholesterolModel.cholesterolValue, reason: "Gauge value does not match model value for Cholesterol");
    expect(cholesterolGauge.valueToSignal, 100, reason: "Gauge value is not 100 for Cholesterol");

    // **DiabetesScreen Test**
    await tester.pumpAndSettle(); // Ensure MainScreen is settled

    // 1. Navigate to DiabetesScreen
    final diabetesButtonOnMainScreen = find.widgetWithText(ElevatedButton, 'Diabetes');
    expect(diabetesButtonOnMainScreen, findsOneWidget, reason: "Diabetes button on MainScreen not found");
    await tester.tap(diabetesButtonOnMainScreen);
    await tester.pumpAndSettle();

    // Verify DiabetesScreen is present by its AppBar title
    expect(find.widgetWithText(AppBar, 'Diabetes'), findsOneWidget, reason: "DiabetesScreen AppBar not found");
    await tester.pumpAndSettle();

    // 2. Interact with DiabetesScreen widgets
    // Get the text for the first option (score 100).
    final diabetesScreenElement = tester.element(find.byType(DiabetesScreen));
    final diabetesOptionsTexts = AppLocalizations.of(diabetesScreenElement)!.txtDiabetesDialogOptions.split("|");
    final firstDiabetesOptionText = diabetesOptionsTexts[0]; // Corresponds to value 100

    final radioFirstDiabetesFinder = find.widgetWithText(RadioListTile, firstDiabetesOptionText);
    // Ensure the RadioListTile is visible by scrolling if necessary
    await tester.scrollUntilVisible(radioFirstDiabetesFinder, 50.0, scrollable: find.byType(SingleChildScrollView).first);
    await tester.pumpAndSettle();
    expect(radioFirstDiabetesFinder, findsOneWidget, reason: "RadioListTile for '$firstDiabetesOptionText' not found");
    
    await tester.tap(radioFirstDiabetesFinder);
    await tester.pumpAndSettle();

    // 3. Save data and verify MainScreen update
    final acceptButtonDiabetes = find.widgetWithText(ElevatedButton, 'Accept');
    // Ensure the accept button is visible
    await tester.scrollUntilVisible(acceptButtonDiabetes, 50.0, scrollable: find.byType(SingleChildScrollView).first);
    await tester.pumpAndSettle();
    expect(acceptButtonDiabetes, findsOneWidget, reason: "'Accept' button on DiabetesScreen not found");
    
    await tester.tap(acceptButtonDiabetes);
    await tester.pumpAndSettle(); // Allow navigation back to MainScreen

    // Verify MainScreen is present again
    expect(diabetesButtonOnMainScreen, findsOneWidget, reason: "Diabetes button on MainScreen not found after returning");

    // Verify diabetesValue in PrecarinaModel
    final diabetesModel = Provider.of<PrecarinaModel>(diabetesScreenElement, listen: false);
    
    expect(diabetesModel.diabetesValue, isNotNull, reason: "diabetesValue is null");
    expect(diabetesModel.diabetesValue, 100, reason: "diabetesValue is not 100 for the first option");

    // Verify UI update on MainScreen for the diabetes score
    final diabetesRowMatcher = find.ancestor(
        of: diabetesButtonOnMainScreen,
        matching: find.byType(Row)
    );
    final diabetesLinearGaugeMatcher = find.descendant(
        of: diabetesRowMatcher,
        matching: find.byType(LinearGaugeFlexible)
    );
    expect(diabetesLinearGaugeMatcher, findsOneWidget, reason: "LinearGaugeFlexible for Diabetes not found");

    final LinearGaugeFlexible diabetesGauge = tester.widget<LinearGaugeFlexible>(diabetesLinearGaugeMatcher);
    expect(diabetesGauge.valueToSignal, diabetesModel.diabetesValue, reason: "Gauge value does not match model value for Diabetes");
    expect(diabetesGauge.valueToSignal, 100, reason: "Gauge value is not 100 for Diabetes");

    // **BloodPressureScreen Test**
    await tester.pumpAndSettle(); // Ensure MainScreen is settled

    // 1. Navigate to BloodPressureScreen & Handle Initial SnackBar
    final bpButtonOnMainScreen = find.widgetWithText(ElevatedButton, 'Blood Pressure');
    expect(bpButtonOnMainScreen, findsOneWidget, reason: "Blood Pressure button on MainScreen not found");
    await tester.tap(bpButtonOnMainScreen);
    await tester.pumpAndSettle(); // Screen loads, initState calls showWarning, SnackBar appears

    // Verify BloodPressureScreen is present
    final bpScreenFinder = find.byType(BloodPressureScreen);
    expect(find.widgetWithText(AppBar, 'Blood Pressure'), findsOneWidget, reason: "BloodPressureScreen AppBar not found");
    
    // Handle initial SnackBar
    // The initial SnackBar's "OK" button text comes from "txtOK".i18n()
    final bpScreenElementInitial = tester.element(bpScreenFinder);
    final initialOkButtonText = AppLocalizations.of(bpScreenElementInitial)!.txtOK;
    final initialSnackBarOkButton = find.widgetWithText(TextButton, initialOkButtonText);
    expect(initialSnackBarOkButton, findsOneWidget, reason: "Initial SnackBar 'OK' button not found");
    await tester.tap(initialSnackBarOkButton);
    await tester.pumpAndSettle();

    // 2. Interact with BloodPressureScreen widgets
    // Helper to find FormBuilderTextField by name and enter text
    Future<void> enterTextInBPField(String fieldName, String text) async {
      final textFieldFinder = find.byWidgetPredicate(
        (Widget widget) => widget is FormBuilderTextField && widget.name == fieldName,
      );
      expect(textFieldFinder, findsOneWidget, reason: "FormBuilderTextField with name '$fieldName' not found");
      await tester.enterText(textFieldFinder, text);
      await tester.pumpAndSettle();
    }

    // Enter PAS: "105"
    await enterTextInBPField("PAS", "105");

    // Enter PAD: "65"
    await enterTextInBPField("PAD", "65");
    
    // Select Medication "No"
    // The ChoiceChip text "N" comes from "txtNo".i18n()
    final bpScreenElementInteract = tester.element(bpScreenFinder);
    final medicationNoText = AppLocalizations.of(bpScreenElementInteract)!.txtNo;
    final medicatedFieldFinder = find.byWidgetPredicate(
      (Widget widget) => widget is FormBuilderField && widget.name == 'Medicado',
    );
    expect(medicatedFieldFinder, findsOneWidget, reason: "Medication FormBuilderField not found");
    final choiceChipNoFinder = find.descendant(
      of: medicatedFieldFinder,
      matching: find.widgetWithText(ChoiceChip, medicationNoText),
    );
    expect(choiceChipNoFinder, findsOneWidget, reason: "Medication 'No' ChoiceChip not found");
    await tester.tap(choiceChipNoFinder);
    await tester.pumpAndSettle();

    // 3. Trigger calculation and handle SnackBar
    final calculateBpButton = find.widgetWithText(ElevatedButton, 'Calculate'); // "txtCalculate".i18n()
    expect(calculateBpButton, findsOneWidget, reason: "'Calculate' button not found");
    await tester.tap(calculateBpButton);
    await tester.pumpAndSettle(); // Allows SnackBar with results to appear

    // Verify SnackBar content and tap "OK"
    // The diagnose text "Patient normotensive" comes from "patientDiagnoseNorm".i18n()
    final bpScreenElementResult = tester.element(bpScreenFinder);
    final expectedDiagnoseTextBP = AppLocalizations.of(bpScreenElementResult)!.patientDiagnoseNorm;
    expect(find.textContaining(expectedDiagnoseTextBP), findsOneWidget, reason: "Results SnackBar with diagnose '$expectedDiagnoseTextBP' not found");
    
    final resultsSnackBarOkButton = find.widgetWithText(TextButton, 'OK'); // Hardcoded 'OK' in SnackBarAction
    expect(resultsSnackBarOkButton, findsOneWidget, reason: "Results SnackBar 'OK' button not found");
    await tester.tap(resultsSnackBarOkButton);
    await tester.pumpAndSettle(); // Updates local state with diagnose and score

    // 4. Verify displayed score and save data
    // Score text "Score: 100" (Score prefix from "txtScore".i18n())
    final scorePrefixBP = AppLocalizations.of(bpScreenElementResult)!.txtScore;
    expect(find.text('$scorePrefixBP100'), findsOneWidget, reason: "Displayed score 'Score: 100' not found");

    final acceptButtonBP = find.widgetWithText(ElevatedButton, 'Accept'); // "txtAccept".i18n()
    expect(acceptButtonBP, findsOneWidget, reason: "'Accept' button on BloodPressureScreen not found");
    await tester.tap(acceptButtonBP);
    await tester.pumpAndSettle(); // Allow navigation back to MainScreen

    // 5. Verify MainScreen update
    expect(bpButtonOnMainScreen, findsOneWidget, reason: "Blood Pressure button on MainScreen not found after returning");

    final bpModel = Provider.of<PrecarinaModel>(bpScreenElementResult, listen: false);
    expect(bpModel.bloodPressureValue, isNotNull, reason: "bloodPressureValue is null");
    expect(bpModel.bloodPressureValue, 100, reason: "bloodPressureValue is not 100");

    final bpRowMatcher = find.ancestor(of: bpButtonOnMainScreen, matching: find.byType(Row));
    final bpLinearGaugeMatcher = find.descendant(of: bpRowMatcher, matching: find.byType(LinearGaugeFlexible));
    expect(bpLinearGaugeMatcher, findsOneWidget, reason: "LinearGaugeFlexible for Blood Pressure not found");

    final LinearGaugeFlexible bpGauge = tester.widget<LinearGaugeFlexible>(bpLinearGaugeMatcher);
    expect(bpGauge.valueToSignal, bpModel.bloodPressureValue, reason: "Gauge value does not match model value for Blood Pressure");
    expect(bpGauge.valueToSignal, 100, reason: "Gauge value is not 100 for Blood Pressure");

    // **Final MainScreen Assertions (Average Score and Smiley)**
    await tester.pumpAndSettle(); // Ensure MainScreen is fully settled

    // 1. Ensure MainScreen is active (re-confirming, though previous test should leave it so)
    //    We can use the bpButtonOnMainScreen finder from the previous test part.
    expect(bpButtonOnMainScreen, findsOneWidget, reason: "MainScreen (identified by BP button) not active for final assertions");

    // 2. Verify PrecarinaModel average
    //    Access the model using the context of MainScreen (bpButtonOnMainScreen is a child of MainScreen)
    final mainScreenElementForFinalAsserts = tester.element(bpButtonOnMainScreen);
    final finalModel = Provider.of<PrecarinaModel>(mainScreenElementForFinalAsserts, listen: false);
    
    // All individual scores were 100. The average calculation is sum / count.
    // There are 8 categories. (8 * 100) / 8 = 100.
    expect(finalModel.average, isNotNull, reason: "Final average is null");
    expect(finalModel.average, closeTo(100.0, 0.01), reason: "Final average score is not 100");

    // 3. Verify PrettyGauge display
    final prettyGaugeFinder = find.byType(PrettyGauge);
    expect(prettyGaugeFinder, findsOneWidget, reason: "PrettyGauge not found on MainScreen");
    final PrettyGauge mainScreenGauge = tester.widget<PrettyGauge>(prettyGaugeFinder);
    expect(mainScreenGauge.currentValue, closeTo(100.0, 0.01), reason: "PrettyGauge currentValue is not 100");

    // 4. Verify Smiley Face visibility
    // Check model properties first
    expect(finalModel.showGreenSmiley, isTrue, reason: "showGreenSmiley should be true for average 100");
    expect(finalModel.showYellowSmiley, isFalse, reason: "showYellowSmiley should be false for average 100");
    expect(finalModel.showRedSmiley, isFalse, reason: "showRedSmiley should be false for average 100");

    // Verify widget visibility
    // Green Smiley
    final greenSmileyImageFinder = find.image(const AssetImage('assets/images/green_smiley.png'));
    final greenSmileyVisibilityFinder = find.ancestor(
      of: greenSmileyImageFinder,
      matching: find.byWidgetPredicate((widget) => widget is Visibility),
    );
    // There are two green smileys, one on each side of the gauge. Expect both to be visible.
    expect(greenSmileyVisibilityFinder, findsNWidgets(2), reason: "Expected 2 Visibility widgets for green smiley");
    Visibility greenSmileyVisibility = tester.widget<Visibility>(greenSmileyVisibilityFinder.first);
    expect(greenSmileyVisibility.visible, isTrue, reason: "Green smiley is not visible");

    // Yellow Smiley
    final yellowSmileyImageFinder = find.image(const AssetImage('assets/images/yellow_smiley.png'));
    final yellowSmileyVisibilityFinder = find.ancestor(
      of: yellowSmileyImageFinder,
      matching: find.byWidgetPredicate((widget) => widget is Visibility),
    );
    expect(yellowSmileyVisibilityFinder, findsNWidgets(2), reason: "Expected 2 Visibility widgets for yellow smiley");
    Visibility yellowSmileyVisibility = tester.widget<Visibility>(yellowSmileyVisibilityFinder.first);
    expect(yellowSmileyVisibility.visible, isFalse, reason: "Yellow smiley should not be visible");
    
    // Red Smiley
    final redSmileyImageFinder = find.image(const AssetImage('assets/images/red_smiley.png'));
    final redSmileyVisibilityFinder = find.ancestor(
      of: redSmileyImageFinder,
      matching: find.byWidgetPredicate((widget) => widget is Visibility),
    );
    expect(redSmileyVisibilityFinder, findsNWidgets(2), reason: "Expected 2 Visibility widgets for red smiley");
    Visibility redSmileyVisibility = tester.widget<Visibility>(redSmileyVisibilityFinder.first);
    expect(redSmileyVisibility.visible, isFalse, reason: "Red smiley should not be visible");
    
  });
}
