import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:precarina/main.dart' as app;

// Define keys for widgets you want to interact with in InputDataPage
// You MUST add these keys to your actual widgets in input_data_page.dart
const Key ageInputKey = Key('age_input_field');
// const Key genderDropdownKey = Key('gender_dropdown'); // Original key for dropdown
// If your radio buttons are grouped under a widget with a specific key, you can define and use it here.
// For example: const Key genderRadioGroupKey = Key('gender_radio_group');
const Key conditionCheckboxKey = Key('condition_checkbox');
const Key scoreSliderKey = Key('score_slider'); // Example slider
const Key weightInputKey =
    Key('weight_input_field'); // Another example text field
const Key calculateButtonKey =
    Key('calculate_button'); // Example button to trigger calculation

// Key for the T&C Accept button (if you have one)
// You MUST add this key to the button that accepts T&C in show_terms_and_conds.dart
const Key acceptTcButtonKey = Key('accept_tc_button');

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
      final Random random = Random();

      // --- Handle Terms and Conditions Dialog ---
      // Check if the T&C dialog is shown
      final acceptButtonFinder = find.byKey(acceptTcButtonKey);
      if (tester.any(acceptButtonFinder)) {
        print('T&C dialog found. Accepting...');
        await tester.tap(acceptButtonFinder);
        await tester.pumpAndSettle();
        print('T&C accepted.');
      } else {
        print('T&C dialog not found or already accepted.');
      }

      // --- Interact with Drawer ---
      // Open the drawer
      final ScaffoldState state = tester.firstState(find.byType(Scaffold));
      state.openDrawer();
      await tester.pumpAndSettle();
      print('Drawer opened.');

      // You could add steps here to tap on drawer items if needed
      // Example: await tester.tap(find.text('Help Section'));
      // await tester.pumpAndSettle();
      // await tester.pageBack(); // Go back from help page
      // await tester.pumpAndSettle();

      // Close the drawer
      state.closeDrawer();
      await tester.pumpAndSettle();
      print('Drawer closed.');

      // --- Interact with InputDataPage ---
      // Assuming InputDataPage is the body of MyHomePage, it should be visible
      print('Interacting with InputDataPage...');

      // Example: Interact with a TextField (Age)
      final ageInputFinder = find.byKey(ageInputKey);
      if (tester.any(ageInputFinder)) {
        final int randomAge = 18 + random.nextInt(80); // Age between 18 and 97
        await tester.enterText(ageInputFinder, randomAge.toString());
        selectedValues['age'] = randomAge;
        print('Entered age: $randomAge');
      } else {
        print('Age input field not found (Key: $ageInputKey)');
      }

      // Example: Interact with RadioButtons (Gender)
      // Define the possible gender options that correspond to your RadioButton labels
      final List<String> genderOptions = ['Male', 'Female']; // Adjust as per your app's UI
      final String selectedGender = genderOptions[random.nextInt(genderOptions.length)];

      // Find the radio button by its text label.
      // This assumes your RadioButton or RadioListTile has an associated Text widget with these values.
      // If your radio buttons are within a group identified by a key (e.g., genderRadioGroupKey defined above),
      // you might first find the group and then the descendant:
      // final genderGroupFinder = find.byKey(genderRadioGroupKey);
      // final Finder genderRadioButtonsFinder = find.descendant(of: genderGroupFinder, matching: find.text(selectedGender));
      // For this example, we'll directly find the radio button's text.
      final Finder genderRadioButtonsFinder = find.text(selectedGender);

      // Check if the specific radio button option (identified by its text) is found
      if (tester.any(genderRadioButtonsFinder)) {
        await tester.tap(genderRadioButtonsFinder);
        await tester.pumpAndSettle(); // Allow UI to update after selection

        selectedValues['gender'] = selectedGender;
        print('Selected gender: $selectedGender');
      } else {
        // This means the specific text for the randomly chosen gender was not found.
        print('Gender radio button option "$selectedGender" not found.');
        // If you were using a genderRadioGroupKey, you might add:
        // print('Ensure the radio button group (if keyed) and the option "$selectedGender" exist.');
      }

      // Example: Interact with a Checkbox (Condition)
      final conditionCheckboxFinder = find.byKey(conditionCheckboxKey);
      if (tester.any(conditionCheckboxFinder)) {
        final bool shouldCheck = random.nextBool();
        // Check the current state if possible, or just tap
        // Tapping a checkbox toggles its state
        if (shouldCheck) {
          // Tap the checkbox to potentially check it
          await tester.tap(conditionCheckboxFinder);
          await tester.pumpAndSettle();
          // Verify it's checked if needed
          // final Checkbox checkbox = tester.widget(conditionCheckboxFinder);
          // if (checkbox.value != true) { await tester.tap(conditionCheckboxFinder); await tester.pumpAndSettle(); }
          selectedValues['condition'] = true; // Assuming tap makes it true
          print('Tapped condition checkbox (aiming for true)');
        } else {
          // Tap the checkbox to potentially uncheck it
          await tester.tap(conditionCheckboxFinder);
          await tester.pumpAndSettle();
          // Verify it's unchecked if needed
          // final Checkbox checkbox = tester.widget(conditionCheckboxFinder);
          // if (checkbox.value != false) { await tester.tap(conditionCheckboxFinder); await tester.pumpAndSettle(); }
          selectedValues['condition'] = false; // Assuming tap makes it false
          print('Tapped condition checkbox (aiming for false)');
        }
        // A simpler approach is just to tap randomly:
        // if (random.nextBool()) {
        //   await tester.tap(conditionCheckboxFinder);
        //   await tester.pumpAndSettle();
        //   selectedValues['condition'] = true; // Assuming tap makes it true
        //   print('Tapped condition checkbox');
        // } else {
        //   selectedValues['condition'] = false; // Assuming no tap leaves it false
        //   print('Did not tap condition checkbox');
        // }
      } else {
        print('Condition checkbox not found (Key: $conditionCheckboxKey)');
      }

      // Example: Interact with a Slider (Score Component)
      final scoreSliderFinder = find.byKey(scoreSliderKey);
      if (tester.any(scoreSliderFinder)) {
        // You need to know the min/max range of your slider
        // Assuming a range from 0.0 to 100.0 for example
        const double sliderMin = 0.0;
        const double sliderMax = 100.0;
        final double randomValue =
            sliderMin + random.nextDouble() * (sliderMax - sliderMin);

        // To interact with a slider, you can tap at a specific position
        // Find the center of the slider widget
        final Offset sliderCenter = tester.getCenter(scoreSliderFinder);

        // Calculate the tap position based on the random value
        // This is a simplified calculation; may need adjustment based on slider padding/margins
        // Assuming the slider track is horizontal
        final double tapX = sliderCenter.dx -
            tester.getSize(scoreSliderFinder).width / 2 +
            (randomValue / (sliderMax - sliderMin)) *
                tester.getSize(scoreSliderFinder).width;
        final Offset tapPosition = Offset(tapX, sliderCenter.dy);

        await tester.tapAt(tapPosition);
        await tester.pumpAndSettle();

        selectedValues['score_component'] =
            randomValue; // Store the target value
        print('Set slider value to approximately: $randomValue');
      } else {
        print('Score slider not found (Key: $scoreSliderKey)');
      }

      // Example: Interact with another TextField (Weight)
      final weightInputFinder = find.byKey(weightInputKey);
      if (tester.any(weightInputFinder)) {
        final double randomWeight =
            40.0 + random.nextDouble() * 160.0; // Weight between 40 and 200
        await tester.enterText(weightInputFinder,
            randomWeight.toStringAsFixed(1)); // Enter with 1 decimal place
        selectedValues['weight'] = randomWeight;
        print('Entered weight: ${randomWeight.toStringAsFixed(1)}');
      } else {
        print('Weight input field not found (Key: $weightInputKey)');
      }

      // --- Trigger Calculation ---
      final calculateButtonFinder = find.byKey(calculateButtonKey);
      if (tester.any(calculateButtonFinder)) {
        await tester.tap(calculateButtonFinder);
        await tester.pumpAndSettle();
        print('Tapped Calculate button.');

        // Add assertions here to check the result screen or updated UI
        // Example: expect(find.textContaining('Your Score:'), findsOneWidget);
      } else {
        print('Calculate button not found (Key: $calculateButtonKey)');
      }

      // --- Print Stored Values ---
      print('\n--- Randomly Selected Input Values ---');
      selectedValues.forEach((key, value) {
        print('$key: $value');
      });
      print('-------------------------------------\n');

      // You can add more interactions or assertions here as needed
    });
  });
}
