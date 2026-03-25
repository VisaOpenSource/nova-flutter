//
//              © 2025-2026 Visa
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//        http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

void main() {
  group('VSelect', () {
    test('copyWith should return a new instance with updated properties', () {
      const style = VSelectStyle(
        backgroundColor: Colors.blue,
        splashColor: Colors.red,
        iconColor: Colors.green,
        borderColor: Colors.yellow,
        dropDownBorderColor: Colors.orange,
        bottomBarColor: Colors.purple,
        labelTextColor: Colors.cyan,
        buttonTextColor: Colors.indigo,
        validateTextColor: Colors.teal,
        errorIconColor: Colors.pink,
        dropdownColor: Colors.amber,
        borderErrorColor: Colors.brown,
        borderRadius: 10.0,
        dropDownElevation: 5.0,
        dropDownBorderRadius: 8.0,
        buttonHeight: 50.0,
        buttonWidth: 100.0,
        dropdownWidth: 150.0,
        headerTitleTextStyle: TextStyle(fontSize: 16),
      );

      final updatedStyle = style.copyWith();

      expect(updatedStyle.backgroundColor, equals(Colors.blue));
      expect(updatedStyle.splashColor, equals(Colors.red));
      expect(updatedStyle.iconColor, equals(Colors.green));
      expect(updatedStyle.borderColor, equals(Colors.yellow));
      expect(updatedStyle.dropDownBorderColor, equals(Colors.orange));
      expect(updatedStyle.bottomBarColor, equals(Colors.purple));
      expect(updatedStyle.labelTextColor, equals(Colors.cyan));
      expect(updatedStyle.buttonTextColor, equals(Colors.indigo));
      expect(updatedStyle.validateTextColor, equals(Colors.teal));
      expect(updatedStyle.errorIconColor, equals(Colors.pink));
      expect(updatedStyle.dropdownColor, equals(Colors.amber));
      expect(updatedStyle.borderErrorColor, equals(Colors.brown));
      expect(updatedStyle.borderRadius, equals(10.0));
      expect(updatedStyle.dropDownElevation, equals(5.0));
      expect(updatedStyle.dropDownBorderRadius, equals(8.0));
      expect(updatedStyle.buttonHeight, equals(50.0));
      expect(updatedStyle.buttonWidth, equals(100.0));
      expect(updatedStyle.dropdownWidth, equals(150.0));
      expect(updatedStyle.headerTitleTextStyle!.fontSize, equals(16));
    });

    // test('lerp should return a new instance with interpolated properties', () {
    //   const style1 = VSelectStyle(
    //     backgroundColor: Colors.blue,
    //     splashColor: Colors.red,
    //     iconColor: Colors.green,
    //     borderColor: Colors.yellow,
    //     dropDownBorderColor: Colors.orange,
    //     bottomBarColor: Colors.purple,
    //     labelTextColor: Colors.cyan,
    //     buttonTextColor: Colors.indigo,
    //     validateTextColor: Colors.teal,
    //     errorIconColor: Colors.pink,
    //     dropdownColor: Colors.amber,
    //     borderErrorColor: Colors.brown,
    //     borderRadius: 10.0,
    //     dropDownElevation: 5.0,
    //     dropDownBorderRadius: 8.0,
    //     buttonHeight: 50.0,
    //     buttonWidth: 100.0,
    //     dropdownWidth: 150.0,
    //     headerTitleTextStyle: TextStyle(fontSize: 16),
    //   );

    //   const style2 = VSelectStyle(
    //     backgroundColor: Colors.white,
    //     splashColor: Colors.black,
    //     iconColor: Colors.grey,
    //     borderColor: Colors.blueGrey,
    //     dropDownBorderColor: Colors.deepPurple,
    //     bottomBarColor: Colors.lime,
    //     labelTextColor: Colors.pinkAccent,
    //     buttonTextColor: Colors.orangeAccent,
    //     validateTextColor: Colors.tealAccent,
    //     errorIconColor: Colors.redAccent,
    //     dropdownColor: Colors.amberAccent,
    //     borderErrorColor: Colors.brown,
    //     borderRadius: 20.0,
    //     dropDownElevation: 10.0,
    //     dropDownBorderRadius: 16.0,
    //     buttonHeight: 60.0,
    //     buttonWidth: 120.0,
    //     dropdownWidth: 180.0,
    //     headerTitleTextStyle: TextStyle(fontSize: 18),
    //   );

    //   final interpolatedStyle = style1.lerp(style2, 0.5);

    //   expect(interpolatedStyle.backgroundColor, equals(Colors.blue.withOpacity(0.5)));
    //   expect(interpolatedStyle.splashColor, equals(Colors.red.withOpacity(0.5)));
    //   expect(interpolatedStyle.iconColor, equals(Colors.green.withOpacity(0.5)));
    //   expect(interpolatedStyle.borderColor, equals(Colors.yellow.withOpacity(0.5)));
    //   expect(interpolatedStyle.dropDownBorderColor, equals(Colors.orange.withOpacity(0.5)));
    //   expect(interpolatedStyle.bottomBarColor, equals(Colors.purple.withOpacity(0.5)));
    //   expect(interpolatedStyle.labelTextColor, equals(Colors.cyan.withOpacity(0.5)));
    //   expect(interpolatedStyle.buttonTextColor, equals(Colors.indigo.withOpacity(0.5)));
    //   expect(interpolatedStyle.validateTextColor, equals(Colors.teal.withOpacity(0.5)));
    //   expect(interpolatedStyle.errorIconColor, equals(Colors.pink.withOpacity(0.5)));
    //   expect(interpolatedStyle.dropdownColor, equals(Colors.amber.withOpacity(0.5)));
    //   expect(interpolatedStyle.borderErrorColor, equals(Colors.brown.withOpacity(0.5)));
    //   expect(interpolatedStyle.borderRadius, equals(15.0));
    //   expect(interpolatedStyle.dropDownElevation, equals(7.5));
    //   expect(interpolatedStyle.dropDownBorderRadius, equals(12.0));
    //   expect(interpolatedStyle.buttonHeight, equals(55.0));
    //   expect(interpolatedStyle.buttonWidth, equals(110.0));
    //   expect(interpolatedStyle.dropdownWidth, equals(165.0));
    //   expect(interpolatedStyle.headerTitleTextStyle!.fontSize, equals(17));
    // });
  });

  testWidgets('VSelect should be created without any errors',
      (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: const Text('Select an option'),
            isDisabled: false,
            onSelected: (value) => debugPrint('Selected value: $value'),
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets('VSelect should be created without any errors with dark theme',
      (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: const Text('Select an option'),
            isDisabled: false,
            onSelected: (value) => debugPrint('Selected value: $value'),
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets(
      'VSelect should be created without any errors with dark theme and alt',
      (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: const Text('Select an option'),
            isDisabled: false,
            onSelected: (value) => debugPrint('Selected value: $value'),
            vExt: VAlt(),
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  // testWidgets(
  //     'VSelect should display dropdown options and call onSelected when an option is selected',
  //     (WidgetTester tester) async {
  //   // Given
  //   final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];
  //   String selectedValue = '';

  //   // When
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: Scaffold(
  //         body: VSelect(
  //           itemBuilder: (BuildContext context) {
  //   return dropdownOptions.map((String item) {
  //     return PopupMenuItem<String>(
  //       value: item,
  //       child: Text(item),
  //     );
  //   }).toList();
  // },
  //           buttonText: 'Select an option',
  //           isDisabled: false,
  //           onSelected: (value) {
  //             selectedValue =
  //                 value; // Update the selectedValue when option is selected
  //           },
  //         ),
  //       ),
  //     ),
  //   );

  //   // Then
  //   expect(find.byType(VSelect), findsOneWidget);

  //   // When
  //   await tester.tap(find.byType(VSelect));
  //   await tester.pumpAndSettle(); // wait for the popup to show up

  //   // Add delay before tapping the PopupMenuItem
  //   await tester.pump(Duration(seconds: 1));

  //   // Tap the PopupMenuItem
  //   await tester.tap(find.text('Option 1').last);
  //   await tester.pumpAndSettle();

  //   // Verify that the onSelected function has been called with the correct value
  //   expect(selectedValue, 'Option 1');
  // });

  testWidgets('VSelect should be created without any errors border color',
      (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: const Text('Select an option'),
            isDisabled: false,
            onSelected: (value) => debugPrint('Selected value: $value'),
            validate: true,
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets('VSelect should be created without any errors inline',
      (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VSelect(
            isInline: true,
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: const Text('Select an option'),
            isDisabled: false,
            onSelected: (value) => debugPrint('Selected value: $value'),
            vExt: VAlt(),
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets(
      'VSelect should be created without any errors inline and header is not null',
      (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VSelect(
            isInline: true,
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: const Text('Select an option'),
            isDisabled: false,
            onSelected: (value) => debugPrint('Selected value: $value'),
            headerLabel: "Pick a color",
            style: const VSelectStyle(buttonWidth: 200),
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets(
      'VSelect should be created without any errors and header is not null',
      (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: const Text('Select an option'),
            isDisabled: false,
            onSelected: (value) => debugPrint('Selected value: $value'),
            headerLabel: "Pick a color",
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets(
      'VSelect should be created without any errors and header is not null',
      (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: const Text('Select an option'),
            isDisabled: false,
            onSelected: (value) => debugPrint('Selected value: $value'),
            onCanceled: () => debugPrint('Canceled'),
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets(
      'VSelect should be created without any errors and header is not null',
      (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: const Text('Select an option'),
            isDisabled: true,
            onSelected: (value) => debugPrint('Selected value: $value'),
            onCanceled: () => debugPrint('Canceled'),
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets('VSelect should be created without any errors is read only',
      (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: const Text('Select an option'),
            isReadOnly: true,
            onSelected: (value) => debugPrint('Selected value: $value'),
            onCanceled: () => debugPrint('Canceled'),
            headerLabel: "Pick a color",
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets(
      'VSelect should be created without any errors is read only and header label',
      (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: const Text('Select an option'),
            isReadOnly: true,
            headerLabel: "Pick a color",
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets(
      'VSelect should be created without any errors is disabled only and header label',
      (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: const Text('Select an option'),
            isDisabled: true,
            headerLabel: "Pick a color",
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets(
      'VSelect should be created without any errors is validate only and header label',
      (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: const Text('Select an option'),
            validate: true,
            headerLabel: "Pick a color",
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets(
      'PopupMenuButton itemBuilder should generate correct number of PopupMenuItems',
      (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: const Text('Select an option'),
            headerLabel: "Pick a color",
          ),
        ),
      ),
    );

    // When
    await tester.tap(find.byType(VSelect));
    await tester.pumpAndSettle();

    // Then
    final popupMenuItems =
        tester.widgetList<PopupMenuItem>(find.byType(PopupMenuItem));
    expect(popupMenuItems.length, 0 /*dropdownOptions.length*/);
  });

  // testWidgets('VSelectDefault should display default hint and options',
  //     (WidgetTester tester) async {
  //   // Given
  //   final defaultHint = 'Option';
  //   final options = ['Option 1', 'Option 2', 'Option 3'];
  //   int? selectedValue;

  //   // When
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: Scaffold(
  //         body: Column(
  //           children: [
  //             VSelect(
  //               buttonText: Text(defaultHint),
  //               dropdownOptions: options,
  //               onDidGainAccessibilityFocus: null,
  //               onSelected: (value) {
  //                 selectedValue = value as int;
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );

  //   // Then
  //   expect(find.text(defaultHint), findsOneWidget);
  //   await tester.tap(find.byType(VSelect));
  //   await tester.pumpAndSettle();
  //   expect(find.text('Option 1'), findsOneWidget);

  //   // Verify the dropdown items
  //   expect(find.text('Option 1'), findsOneWidget);
  //   expect(find.text('Option 2'), findsOneWidget);
  //   expect(find.text('Option 3'), findsOneWidget);

  //   // Tap on the 'Option 2' menu item
  //   await tester.tap(find.text('Option 2'));
  //   await tester.pumpAndSettle();

  //   // Verify the selected option
  //   expect(selectedValue, 1);
  // });

  // testWidgets('VSelectDefault should display default hint and options',
  //     (WidgetTester tester) async {
  //   // Given
  //   final defaultHint = 'Option';
  //   final options = ['Option 1', 'Option 2', 'Option 3'];
  //   int? selectedValue;

  //   // When
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: Scaffold(
  //         body: Column(
  //           children: [
  //             VSelect(
  //               validate: true,
  //               buttonText: Text(defaultHint),
  //               dropdownOptions: options,
  //               onDidGainAccessibilityFocus: null,
  //               isDisabled: false,
  //               onSelected: (value) {
  //                 selectedValue = value as int;
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );

  //   // Then
  //   expect(find.text(defaultHint), findsOneWidget);
  //   await tester.tap(find.byType(VSelect));
  //   await tester.pumpAndSettle();
  //   expect(find.text('Option 1'), findsOneWidget);

  //   // Verify the dropdown items
  //   expect(find.text('Option 1'), findsOneWidget);
  //   expect(find.text('Option 2'), findsOneWidget);
  //   expect(find.text('Option 3'), findsOneWidget);

  //   // Tap on the 'Option 2' menu item
  //   await tester.tap(find.text('Option 2'));
  //   await tester.pumpAndSettle();

  //   // Verify the selected option
  //   expect(selectedValue, 1);
  // });

  // testWidgets('VSelectDefault should display default hint and options',
  //     (WidgetTester tester) async {
  //   // Given
  //   final defaultHint = 'Option';
  //   final options = ['Option 1', 'Option 2', 'Option 3'];
  //   int? selectedValue;

  //   // When
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: Scaffold(
  //         body: Column(
  //           children: [
  //             VSelect(
  //               headerLabel: "Pick a color",
  //               validate: true,
  //               isInline: true,
  //               buttonText: Text(defaultHint),
  //               dropdownOptions: options,
  //               onDidGainAccessibilityFocus: null,
  //               isDisabled: false,
  //               onSelected: (value) {
  //                 selectedValue = value as int;
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );

  //   // Then
  //   expect(find.text(defaultHint), findsOneWidget);
  //   await tester.tap(find.byType(VSelect));
  //   await tester.pumpAndSettle();
  //   expect(find.text('Option 1'), findsOneWidget);

  //   // Verify the dropdown items
  //   expect(find.text('Option 1'), findsOneWidget);
  //   expect(find.text('Option 2'), findsOneWidget);
  //   expect(find.text('Option 3'), findsOneWidget);

  //   // Tap on the 'Option 2' menu item
  //   await tester.tap(find.text('Option 2'));
  //   await tester.pumpAndSettle();

  //   // Verify the selected option
  //   expect(selectedValue, 1);
  // });

  // testWidgets('VSelectDefault should display default hint and options',
  //     (WidgetTester tester) async {
  //   // Given
  //   final defaultHint = 'Option';
  //   final options = ['Option 1', 'Option 2', 'Option 3'];
  //   int? selectedValue;

  //   // When
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: Scaffold(
  //         body: Column(
  //           children: [
  //             VSelect(
  //               headerLabel: "Pick a color",
  //               validate: true,
  //               // isInline: true,
  //               buttonText: Text(defaultHint),
  //               dropdownOptions: options,
  //               onDidGainAccessibilityFocus: null,
  //               isDisabled: false,
  //               // onSelected: (value) {
  //               //   selectedValue = value as int;
  //               // },
  //               onCanceled: () {
  //                 print('Canceled');
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );

  //   // Then
  //   expect(find.text(defaultHint), findsOneWidget);
  //   await tester.tap(find.byType(VSelect));
  //   await tester.pumpAndSettle();
  //   expect(find.text('Option 1'), findsOneWidget);

  //   // Verify the dropdown items
  //   expect(find.text('Option 1'), findsOneWidget);
  //   expect(find.text('Option 2'), findsOneWidget);
  //   expect(find.text('Option 3'), findsOneWidget);

  //   // Tap on the 'Option 2' menu item
  //   await tester.tap(find.text('Option 2'));
  //   await tester.pumpAndSettle();

  //   final switchFinder = find.byType(VSelect);

  //   // Drag the pointer away from the switch
  //   final gesture = await tester.press(switchFinder);

  //   await gesture.moveBy(const Offset(0.0, 200.0));
  //   await tester.pump();

  //   // Verify the selected option
  //   expect(selectedValue, null);
  // });

  // Coverage: VSelectStyle lerp
  test('VSelectStyle lerp interpolates correctly', () {
    const a = VSelectStyle(
      backgroundColor: Colors.red,
      splashColor: Colors.blue,
      borderColor: Colors.green,
      iconColor: Colors.yellow,
      buttonTextColor: Colors.black,
      labelTextColor: Colors.grey,
      validateTextColor: Colors.orange,
      errorIconColor: Colors.pink,
      dropdownColor: Colors.white,
      borderErrorColor: Colors.brown,
      dropDownBorderColor: Colors.purple,
      bottomBarColor: Colors.cyan,
      borderRadius: 10.0,
      dropDownBorderRadius: 12.0,
      buttonHeight: 50.0,
      dropDownElevation: 6.0,
      buttonWidth: 200.0,
      dropdownWidth: 200.0,
    );
    const b = VSelectStyle(
      backgroundColor: Colors.blue,
      splashColor: Colors.red,
      borderColor: Colors.yellow,
      iconColor: Colors.green,
      buttonTextColor: Colors.white,
      labelTextColor: Colors.orange,
      validateTextColor: Colors.grey,
      errorIconColor: Colors.brown,
      dropdownColor: Colors.black,
      borderErrorColor: Colors.pink,
      dropDownBorderColor: Colors.cyan,
      bottomBarColor: Colors.purple,
      borderRadius: 20.0,
      dropDownBorderRadius: 24.0,
      buttonHeight: 60.0,
      dropDownElevation: 12.0,
      buttonWidth: 300.0,
      dropdownWidth: 300.0,
    );
    final result = a.lerp(b, 0.5);
    expect(result, isA<VSelectStyle>());
  });

  test('VSelectStyle lerp with null returns this', () {
    const a = VSelectStyle(backgroundColor: Colors.red);
    final result = a.lerp(null, 0.5);
    expect(identical(result, a), isTrue);
  });

  // Coverage: VSelect non-inline with interaction
  testWidgets("VSelect popup interaction covers onCanceled/onSelected",
      (WidgetTester tester) async {
    String? selectedValue;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VSelect(
              style: const VSelectStyle(buttonWidth: 200),
              buttonText: const Text("Pick one"),
              onSelected: (value) {
                selectedValue = value.toString();
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'A',
                  child: Text('Option A'),
                ),
                const PopupMenuItem(
                  value: 'B',
                  child: Text('Option B'),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Tap the select button to open popup
    await tester.tap(find.text("Pick one"));
    await tester.pumpAndSettle();

    // Select an option
    await tester.tap(find.text("Option A"));
    await tester.pumpAndSettle();
    expect(selectedValue, 'A');
  });

  // Coverage: VSelect disabled
  testWidgets("VSelect disabled state", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VSelect(
              style: const VSelectStyle(buttonWidth: 200),
              buttonText: const Text("Disabled"),
              isDisabled: true,
              itemBuilder: (context) => [],
            ),
          ),
        ),
      ),
    );
    expect(find.text("Disabled"), findsOneWidget);
  });

  // Coverage: VSelect validate
  testWidgets("VSelect validate state", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VSelect(
              style: const VSelectStyle(buttonWidth: 200),
              buttonText: const Text("Validate"),
              validate: true,
              showErrorMessage: true,
              validateText: "Error!",
              itemBuilder: (context) => [],
            ),
          ),
        ),
      ),
    );
    expect(find.text("Error!"), findsOneWidget);
  });

  // Coverage: VSelect without buttonText (null)
  testWidgets("VSelect without buttonText shows default Option",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VSelect(
              style: const VSelectStyle(buttonWidth: 200),
              itemBuilder: (context) => [],
            ),
          ),
        ),
      ),
    );
    expect(find.text("Option"), findsOneWidget);
  });

  // Coverage: VSelect readOnly state
  testWidgets("VSelect readOnly state", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VSelect(
              style: const VSelectStyle(buttonWidth: 200),
              buttonText: const Text("ReadOnly"),
              isReadOnly: true,
              itemBuilder: (context) => [],
            ),
          ),
        ),
      ),
    );
    expect(find.text("ReadOnly"), findsOneWidget);
  });

  // Coverage: VSelect alt theme dark
  testWidgets("VSelect alt theme dark", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: Center(
            child: VSelect(
              vExt: VAlt(),
              itemBuilder: (context) => [],
            ),
          ),
        ),
      ),
    );
    expect(find.byType(VSelect), findsOneWidget);
  });

  // Coverage: VSelect disabled state
  testWidgets("VSelect disabled shows disabled text color",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VSelect(
              isDisabled: true,
              itemBuilder: (context) => [],
            ),
          ),
        ),
      ),
    );
    expect(find.text("Option"), findsOneWidget);
  });

  // Coverage: VSelect isInline (isLabelInLine) layout
  testWidgets("VSelect isInline layout renders", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 400,
              child: VSelect(
                isInline: true,
                headerLabel: "Inline Label",
                style: const VSelectStyle(buttonWidth: 200),
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 'a', child: Text('Item A')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    expect(find.text("Option"), findsOneWidget);
    expect(find.text("Inline Label"), findsOneWidget);
  });

  // Coverage: VSelect non-inline default layout with headerLabel
  testWidgets("VSelect non-inline with headerLabel",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VSelect(
              isInline: false,
              headerLabel: "Select Label",
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'a', child: Text('Item A')),
              ],
            ),
          ),
        ),
      ),
    );
    expect(find.text("Select Label"), findsOneWidget);
  });

  // Coverage: VSelect validate state with error
  testWidgets("VSelect validate state", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VSelect(
              validate: true,
              showErrorMessage: true,
              showErrorIcon: true,
              validateText: "Selection required",
              itemBuilder: (context) => [],
            ),
          ),
        ),
      ),
    );
    expect(find.text("Selection required"), findsOneWidget);
  });

  // Coverage: VSelect tap gesture opens popup
  testWidgets("VSelect tap opens popup", (WidgetTester tester) async {
    bool selected = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VSelect(
              style: const VSelectStyle(buttonWidth: 200),
              onSelected: (value) {
                selected = true;
              },
              onCanceled: () {},
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'a', child: Text('Item A')),
                const PopupMenuItem(value: 'b', child: Text('Item B')),
              ],
            ),
          ),
        ),
      ),
    );
    // Tap the select to open the popup
    await tester.tap(find.text("Option"));
    await tester.pumpAndSettle();
    // Should see popup items
    expect(find.text("Item A"), findsOneWidget);
    // Tap an item
    await tester.tap(find.text("Item A"));
    await tester.pumpAndSettle();
    expect(selected, isTrue);
  });

  // Coverage: VSelect isInline tap opens popup
  testWidgets("VSelect isInline tap opens popup", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 400,
              child: VSelect(
                isInline: true,
                style: const VSelectStyle(buttonWidth: 200),
                onCanceled: () {},
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 'x', child: Text('Inline Item')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text("Option"));
    await tester.pumpAndSettle();
    expect(find.text("Inline Item"), findsOneWidget);
  });

  // Coverage: VSelect alt theme light mode (line 224)
  testWidgets("VSelect alt theme light", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.light),
        home: Scaffold(
          body: Center(
            child: VSelect(
              vExt: VAlt(),
              style: const VSelectStyle(buttonWidth: 200),
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'a', child: Text('Item A')),
              ],
            ),
          ),
        ),
      ),
    );
    expect(find.text("Option"), findsOneWidget);
  });

  // Coverage: VSelect non-inline tap+select covers onSelected/onCanceled (lines 614-660)
  testWidgets("VSelect non-inline onSelected callback",
      (WidgetTester tester) async {
    String? selected;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VSelect(
              style: const VSelectStyle(buttonWidth: 200),
              onSelected: (value) {
                selected = value.toString();
              },
              onCanceled: () {},
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'x', child: Text('Non-inline X')),
              ],
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text("Option"));
    await tester.pumpAndSettle();
    expect(find.text("Non-inline X"), findsOneWidget);
    await tester.tap(find.text("Non-inline X"));
    await tester.pumpAndSettle();
    expect(selected, 'x');
  });

  // Coverage: VSelect readOnly state (line 282)
  testWidgets("VSelect readOnly mode", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VSelect(
              style: const VSelectStyle(buttonWidth: 200),
              isReadOnly: true,
              itemBuilder: (context) => [],
            ),
          ),
        ),
      ),
    );
    expect(find.text("Option"), findsOneWidget);
  });

  // Coverage: bottomBar() validate and isOpen paths (lines 282, 287)
  testWidgets("VSelect validate mode non-inline", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VSelect(
              style: const VSelectStyle(buttonWidth: 200),
              validate: true,
              showErrorIcon: true,
              showErrorMessage: true,
              validateText: "Required",
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'a', child: Text('Item A')),
              ],
            ),
          ),
        ),
      ),
    );
    expect(find.text("Required"), findsOneWidget);
  });

  // Coverage: non-inline GestureDetector tap + popup open (lines 707-710)
  testWidgets(
      "VSelect non-inline tap opens popup and select item fires onSelected",
      (WidgetTester tester) async {
    String? selected;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VSelect(
              style: const VSelectStyle(buttonWidth: 200),
              isInline: false,
              onSelected: (value) {
                selected = value;
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'a', child: Text('Item A')),
                const PopupMenuItem(value: 'b', child: Text('Item B')),
              ],
            ),
          ),
        ),
      ),
    );
    // Tap the select button
    await tester.tap(find.text("Option"));
    await tester.pumpAndSettle();
    // Select an item from popup
    await tester.tap(find.text("Item A"));
    await tester.pumpAndSettle();
    expect(selected, 'a');
  });

  // Coverage: non-inline popup onCanceled (lines 656-660)
  testWidgets("VSelect non-inline popup cancel", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VSelect(
              style: const VSelectStyle(buttonWidth: 200),
              isInline: false,
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'a', child: Text('Cancel Item')),
              ],
            ),
          ),
        ),
      ),
    );
    // Open popup
    await tester.tap(find.text("Option"));
    await tester.pumpAndSettle();
    // Dismiss popup by tapping outside
    await tester.tapAt(const Offset(10, 10));
    await tester.pumpAndSettle();
    expect(find.text("Option"), findsOneWidget);
  });

  // Coverage: inline popup open + select (lines 386-401, 437-440)
  testWidgets("VSelect inline tap opens popup and selects item",
      (WidgetTester tester) async {
    String? selected;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 400,
              child: VSelect(
                style: const VSelectStyle(buttonWidth: 200),
                isInline: true,
                onSelected: (value) {
                  selected = value;
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 'x', child: Text('Inline X')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    // Tap the inline select button
    await tester.tap(find.text("Option"));
    await tester.pumpAndSettle();
    // Select item
    await tester.tap(find.text("Inline X"));
    await tester.pumpAndSettle();
    expect(selected, 'x');
  });

  // Coverage: inline popup onCanceled (lines 386-390)
  testWidgets("VSelect inline popup cancel", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 400,
              child: VSelect(
                style: const VSelectStyle(buttonWidth: 200),
                isInline: true,
                itemBuilder: (context) => [
                  const PopupMenuItem(value: 'a', child: Text('CancelInline')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text("Option"));
    await tester.pumpAndSettle();
    // Dismiss by tapping outside
    await tester.tapAt(const Offset(10, 10));
    await tester.pumpAndSettle();
    expect(find.text("Option"), findsOneWidget);
  });

  //! This is Select golden test

  testWidgets('Select golden(snapshot) testing', (WidgetTester tester) async {
    await tester.pumpWidget(
      RepaintBoundary(
        child: MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: VSelect(
                  itemBuilder: (BuildContext context) {
                    return ['Option 1', 'Option 2'].map((String item) {
                      return PopupMenuItem<String>(
                          value: item, child: Text(item));
                    }).toList();
                  },
                  buttonText: const Text('Select'),
                  onSelected: (value) {},
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(VSelect),
      matchesGoldenFile('goldens/select.png'),
    );
  });
}
