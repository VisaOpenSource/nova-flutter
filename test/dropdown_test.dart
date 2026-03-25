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
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:ui';

void main() {
  group('VDropdownIconStyle', () {
    test('copyWith should update the fields correctly', () {
      const style = VDropdownIconStyle(
        dropDownColor: Colors.red,
        dropdownBorderColor: Colors.green,
        backgroundSplashColor: Colors.blue,
        buttonDefaultColor: Colors.orange,
        defaultSecButtonColor: Colors.pink,
        defaultIconColor: Colors.purple,
        disabledButtonColor: Colors.brown,
        disabledIconColor: Colors.yellow,
        isSecDisabledBorderColor: Colors.cyan,
        isSecDisabledButtonColor: Colors.indigo,
        isSecTappedButtonColor: Colors.teal,
        tappedButtonColor: Colors.lime,
        isSecDefaultBorderColor: Colors.amber,
        disabledBorderColor: Colors.deepOrange,
        defaultBorderColor: Colors.lightGreen,
        isSecDisabledIconColor: Colors.deepPurple,
        isSecDefaultIconColor: Colors.lightBlue,
        dropdownTextStyle: TextStyle(color: Colors.black),
        dropdownBorderRadius: 5.0,
        bigIconSize: 20.0,
        defaultIconSize: 15.0,
      );

      final updatedStyle = style.copyWith();

      expect(updatedStyle.dropDownColor, Colors.red);
      expect(updatedStyle.dropdownBorderColor, Colors.green);
      expect(updatedStyle.backgroundSplashColor, Colors.blue);
      expect(updatedStyle.buttonDefaultColor, Colors.orange);
      expect(updatedStyle.defaultSecButtonColor, Colors.pink);
      expect(updatedStyle.defaultIconColor, Colors.purple);
      expect(updatedStyle.disabledButtonColor, Colors.brown);
      expect(updatedStyle.disabledIconColor, Colors.yellow);
      expect(updatedStyle.isSecDisabledBorderColor, Colors.cyan);
      expect(updatedStyle.isSecDisabledButtonColor, Colors.indigo);
      expect(updatedStyle.isSecTappedButtonColor, Colors.teal);
      expect(updatedStyle.tappedButtonColor, Colors.lime);
      expect(updatedStyle.isSecDefaultBorderColor, Colors.amber);
      expect(updatedStyle.disabledBorderColor, Colors.deepOrange);
      expect(updatedStyle.defaultBorderColor, Colors.lightGreen);
      expect(updatedStyle.isSecDisabledIconColor, Colors.deepPurple);
      expect(updatedStyle.isSecDefaultIconColor, Colors.lightBlue);
      expect(updatedStyle.dropdownTextStyle?.color, Colors.black);
      expect(updatedStyle.dropdownBorderRadius, 5.0);
      expect(updatedStyle.bigIconSize, 20.0);
      expect(updatedStyle.defaultIconSize, 15.0);
    });

    test('lerp should return the correct interpolated values', () {
      const style1 = VDropdownIconStyle(
        dropDownColor: Colors.red,
        dropdownBorderColor: Colors.green,
        backgroundSplashColor: Colors.blue,
        buttonDefaultColor: Colors.orange,
        defaultSecButtonColor: Colors.pink,
        defaultIconColor: Colors.purple,
        disabledButtonColor: Colors.brown,
        disabledIconColor: Colors.yellow,
        isSecDisabledBorderColor: Colors.cyan,
        isSecDisabledButtonColor: Colors.indigo,
        isSecTappedButtonColor: Colors.teal,
        tappedButtonColor: Colors.lime,
        isSecDefaultBorderColor: Colors.amber,
        disabledBorderColor: Colors.deepOrange,
        defaultBorderColor: Colors.lightGreen,
        isSecDisabledIconColor: Colors.deepPurple,
        isSecDefaultIconColor: Colors.lightBlue,
        dropdownTextStyle: TextStyle(color: Colors.black),
        dropdownBorderRadius: 5.0,
        bigIconSize: 20.0,
        defaultIconSize: 15.0,
      );

      const style2 = VDropdownIconStyle(
        dropDownColor: Colors.black,
        dropdownBorderColor: Colors.white,
        backgroundSplashColor: Colors.grey,
        buttonDefaultColor: Colors.red,
        defaultSecButtonColor: Colors.green,
        defaultIconColor: Colors.blue,
        disabledButtonColor: Colors.orange,
        disabledIconColor: Colors.pink,
        isSecDisabledBorderColor: Colors.purple,
        isSecDisabledButtonColor: Colors.brown,
        isSecTappedButtonColor: Colors.yellow,
        tappedButtonColor: Colors.cyan,
        isSecDefaultBorderColor: Colors.indigo,
        disabledBorderColor: Colors.teal,
        defaultBorderColor: Colors.lime,
        isSecDisabledIconColor: Colors.amber,
        isSecDefaultIconColor: Colors.deepOrange,
        dropdownTextStyle: TextStyle(color: Colors.white),
        dropdownBorderRadius: 10.0,
        bigIconSize: 25.0,
        defaultIconSize: 20.0,
      );

      final lerpStyle = style1.lerp(style2, 0.5);

      // Check for each property
      expect(
          lerpStyle.dropDownColor, Color.lerp(Colors.red, Colors.black, 0.5));
      expect(lerpStyle.dropdownBorderColor,
          Color.lerp(Colors.green, Colors.white, 0.5));
      expect(lerpStyle.backgroundSplashColor,
          Color.lerp(Colors.blue, Colors.grey, 0.5));
      expect(lerpStyle.buttonDefaultColor,
          Color.lerp(Colors.orange, Colors.red, 0.5));
      expect(lerpStyle.defaultSecButtonColor,
          Color.lerp(Colors.pink, Colors.green, 0.5));
      expect(lerpStyle.defaultIconColor,
          Color.lerp(Colors.purple, Colors.blue, 0.5));
      expect(lerpStyle.disabledButtonColor,
          Color.lerp(Colors.brown, Colors.orange, 0.5));
      expect(lerpStyle.disabledIconColor,
          Color.lerp(Colors.yellow, Colors.pink, 0.5));
      expect(lerpStyle.isSecDisabledBorderColor,
          Color.lerp(Colors.cyan, Colors.purple, 0.5));
      expect(lerpStyle.isSecDisabledButtonColor,
          Color.lerp(Colors.indigo, Colors.brown, 0.5));
      expect(lerpStyle.isSecTappedButtonColor,
          Color.lerp(Colors.teal, Colors.yellow, 0.5));
      expect(lerpStyle.tappedButtonColor,
          Color.lerp(Colors.lime, Colors.cyan, 0.5));
      expect(lerpStyle.isSecDefaultBorderColor,
          Color.lerp(Colors.amber, Colors.indigo, 0.5));
      expect(lerpStyle.disabledBorderColor,
          Color.lerp(Colors.deepOrange, Colors.teal, 0.5));
      expect(lerpStyle.defaultBorderColor,
          Color.lerp(Colors.lightGreen, Colors.lime, 0.5));
      expect(lerpStyle.isSecDisabledIconColor,
          Color.lerp(Colors.deepPurple, Colors.amber, 0.5));
      expect(lerpStyle.isSecDefaultIconColor,
          Color.lerp(Colors.lightBlue, Colors.deepOrange, 0.5));
      expect(lerpStyle.dropdownBorderRadius, lerpDouble(5.0, 10.0, 0.5));
      expect(lerpStyle.bigIconSize, lerpDouble(20.0, 25.0, 0.5));
      expect(lerpStyle.defaultIconSize, lerpDouble(15.0, 20.0, 0.5));
    });
  });

  test('copyWith should correctly copy the values', () {
    const style1 = VDropdownTextButtonStyle(
      dropDownColor: Colors.red,
      backgroundSplashColor: Colors.green,
      dropdownBorderColor: Colors.blue,
      buttonDefaultColor: Colors.orange,
      defaultBorderColor: Colors.yellow,
      bigButtonSize: 15.0,
      defaultButtonSize: 10.0,
      defaultSecButtonColor: Colors.pink,
      disabledButtonColor: Colors.brown,
      isSecDisabledBorderColor: Colors.cyan,
      isSecDisabledButtonColor: Colors.indigo,
      isSecTappedButtonColor: Colors.teal,
      tappedButtonColor: Colors.lime,
      isSecDefaultBorderColor: Colors.amber,
      disabledBorderColor: Colors.deepOrange,
      defaultIconColor: Colors.lightGreen,
      isSecDefaultIconColor: Colors.deepPurple,
      isSecDisabledIconColor: Colors.lightBlue,
      disabledIconColor: Colors.grey,
      secBackgroundSplashColor: Colors.black,
      dropdownTextStyle: TextStyle(color: Colors.white),
      bigIconTextStyle: TextStyle(color: Colors.black),
      smallIconTextStyle: TextStyle(color: Colors.grey),
      borderRadius: 5.0,
      dropdownBorderRadius: 10.0,
    );

    final style2 = style1.copyWith();

    expect(style2.dropDownColor, Colors.red);
    expect(style2.backgroundSplashColor, Colors.green);
    expect(style2.dropdownBorderColor, Colors.blue);
    expect(style2.buttonDefaultColor, Colors.orange);
    expect(style2.defaultBorderColor, Colors.yellow);
    expect(style2.bigButtonSize, 15.0);
    expect(style2.defaultButtonSize, 10.0);
    expect(style2.defaultSecButtonColor, Colors.pink);
    expect(style2.disabledButtonColor, Colors.brown);
    expect(style2.isSecDisabledBorderColor, Colors.cyan);
    expect(style2.isSecDisabledButtonColor, Colors.indigo);
    expect(style2.isSecTappedButtonColor, Colors.teal);
    expect(style2.tappedButtonColor, Colors.lime);
    expect(style2.isSecDefaultBorderColor, Colors.amber);
    expect(style2.disabledBorderColor, Colors.deepOrange);
    expect(style2.defaultIconColor, Colors.lightGreen);
    expect(style2.isSecDefaultIconColor, Colors.deepPurple);
    expect(style2.isSecDisabledIconColor, Colors.lightBlue);
    expect(style2.disabledIconColor, Colors.grey);
    expect(style2.secBackgroundSplashColor, Colors.black);
    expect(style2.dropdownTextStyle, const TextStyle(color: Colors.white));
    expect(style2.bigIconTextStyle, const TextStyle(color: Colors.black));
    expect(style2.smallIconTextStyle, const TextStyle(color: Colors.grey));
    expect(style2.borderRadius, 5.0);
    expect(style2.dropdownBorderRadius, 10.0);
  });

  test('lerp should return the correct interpolated values', () {
    const style1 = VDropdownTextButtonStyle(
      dropDownColor: Colors.red,
      backgroundSplashColor: Colors.green,
      dropdownBorderColor: Colors.blue,
      buttonDefaultColor: Colors.orange,
      defaultBorderColor: Colors.yellow,
      bigButtonSize: 15.0,
      defaultButtonSize: 10.0,
      defaultSecButtonColor: Colors.pink,
      disabledButtonColor: Colors.brown,
      isSecDisabledBorderColor: Colors.cyan,
      isSecDisabledButtonColor: Colors.indigo,
      isSecTappedButtonColor: Colors.teal,
      tappedButtonColor: Colors.lime,
      isSecDefaultBorderColor: Colors.amber,
      disabledBorderColor: Colors.deepOrange,
      defaultIconColor: Colors.lightGreen,
      isSecDefaultIconColor: Colors.deepPurple,
      isSecDisabledIconColor: Colors.lightBlue,
      disabledIconColor: Colors.grey,
      secBackgroundSplashColor: Colors.black,
      dropdownTextStyle: TextStyle(color: Colors.white),
      bigIconTextStyle: TextStyle(color: Colors.black),
      smallIconTextStyle: TextStyle(color: Colors.grey),
      borderRadius: 5.0,
      dropdownBorderRadius: 10.0,
    );

    const style2 = VDropdownTextButtonStyle(
      dropDownColor: Colors.yellow,
      backgroundSplashColor: Colors.orange,
      dropdownBorderColor: Colors.purple,
      buttonDefaultColor: Colors.black,
      defaultBorderColor: Colors.white,
      bigButtonSize: 20.0,
      defaultButtonSize: 15.0,
      defaultSecButtonColor: Colors.blue,
      disabledButtonColor: Colors.red,
      isSecDisabledBorderColor: Colors.green,
      isSecDisabledButtonColor: Colors.purple,
      isSecTappedButtonColor: Colors.brown,
      tappedButtonColor: Colors.cyan,
      isSecDefaultBorderColor: Colors.indigo,
      disabledBorderColor: Colors.teal,
      defaultIconColor: Colors.lime,
      isSecDefaultIconColor: Colors.amber,
      isSecDisabledIconColor: Colors.deepOrange,
      disabledIconColor: Colors.lightGreen,
      secBackgroundSplashColor: Colors.deepPurple,
      dropdownTextStyle: TextStyle(color: Colors.black),
      bigIconTextStyle: TextStyle(color: Colors.white),
      smallIconTextStyle: TextStyle(color: Colors.orange),
      borderRadius: 10.0,
      dropdownBorderRadius: 15.0,
    );

    final lerpStyle = style1.lerp(style2, 0.5);

    expect(lerpStyle.dropDownColor, Color.lerp(Colors.red, Colors.yellow, 0.5));
    expect(lerpStyle.backgroundSplashColor,
        Color.lerp(Colors.green, Colors.orange, 0.5));
    expect(lerpStyle.dropdownBorderColor,
        Color.lerp(Colors.blue, Colors.purple, 0.5));
    expect(lerpStyle.buttonDefaultColor,
        Color.lerp(Colors.orange, Colors.black, 0.5));
    expect(lerpStyle.defaultBorderColor,
        Color.lerp(Colors.yellow, Colors.white, 0.5));
    expect(lerpStyle.bigButtonSize, lerpDouble(15.0, 20.0, 0.5));
    expect(lerpStyle.defaultButtonSize, lerpDouble(10.0, 15.0, 0.5));
    expect(lerpStyle.defaultSecButtonColor,
        Color.lerp(Colors.pink, Colors.blue, 0.5));
    expect(lerpStyle.disabledButtonColor,
        Color.lerp(Colors.brown, Colors.red, 0.5));
    expect(lerpStyle.isSecDisabledBorderColor,
        Color.lerp(Colors.cyan, Colors.green, 0.5));
    expect(lerpStyle.isSecDisabledButtonColor,
        Color.lerp(Colors.indigo, Colors.purple, 0.5));
    expect(lerpStyle.isSecTappedButtonColor,
        Color.lerp(Colors.teal, Colors.brown, 0.5));
    expect(
        lerpStyle.tappedButtonColor, Color.lerp(Colors.lime, Colors.cyan, 0.5));
    expect(lerpStyle.isSecDefaultBorderColor,
        Color.lerp(Colors.amber, Colors.indigo, 0.5));
    expect(lerpStyle.disabledBorderColor,
        Color.lerp(Colors.deepOrange, Colors.teal, 0.5));
    expect(lerpStyle.defaultIconColor,
        Color.lerp(Colors.lightGreen, Colors.lime, 0.5));
    expect(lerpStyle.isSecDefaultIconColor,
        Color.lerp(Colors.deepPurple, Colors.amber, 0.5));
    expect(lerpStyle.isSecDisabledIconColor,
        Color.lerp(Colors.lightBlue, Colors.deepOrange, 0.5));
    expect(lerpStyle.disabledIconColor,
        Color.lerp(Colors.grey, Colors.lightGreen, 0.5));
    expect(lerpStyle.secBackgroundSplashColor,
        Color.lerp(Colors.black, Colors.deepPurple, 0.5));
    expect(lerpStyle.borderRadius, lerpDouble(5.0, 10.0, 0.5));
    expect(lerpStyle.dropdownBorderRadius, lerpDouble(10.0, 15.0, 0.5));
  });

  testWidgets('VDropdownIcon Test', (WidgetTester tester) async {
    // Define a callback function
    String? selectedValue;
    List<String> options = ['Option 1', 'Option 2', 'Option 3'];
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VDropdownIcon(
            itemBuilder: (BuildContext context) {
              return options.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            onSelected: (value) {
              selectedValue = value as String;
            },
            isDisabled: false,
            icons: const Icon(Icons.add),
            isIconBig: false,
            isSecTheme: false,
          ),
        ),
      ),
    );

    // Tap on the VDropdownIcon to show the dropdown
    await tester.tap(find.byType(VDropdownIcon));
    await tester.pumpAndSettle();

    // Verify the dropdown items
    expect(find.text('Option 1'), findsOneWidget);
    expect(find.text('Option 2'), findsOneWidget);
    expect(find.text('Option 3'), findsOneWidget);

    // Tap on the 'Option 2' menu item
    await tester.tap(find.text('Option 2'));
    await tester.pumpAndSettle();

    // Verify the onSelected callback has been triggered with the correct value
    expect(selectedValue, 'Option 2');
  });

  testWidgets('VDropdownIcon Test in dark', (WidgetTester tester) async {
    // Define a callback function
    String? selectedValue;
    List<String> options = ['Option 1', 'Option 2', 'Option 3'];
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VDropdownIcon(
            itemBuilder: (BuildContext context) {
              return options.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            onSelected: (value) {
              selectedValue = value as String;
            },
            isDisabled: false,
            icons: const Icon(Icons.add),
            isIconBig: false,
            isSecTheme: false,
          ),
        ),
      ),
    );

    // Tap on the VDropdownIcon to show the dropdown
    await tester.tap(find.byType(VDropdownIcon));
    await tester.pumpAndSettle();

    // Verify the dropdown items
    expect(find.text('Option 1'), findsOneWidget);
    expect(find.text('Option 2'), findsOneWidget);
    expect(find.text('Option 3'), findsOneWidget);

    // Tap on the 'Option 2' menu item
    await tester.tap(find.text('Option 2'));
    await tester.pumpAndSettle();

    // Verify the onSelected callback has been triggered with the correct value
    expect(selectedValue, 'Option 2');
  });

  testWidgets('VDropdownIcon Test in dark', (WidgetTester tester) async {
    // Define a callback function
    String? selectedValue;
    List<String> options = ['Option 1', 'Option 2', 'Option 3'];
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VDropdownIcon(
            itemBuilder: (BuildContext context) {
              return options.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            onSelected: (value) {
              selectedValue = value as String;
            },
            isDisabled: false,
            icons: const Icon(Icons.add),
            isIconBig: false,
            isSecTheme: false,
            vExt: VDef(),
          ),
        ),
      ),
    );

    // Tap on the VDropdownIcon to show the dropdown
    await tester.tap(find.byType(VDropdownIcon));
    await tester.pumpAndSettle();

    // Verify the dropdown items
    expect(find.text('Option 1'), findsOneWidget);
    expect(find.text('Option 2'), findsOneWidget);
    expect(find.text('Option 3'), findsOneWidget);

    // Tap on the 'Option 2' menu item
    await tester.tap(find.text('Option 2'));
    await tester.pumpAndSettle();

    // Verify the onSelected callback has been triggered with the correct value
    expect(selectedValue, 'Option 2');
  });

  testWidgets('VDropdownIcon Test in dark alt', (WidgetTester tester) async {
    // Define a callback function
    String? selectedValue;
    List<String> options = ['Option 1', 'Option 2', 'Option 3'];
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VDropdownIcon(
            itemBuilder: (BuildContext context) {
              return options.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            onSelected: (value) {
              selectedValue = value as String;
            },
            isDisabled: false,
            icons: const Icon(Icons.add),
            isIconBig: false,
            isSecTheme: false,
            vExt: VAlt(),
          ),
        ),
      ),
    );

    // Tap on the VDropdownIcon to show the dropdown
    await tester.tap(find.byType(VDropdownIcon));
    await tester.pumpAndSettle();

    // Verify the dropdown items
    expect(find.text('Option 1'), findsOneWidget);
    expect(find.text('Option 2'), findsOneWidget);
    expect(find.text('Option 3'), findsOneWidget);

    // Tap on the 'Option 2' menu item
    await tester.tap(find.text('Option 2'));
    await tester.pumpAndSettle();

    // Verify the onSelected callback has been triggered with the correct value
    expect(selectedValue, 'Option 2');
  });

  testWidgets('VDropdownIcon Test is disabled', (WidgetTester tester) async {
    // Define a callback function
    // ignore: unused_local_variable
    String? selectedValue;
    List<String> options = ['Option 1', 'Option 2', 'Option 3'];
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VDropdownIcon(
            itemBuilder: (BuildContext context) {
              return options.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            onSelected: (value) {
              selectedValue = value as String;
            },
            isDisabled: true,
            icons: const Icon(Icons.add),
            isIconBig: false,
            isSecTheme: false,
          ),
        ),
      ),
    );
  });

  testWidgets('VDropdownIcon Test with null icons',
      (WidgetTester tester) async {
    // Define a callback function
    String? selectedValue;
    List<String> options = ['Option 1', 'Option 2', 'Option 3'];
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VDropdownIcon(
            itemBuilder: (BuildContext context) {
              return options.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            onSelected: (value) {
              selectedValue = value as String;
            },
            isDisabled: false,
            icons: null,
            isIconBig: false,
            isSecTheme: false,
          ),
        ),
      ),
    );

    // Tap on the VDropdownIcon to show the dropdown
    await tester.tap(find.byType(VDropdownIcon));
    await tester.pumpAndSettle();

    // Verify the default icon is displayed
    expect(find.byType(VIcon), findsOneWidget);

    // Tap on the 'Option 2' menu item
    await tester.tap(find.text('Option 2'));
    await tester.pumpAndSettle();

    // Verify the onSelected callback has been triggered with the correct value
    expect(selectedValue, 'Option 2');
  });

  testWidgets('VDropdownTextButton Test', (WidgetTester tester) async {
    // Define a callback function
    dynamic selectedValue;
    List<String> options = ['Option 1', 'Option 2', 'Option 3'];
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VDropdownTextButton(
            buttonText: 'Select an option',
            itemBuilder: (BuildContext context) {
              return options.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            onSelected: (value) {
              selectedValue = value;
            },
          ),
        ),
      ),
    );

    // Tap on the VDropdownTextButton to show the dropdown
    await tester.tap(find.byType(VDropdownTextButton));
    await tester.pumpAndSettle();

    // Verify the dropdown items
    expect(find.text('Option 1'), findsOneWidget);
    expect(find.text('Option 2'), findsOneWidget);
    expect(find.text('Option 3'), findsOneWidget);

    // Tap on the 'Option 2' menu item
    await tester.tap(find.text('Option 2'));
    await tester.pumpAndSettle();

    // Verify the onSelected callback has been triggered with the correct value
    expect(selectedValue, 'Option 2');
  });

  testWidgets('VDropdownTextButton Test is disabled',
      (WidgetTester tester) async {
    // Define a callback function
    dynamic selectedValue;
    List<String> options = ['Option 1', 'Option 2', 'Option 3'];
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VDropdownTextButton(
            buttonText: 'Select an option',
            itemBuilder: (BuildContext context) {
              return options.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            onSelected: (value) {
              selectedValue = value;
            },
            isDisabled: true,
          ),
        ),
      ),
    );

    // Verify the VDropdownTextButton is disabled
    expect(find.byType(VDropdownTextButton), findsOneWidget);
    final dropdownButton =
        tester.widget<VDropdownTextButton>(find.byType(VDropdownTextButton));
    expect(dropdownButton.isDisabled, true);

    // Tap on the VDropdownTextButton (should not show the dropdown)
    await tester.tap(find.byType(VDropdownTextButton));
    await tester.pumpAndSettle();

    // Verify the onSelected callback has not been triggered
    expect(selectedValue, null);
  });

  testWidgets('VDropdownTextButton Test with null icons',
      (WidgetTester tester) async {
    // Define a callback function
    dynamic selectedValue;
    List<String> options = ['Option 1', 'Option 2', 'Option 3'];
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VDropdownTextButton(
            buttonText: 'Select an option',
            itemBuilder: (BuildContext context) {
              return options.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            onSelected: (value) {
              selectedValue = value;
            },
            icons: null,
          ),
        ),
      ),
    );

    // Tap on the VDropdownTextButton to show the dropdown
    await tester.tap(find.byType(VDropdownTextButton));
    await tester.pumpAndSettle();

    // Verify the default icon is displayed
    expect(find.byType(VIcon), findsOneWidget);

    // Tap on the 'Option 2' menu item
    await tester.tap(find.text('Option 2'));
    await tester.pumpAndSettle();

    // Verify the onSelected callback has been triggered with the correct value
    expect(selectedValue, 'Option 2');
  });

  testWidgets('VDropdownTextButton Test in dark', (WidgetTester tester) async {
    // Define a callback function
    dynamic selectedValue;
    List<String> options = ['Option 1', 'Option 2', 'Option 3'];
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VDropdownTextButton(
            buttonText: 'Select an option',
            itemBuilder: (BuildContext context) {
              return options.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            onSelected: (value) {
              selectedValue = value;
            },
            vExt: VAlt(),
          ),
        ),
      ),
    );

    // Tap on the VDropdownTextButton to show the dropdown
    await tester.tap(find.byType(VDropdownTextButton));
    await tester.pumpAndSettle();

    // Verify the dropdown items
    expect(find.text('Option 1'), findsOneWidget);
    expect(find.text('Option 2'), findsOneWidget);
    expect(find.text('Option 3'), findsOneWidget);

    // Tap on the 'Option 2' menu item
    await tester.tap(find.text('Option 2'));
    await tester.pumpAndSettle();

    // Verify the onSelected callback has been triggered with the correct value
    expect(selectedValue, 'Option 2');
  });

  testWidgets('VDropdownTextButton Test in dark', (WidgetTester tester) async {
    // Define a callback function
    dynamic selectedValue;
    List<String> options = ['Option 1', 'Option 2', 'Option 3'];
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VDropdownTextButton(
            buttonText: 'Select an option',
            itemBuilder: (BuildContext context) {
              return options.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            isIconBig: true,
            onSelected: (value) {
              selectedValue = value;
            },
            vExt: VDef(),
          ),
        ),
      ),
    );

    // Tap on the VDropdownTextButton to show the dropdown
    await tester.tap(find.byType(VDropdownTextButton));
    await tester.pumpAndSettle();

    // Verify the dropdown items
    expect(find.text('Option 1'), findsOneWidget);
    expect(find.text('Option 2'), findsOneWidget);
    expect(find.text('Option 3'), findsOneWidget);

    // Tap on the 'Option 2' menu item
    await tester.tap(find.text('Option 2'));
    await tester.pumpAndSettle();

    // Verify the onSelected callback has been triggered with the correct value
    expect(selectedValue, 'Option 2');
  });

  // Coverage: VDropdownIconStyle lerp
  test('VDropdownIconStyle lerp', () {
    const a = VDropdownIconStyle(
      dropDownColor: Colors.red,
      buttonDefaultColor: Colors.blue,
    );
    const b = VDropdownIconStyle(
      dropDownColor: Colors.blue,
      buttonDefaultColor: Colors.red,
    );
    final result = a.lerp(b, 0.5);
    expect(result, isA<VDropdownIconStyle>());
  });

  test('VDropdownIconStyle lerp with null returns this', () {
    const a = VDropdownIconStyle(dropDownColor: Colors.red);
    final result = a.lerp(null, 0.5);
    expect(identical(result, a), isTrue);
  });

  // Coverage: VDropdownTextButtonStyle lerp
  test('VDropdownTextButtonStyle lerp', () {
    const a = VDropdownTextButtonStyle(
      dropDownColor: Colors.red,
    );
    const b = VDropdownTextButtonStyle(
      dropDownColor: Colors.blue,
    );
    final result = a.lerp(b, 0.5);
    expect(result, isA<VDropdownTextButtonStyle>());
  });

  test('VDropdownTextButtonStyle lerp with null returns this', () {
    const a = VDropdownTextButtonStyle(dropDownColor: Colors.red);
    final result = a.lerp(null, 0.5);
    expect(identical(result, a), isTrue);
  });

  // Coverage: VDropdownIcon tap + onSelected callback
  testWidgets("VDropdownIcon onSelected fires on item tap",
      (WidgetTester tester) async {
    dynamic selectedValue;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VDropdownIcon(
              onSelected: (value) {
                selectedValue = value;
              },
              onCanceled: () {},
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'item1', child: Text('Item 1')),
              ],
            ),
          ),
        ),
      ),
    );
    // Tap the dropdown icon button
    await tester.tap(find.byType(VDropdownIcon));
    await tester.pumpAndSettle();
    // Tap the item
    await tester.tap(find.text('Item 1'));
    await tester.pumpAndSettle();
    expect(selectedValue, 'item1');
  });

  // Coverage: VDropdownIcon alt theme dark
  testWidgets("VDropdownIcon alt theme dark", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: Center(
            child: VDropdownIcon(
              vExt: VAlt(),
              onSelected: (value) {},
              itemBuilder: (context) => [],
            ),
          ),
        ),
      ),
    );
    expect(find.byType(VDropdownIcon), findsOneWidget);
  });

  // Coverage: VDropdownIcon isSecTheme
  testWidgets("VDropdownIcon isSecTheme", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VDropdownIcon(
              isSecTheme: true,
              onSelected: (value) {},
              itemBuilder: (context) => [],
            ),
          ),
        ),
      ),
    );
    expect(find.byType(VDropdownIcon), findsOneWidget);
  });

  // Coverage: VDropdownTextButton tap + onSelected
  testWidgets("VDropdownTextButton onSelected fires",
      (WidgetTester tester) async {
    dynamic selectedValue;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VDropdownTextButton(
              buttonText: "Select",
              onSelected: (value) {
                selectedValue = value;
              },
              onCanceled: () {},
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'opt1', child: Text('Option 1')),
              ],
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Select'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Option 1'));
    await tester.pumpAndSettle();
    expect(selectedValue, 'opt1');
  });

  // Coverage: VDropdownTextButton disabled
  testWidgets("VDropdownTextButton disabled", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VDropdownTextButton(
              buttonText: "Disabled",
              isDisabled: true,
              onSelected: (value) {},
              itemBuilder: (context) => [],
            ),
          ),
        ),
      ),
    );
    expect(find.text("Disabled"), findsOneWidget);
  });

  // Coverage: VDropdownIcon alt theme light (line 224)
  testWidgets("VDropdownIcon alt theme light", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.light),
        home: Scaffold(
          body: Center(
            child: VDropdownIcon(
              vExt: VAlt(),
              itemBuilder: (context) => [],
              onSelected: (value) {},
              icons: const Icon(Icons.more_vert),
              isIconBig: false,
              isSecTheme: false,
            ),
          ),
        ),
      ),
    );
    expect(find.byType(VDropdownIcon), findsOneWidget);
  });

  // Coverage: VDropdownTextButton onSelected fires (lines 760-766)
  testWidgets("VDropdownTextButton onSelected fires",
      (WidgetTester tester) async {
    String? selected;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VDropdownTextButton(
              buttonText: "TextBtn",
              onSelected: (value) {
                selected = value.toString();
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'x', child: Text('TextItem')),
              ],
            ),
          ),
        ),
      ),
    );
    // Tap to open
    await tester.tap(find.text("TextBtn"));
    await tester.pumpAndSettle();
    expect(find.text("TextItem"), findsOneWidget);
    // Select item
    await tester.tap(find.text("TextItem"));
    await tester.pumpAndSettle();
    expect(selected, 'x');
  });

  // Coverage: VDropdownIcon isSecTheme + tapped (lines 298-300, 321-324)
  testWidgets("VDropdownIcon isSecTheme tapped opens popup",
      (WidgetTester tester) async {
    String? selected;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VDropdownIcon(
              isSecTheme: true,
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'a', child: Text('SecItem')),
              ],
              onSelected: (value) {
                selected = value.toString();
              },
              icons: const Icon(Icons.more_vert),
              isIconBig: false,
            ),
          ),
        ),
      ),
    );
    // Tap icon to open popup
    await tester.tap(find.byType(VDropdownIcon));
    await tester.pumpAndSettle();
    expect(find.text("SecItem"), findsOneWidget);
    await tester.tap(find.text("SecItem"));
    await tester.pumpAndSettle();
    expect(selected, 'a');
  });

  // Coverage: VDropdownIcon onCanceled fires when popup dismissed (lines 321-324)
  testWidgets("VDropdownIcon popup cancel sets isTapped false",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VDropdownIcon(
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'a', child: Text('CancelItem')),
              ],
              onSelected: (value) {},
              icons: const Icon(Icons.more_vert),
              isIconBig: false,
            ),
          ),
        ),
      ),
    );
    // Open popup
    await tester.tap(find.byType(VDropdownIcon));
    await tester.pumpAndSettle();
    expect(find.text("CancelItem"), findsOneWidget);
    // Dismiss popup by tapping outside
    await tester.tapAt(const Offset(10, 10));
    await tester.pumpAndSettle();
    // Popup should be dismissed
    expect(find.text("CancelItem"), findsNothing);
  });

  // Coverage: VDropdownTextButton onCanceled fires when popup dismissed (lines 753-756)
  testWidgets("VDropdownTextButton popup cancel", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VDropdownTextButton(
              buttonText: "CancelBtn",
              onSelected: (value) {},
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'a', child: Text('TextCancel')),
              ],
            ),
          ),
        ),
      ),
    );
    // Open popup
    await tester.tap(find.text("CancelBtn"));
    await tester.pumpAndSettle();
    expect(find.text("TextCancel"), findsOneWidget);
    // Dismiss
    await tester.tapAt(const Offset(10, 10));
    await tester.pumpAndSettle();
    expect(find.text("TextCancel"), findsNothing);
  });

  // Coverage: VDropdownIcon default (non-isSecTheme) borderColor line 292
  testWidgets("VDropdownIcon non-isSecTheme default border",
      (WidgetTester tester) async {
    String? selected;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VDropdownIcon(
              isSecTheme: false,
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'a', child: Text('DefItem')),
              ],
              onSelected: (value) {
                selected = value.toString();
              },
              icons: const Icon(Icons.more_vert),
              isIconBig: false,
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.byType(VDropdownIcon));
    await tester.pumpAndSettle();
    await tester.tap(find.text("DefItem"));
    await tester.pumpAndSettle();
    expect(selected, 'a');
  });

  //! This is Dropdown golden test

  testWidgets('Dropdown golden(snapshot) testing', (WidgetTester tester) async {
    await tester.pumpWidget(
      RepaintBoundary(
        child: MaterialApp(
          home: Scaffold(
            body: Center(
              child: VDropdownIcon(
                itemBuilder: (BuildContext context) {
                  return ['Option 1', 'Option 2'].map((String item) {
                    return PopupMenuItem<String>(
                        value: item, child: Text(item));
                  }).toList();
                },
                onSelected: (value) {},
                isDisabled: false,
                icons: const Icon(Icons.more_vert),
                isIconBig: false,
                isSecTheme: false,
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(VDropdownIcon),
      matchesGoldenFile('goldens/dropdown.png'),
    );
  });
}
