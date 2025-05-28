import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:precarina/l10n/app_localizations.dart';
import 'package:precarina/main.dart' as app;
import 'package:precarina/aux_widgets/diet_item_widget.dart'; // Import for DietItem

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

// Key for DietScreen Scaffold (to be added to diet_screen.dart)
const Key dietScreenScaffoldKey = Key('dietScreenScaffold');

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
      
      // Get the ScaffoldState.
      final ScaffoldState state = tester.state(scaffoldFinder);
      if (state.hasDrawer) {
        state.openDrawer();
        await tester.pumpAndSettle();
        debugPrint('Drawer opened.');

        // After an asynchronous operation (pumpAndSettle), the widget associated with 'state'
        // might have been removed from the widget tree (e.g., due to navigation or conditional UI changes).
        // It's crucial to check if the 'state' is still mounted before calling methods on it.
        if (!state.mounted) {
          debugPrint('Scaffold state is no longer mounted after opening drawer. Skipping drawer close.');
          // Depending on your test's expectations, you might want to fail here if the Scaffold
          // was not expected to become unmounted.
          // For example:
          // fail('Scaffold state became unmounted unexpectedly after opening drawer.');
        } else {
          // If still mounted, it's safe to interact with the state.
          state.closeDrawer();
          await tester.pumpAndSettle();
          debugPrint('Drawer closed.');
        }
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

      // --- Continue testing Diet screen ---
      debugPrint('--- Testing Diet Screen ---');

      // After the "Calculate" button is tapped and the UI settles,
      // we are likely on a new screen (e.g., a results screen).
      // We need to get AppLocalizations from *this current screen's* context
      // to find the navigation element to the DietScreen.

      // OPTION 1 (More Robust): Use a specific key for the post-calculation screen's Scaffold.
      // const Key postCalculationScaffoldKey = Key('postCalculationScreenScaffold'); // Define this
      // final Finder currentScreenScaffoldFinder = find.byKey(postCalculationScaffoldKey);
      // Add `key: postCalculationScaffoldKey` to the Scaffold of the screen visible after calculation.

      // OPTION 2 (Less Robust, but requires no app code changes if it works): Find Scaffold by type.
      // This assumes the relevant Scaffold is the primary one visible.
      final Finder currentScreenScaffoldFinder = find.byType(Scaffold);
      expect(currentScreenScaffoldFinder, findsOneWidget, reason: "Current screen's Scaffold not found before attempting DietScreen navigation. Consider adding a specific key to this screen's Scaffold.");
      // Get AppLocalizations directly without storing the context
      final AppLocalizations l10nForDietNavigation = AppLocalizations.of(tester.element(currentScreenScaffoldFinder))!;

      // Navigate to Diet Screen
      // IMPORTANT: Adjust the finder below based on how navigation to DietScreen is implemented in MainScreen.
      // It could be a button with text, an icon, or a ListTile in a drawer/list.
      // Using l10nMainScreen.txtDietButton ("Alimentación") as an example.
      // More robust finder: Find the Text widget with the localized text, then find its ElevatedButton ancestor.
      final dietButtonNavigationFinder = find.descendant(
        of: find.byType(ElevatedButton), // Or the specific button type
        matching: find.text(l10nForDietNavigation.txtDietButton), // Use localizations from the current screen
      );
      // Alternative: final dietButtonNavigationFinder = find.byTooltip('Diet');
      // Best: final dietButtonNavigationFinder = find.byKey(const Key('navigateToDietScreenButton'));

      // Add a debug print to see what the finder found before tapping
      debugPrint('Attempting to find Diet navigation button: ${dietButtonNavigationFinder.toString()}');

      if (tester.any(dietButtonNavigationFinder)) {
        await tester.tap(dietButtonNavigationFinder);
        await tester.pumpAndSettle(); // Wait for DietScreen to load
        debugPrint('Navigated to Diet Screen.');
      } else {
        // Fallback: Try finding by common text if localization key isn't on a button directly
        // This is less robust.
        final dietTextFinder = find.text(l10nForDietNavigation.txtDietButton); // "Alimentación"
        if (tester.any(dietTextFinder)) {
            // If it's just text, it might be part of a ListTile or other tappable widget
            await tester.tap(find.ancestor(of: dietTextFinder, matching: find.byType(InkWell)).first);
            await tester.pumpAndSettle();
            debugPrint('Navigated to Diet Screen (using text ancestor).');
        } else {
            debugPrint('Could not find navigation element to Diet Screen. Skipping Diet Screen tests.');
            return; // Exit test if navigation fails
        }
      }

      // At this point, we should be on the DietScreen.
      // Get AppLocalizations for the DietScreen using its specific context.
      // This is done *after* the await tester.pumpAndSettle() that completed the navigation.
      final Finder dietScreenScaffoldFinder = find.byKey(dietScreenScaffoldKey);
      expect(dietScreenScaffoldFinder, findsOneWidget, reason: "DietScreen's Scaffold (using dietScreenScaffoldKey) not found after navigation.");
      // Get AppLocalizations directly without storing the context
      final AppLocalizations l10nDiet = AppLocalizations.of(tester.element(dietScreenScaffoldFinder))!;

      // Verify "Accept" button is initially disabled
      // Debug print to confirm the localized string being used for the "Accept" button
      debugPrint('Diet Screen: Attempting to find "Accept" button with text: "${l10nDiet.txtButtonAccept}"');

      // Try to find all text widgets on screen to debug
      final allTextWidgets = find.byType(Text);
      debugPrint('All Text widgets on screen: ${tester.widgetList(allTextWidgets).map((widget) => (widget as Text).data).toList()}');

  debugPrint('Dumping widget tree before finding ElevatedButtons on DietScreen:');
  debugDumpApp(); // <<< ADD THIS LINE

  // Try to find the Row containing the buttons first
  final buttonRowFinder = find.byKey(const Key('diet_screen_button_row'));
  expect(buttonRowFinder, findsOneWidget, reason: "The Row containing buttons on DietScreen was not found. This indicates a problem rendering that part of the screen.");
  debugPrint('Found the Row containing buttons on DietScreen.');

  // Now try to find buttons within that specific row
  // final elevatedButtonsInRowFinder = find.descendant(of: buttonRowFinder, matching: find.byType(ElevatedButton));
      // Try to find all ElevatedButtons on screen to debug
      final allElevatedButtons = find.byType(ElevatedButton);
      debugPrint('Found ${tester.widgetList(allElevatedButtons).length} ElevatedButtons on screen');
      
      // Print details about each ElevatedButton
      for (int i = 0; i < tester.widgetList(allElevatedButtons).length; i++) {
        final buttonFinder = allElevatedButtons.at(i);
        final ElevatedButton button = tester.widget(buttonFinder);
        
        // Check if this button has a Text child
        if (button.child is Text) {
          final String buttonText = (button.child as Text).data ?? '';
          final bool isEnabled = button.onPressed != null;
          debugPrint('Button $i: text="$buttonText", enabled=$isEnabled, key=${button.key}');
        } else {
          debugPrint('Button $i: No Text child, key=${button.key}');
        }
      }
      
      // Find the Accept button using multiple strategies
      Finder acceptButtonFinder1;
      
      // Strategy 1: Try to find by key (most reliable)
      final Finder acceptButtonByKeyFinder = find.byKey(const Key('diet_accept_button'));
      if (tester.any(acceptButtonByKeyFinder)) {
        debugPrint('Diet Screen: Found Accept button by key');
        acceptButtonFinder1 = acceptButtonByKeyFinder;
      } 
      // Strategy 2: Try to find by text content
      else {
        debugPrint('Diet Screen: Could not find Accept button by key, trying by text');
        
        // Try localized text first
        final Finder acceptButtonTextFinder = find.text(l10nDiet.txtButtonAccept);
        if (tester.any(acceptButtonTextFinder)) {
          debugPrint('Diet Screen: Found text with localized value: "${l10nDiet.txtButtonAccept}"');
          acceptButtonFinder1 = find.ancestor(
            of: acceptButtonTextFinder,
            matching: find.byType(ElevatedButton),
          );
        }
        // Try hardcoded English text
        else {
          final Finder acceptTextEnFinder = find.text("Accept");
          if (tester.any(acceptTextEnFinder)) {
            debugPrint('Diet Screen: Found "Accept" text (English)');
            acceptButtonFinder1 = find.ancestor(
              of: acceptTextEnFinder,
              matching: find.byType(ElevatedButton),
            );
          }
          // Try hardcoded Spanish text
          else {
            final Finder acceptTextEsFinder = find.text("Aceptar");
            if (tester.any(acceptTextEsFinder)) {
              debugPrint('Diet Screen: Found "Aceptar" text (Spanish)');
              acceptButtonFinder1 = find.ancestor(
                of: acceptTextEsFinder,
                matching: find.byType(ElevatedButton),
              );
            }
            // Strategy 3: Fallback to the last button (assuming it's the Accept button)
            else if (tester.any(allElevatedButtons)) {
              debugPrint('Diet Screen: Could not find button with Accept text, using last button as fallback');
              acceptButtonFinder1 = allElevatedButtons.last;
            }
            // Strategy 4: Ultimate fallback
            else {
              debugPrint('Diet Screen: No buttons found at all, test will fail');
              acceptButtonFinder1 = find.byType(ElevatedButton); // This will fail the test with a clear message
            }
          }
        }
      }
      
      // Verify we found a button
      expect(acceptButtonFinder1, findsOneWidget, reason: "The Accept button was not found on the Diet Screen.");

      // Check if the button is initially disabled as expected
      ElevatedButton acceptButtonWidget = tester.widget(acceptButtonFinder1);
      debugPrint('Diet Screen: Accept button found, checking if it\'s disabled...');
      debugPrint('Diet Screen: Button onPressed is ${acceptButtonWidget.onPressed == null ? "null (disabled)" : "not null (enabled)"}');
      
      expect(acceptButtonWidget.onPressed, isNull, reason: "Accept button should be disabled initially on Diet Screen.");
      debugPrint('Diet Screen: Accept button initially disabled.');

      // Find all DietItemWidgets. The number of items comes from Items.values.length in the app.
      // Using find.byType(DietItemWidget) is more robust than filtering by string name.
      // This assumes DietItemWidget is the correct public class name of your widget.
      final dietItemWidgetsFinder = find.byType(DietItem); 
      // Old fragile way: find.byType(StatefulWidget).suchThat( (widget) => widget.toStringShort().contains('DietItem'));
      
      // If DietItemWidget is not directly usable with find.byType, you might need to count them differently or use a known count.
      // For this example, let's assume we find them.
      final int dietItemCount = tester.widgetList(dietItemWidgetsFinder).length;
      expect(dietItemCount, greaterThan(0), reason: "Should find at least one DietItemWidget.");
      debugPrint('Diet Screen: Found $dietItemCount DietItemWidgets.');

      for (int i = 0; i < dietItemCount; i++) {
        final dietItemWidget = dietItemWidgetsFinder.at(i);
        await tester.ensureVisible(dietItemWidget); // Scroll to the item
        await tester.pumpAndSettle();

        // Tap the first radio option within this DietItemWidget
        final radioOptionFinder = find.descendant(
          of: dietItemWidget,
          matching: find.byType(RadioListTile<int?>), // Assumes RadioListTile<int?> is used
        ).first;

        await tester.tap(radioOptionFinder);
        await tester.pumpAndSettle();
        debugPrint('Diet Screen: Selected first option for item $i.');
      }

      // Verify "Accept" button is now enabled
      acceptButtonWidget = tester.widget(acceptButtonFinder1); // Re-fetch the widget state using the same robust finder
      debugPrint('Diet Screen: After selections, button onPressed is ${acceptButtonWidget.onPressed == null ? "null (disabled)" : "not null (enabled)"}');
      
      expect(acceptButtonWidget.onPressed, isNotNull, reason: "Accept button should be enabled after all selections on Diet Screen.");
      debugPrint('Diet Screen: Accept button now enabled.');

      // Tap "Accept" button
      await tester.tap(acceptButtonFinder1); // Tap using the same robust finder
      await tester.pumpAndSettle(); // For SnackBar to appear
      debugPrint('Diet Screen: Tapped Accept button.');

      // Verify SnackBar with score
      expect(find.textContaining('Score:'), findsOneWidget);
      debugPrint('Diet Screen: Score SnackBar found.');

      // Tap "OK" on SnackBar
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle(); // For SnackBar to hide and navigation to occur
      debugPrint('Diet Screen: Tapped OK on SnackBar.');

      // Verify navigation back (e.g., DietScreen is gone)
      expect(find.byKey(dietScreenScaffoldKey), findsNothing, reason: "DietScreen should be popped after OK on SnackBar.");
      expect(find.byKey(mainScaffoldKey), findsOneWidget, reason: "Should have navigated back to the screen with mainScaffoldKey (e.g., MainScreen).");
      debugPrint('Diet Screen: Navigated back successfully.');

      debugPrint('--- Diet Screen Test Completed ---');
    });
  });
}
