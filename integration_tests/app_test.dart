
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:precarina/main.dart' as app;

// Keys for InputDataPage widgets (must match keys in input_data_page.dart)
const Key heightInputKey = Key('height_input_field');
const Key weightKilosInputKey = Key('weight_kilos_input_field');
const Key weightGramsInputKey = Key('weight_grams_input_field');
const Key ageYearsDropdownKey = Key('age_years_dropdown');
const Key ageMonthsDropdownKey = Key('age_months_dropdown');
const Key genderFemaleRadioKey = Key('gender_female_radio');
const Key genderMaleRadioKey = Key('gender_male_radio');
const Key calculateButtonKey = Key('calculate_button');

// Key for the T&C Accept button
const Key acceptTcButtonKey = Key('accept_tc_button');

// Define the key for your main Scaffold (must match the key in your app code)
const Key mainScaffoldKey = ValueKey('mainScaffold');

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('End-to-end Test', () {
    testWidgets('Navigate through app and input random data',
        (WidgetTester tester) async {
      // Launch the app
      app.main();
      await tester.pumpAndSettle();

      // Store selected values for regression analysis
      final Map<String, dynamic> selectedValues = {};

      // --- Handle Terms and Conditions Dialog ---
      // Check if the T&C dialog is shown
      final acceptButtonFinder = find.byKey(acceptTcButtonKey);
      if (tester.any(acceptButtonFinder)) {
        debugPrint('T&C dialog found. Accepting...');
        await tester.tap(acceptButtonFinder);
        await tester.pumpAndSettle();
        debugPrint('T&C accepted.');
      } else {
        debugPrint('T&C dialog not found or already accepted.');
      }

      // It's good to ensure the app is settled after any initial dialogs or loads.
      await tester.pumpAndSettle(const Duration(milliseconds: 500)); // Give a bit more time

      // --- Interact with Drawer ---
      // Try to find the Scaffold using the specific key.
      // This requires you to add `key: mainScaffoldKey` to your app's main Scaffold.
      final scaffoldFinder = find.byKey(mainScaffoldKey);
      // As an alternative, if you cannot add a key immediately, use find.byType(Scaffold)
      // final scaffoldFinder = find.byType(Scaffold);

      // Verify the Scaffold is found before trying to interact with it.
      expect(scaffoldFinder, findsOneWidget, reason: 'Main Scaffold was not found. Ensure it has the key "$mainScaffoldKey" or check app navigation.');
      
      // If found, then get its state and open the drawer.
      final ScaffoldState state = tester.state(scaffoldFinder);
      if (state.hasDrawer) {
        state.openDrawer();
        await tester.pumpAndSettle();
        debugPrint('Drawer opened.');

        // You could add steps here to tap on drawer items if needed
        // Example: await tester.tap(find.text('Help Section'));
        // await tester.pumpAndSettle();

        // Close the drawer
        state.closeDrawer();
        await tester.pumpAndSettle();
        debugPrint('Drawer closed.');
      } else {
        debugPrint('Scaffold found, but it does not have a drawer.');
      }

      // --- Interact with InputDataPage ---
      // Assuming InputDataPage is the body of MyHomePage, it should be visible
      debugPrint('Interacting with InputDataPage...');

      // --- Interact with Gender RadioButtons using Keys ---
      // For this test, let's select 'Female' consistently, or you can make it random
      final Key genderToSelectKey = genderFemaleRadioKey; // Or genderMaleRadioKey or random
      final String selectedGenderValue = (genderToSelectKey == genderFemaleRadioKey) ? "Female" : "Male";

      final genderRadioFinder = find.byKey(genderToSelectKey);
      if (tester.any(genderRadioFinder)) {
        await tester.tap(genderRadioFinder);
        await tester.pumpAndSettle();
        selectedValues['gender'] = selectedGenderValue;
        debugPrint('Selected gender: $selectedGenderValue');
      } else {
        debugPrint('Gender radio button not found (Key: $genderToSelectKey)');
      }

      // Interact with Height TextField (FormBuilderTextField)
      // The FormBuilderTextField is wrapped by a KeyedSubtree with heightInputKey
      final heightInputWrapperFinder = find.byKey(heightInputKey);
      if (tester.any(heightInputWrapperFinder)) {
        const String heightValueToEnter = "123,5"; // Input matches mask '###,#'
        const double conceptualHeightValue = 123.5; // The actual numeric value

        // Find the actual TextField widget within the KeyedSubtree wrapper
        final actualTextFieldFinder = find.descendant(
          of: heightInputWrapperFinder,
          matching: find.byType(TextField),
        );

        if (tester.any(actualTextFieldFinder)) {
          await tester.enterText(actualTextFieldFinder, heightValueToEnter);
          await tester.pumpAndSettle();
          selectedValues['height'] = conceptualHeightValue;
          debugPrint('Entered height: $heightValueToEnter (conceptual: $conceptualHeightValue)');
        } else {
          debugPrint('Actual TextField descendant not found for height input (Wrapper Key: $heightInputKey)');
        }
      } else {
        debugPrint('Height input field wrapper not found (Key: $heightInputKey)');
      }

      // --- Interact with Weight Kilos TextField ---
      final weightKilosFinder = find.byKey(weightKilosInputKey);
      if (tester.any(weightKilosFinder)) {
        const String kilosToEnter = "42";
        // The FormBuilderTextField might be the widget found by key, or it might be a wrapper.
        // If weightKilosInputKey is on FormBuilderTextField directly:
        await tester.enterText(weightKilosFinder, kilosToEnter);
        // If it's on a KeyedSubtree wrapper like height:
        // final actualKilosTextFieldFinder = find.descendant(
        //   of: weightKilosFinder,
        //   matching: find.byType(TextField),
        // );
        // await tester.enterText(actualKilosTextFieldFinder, kilosToEnter);
        await tester.pumpAndSettle();
        selectedValues['weight_kilos'] = int.parse(kilosToEnter);
        debugPrint('Entered weight kilos: $kilosToEnter');
      } else {
        debugPrint('Weight Kilos input field not found (Key: $weightKilosInputKey)');
      }

      // --- Interact with Weight Grams TextField ---
      final weightGramsFinder = find.byKey(weightGramsInputKey);
      if (tester.any(weightGramsFinder)) {
        const String gramsToEnter = "300";
        // Similar to kilos, adjust if wrapped
        await tester.enterText(weightGramsFinder, gramsToEnter);
        // final actualGramsTextFieldFinder = find.descendant(
        //   of: weightGramsFinder,
        //   matching: find.byType(TextField),
        // );
        // await tester.enterText(actualGramsTextFieldFinder, gramsToEnter);
        await tester.pumpAndSettle();
        selectedValues['weight_grams'] = int.parse(gramsToEnter);
        debugPrint('Entered weight grams: $gramsToEnter');
      } else {
        debugPrint('Weight Grams input field not found (Key: $weightGramsInputKey)');
      }

      // --- Interact with Age Years Dropdown ---
      final ageYearsDropdownFinder = find.byKey(ageYearsDropdownKey);
      if (tester.any(ageYearsDropdownFinder)) {
        await tester.tap(ageYearsDropdownFinder);
        await tester.pumpAndSettle(); // Wait for items to appear
        // Assuming Spanish localization: "15 años"
        // If l10n.suffixAnos is " years", it would be "15 years"
        await tester.tap(find.text('15 years').last);
        await tester.pumpAndSettle();
        selectedValues['age_years'] = 15;
        debugPrint('Selected age years: 15');
      } else {
        debugPrint('Age Years dropdown not found (Key: $ageYearsDropdownKey)');
      }

      // --- Interact with Age Months Dropdown ---
      final ageMonthsDropdownFinder = find.byKey(ageMonthsDropdownKey);
      if (tester.any(ageMonthsDropdownFinder)) {
        await tester.tap(ageMonthsDropdownFinder);
        await tester.pumpAndSettle(); // Wait for items to appear
        // Assuming Spanish localization: "8 meses"
        // If l10n.suffixMeses is " months", it would be "8 months"
        await tester.tap(find.text('8 months').last);
        await tester.pumpAndSettle();
        selectedValues['age_months'] = 8;
        debugPrint('Selected age months: 8');
      } else {
        debugPrint('Age Months dropdown not found (Key: $ageMonthsDropdownKey)');
      }

      // --- Trigger Calculation ---
      final calculateButtonFinder = find.byKey(calculateButtonKey);
      if (tester.any(calculateButtonFinder)) {
        await tester.tap(calculateButtonFinder);
        await tester.pumpAndSettle();
        debugPrint('Tapped Calculate button.');

        // Add assertions here to check the result screen or updated UI
        // Example: expect(find.textContaining('Your Score:'), findsOneWidget);
      } else {
        debugPrint('Calculate button not found (Key: $calculateButtonKey)');
      }

      // --- debugPrint Stored Values ---
      debugPrint('\n--- Randomly Selected Input Values ---');
      selectedValues.forEach((key, value) {
        debugPrint('$key: $value');
      });
      debugPrint('-------------------------------------\n');

      // You can add more interactions or assertions here as needed
    });
  });
}
