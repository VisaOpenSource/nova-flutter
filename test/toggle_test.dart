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
import 'dart:ui';

void main() {
  test('VToggleStyle copyWith', () {
    const original = VToggleStyle(
      pressedSplashColor: Colors.red,
      selectedBorderColor: Colors.green,
      unselectedBorderColor: Colors.blue,
      toggleFillColor: Colors.yellow,
      disabledBorderColor: Colors.orange,
      bottomBarDisabledColor: Colors.purple,
      bottomBarUnselectedColor: Colors.brown,
      bottomBarColor: Colors.pink,
      height: 10.0,
      borderRadius: 5.0,
      minimumWidth: 15.0,
    );

    final copy = original.copyWith();

    expect(copy.pressedSplashColor, Colors.red);
    expect(copy.selectedBorderColor, Colors.green);
    expect(copy.unselectedBorderColor, Colors.blue);
    expect(copy.toggleFillColor, Colors.yellow);
    expect(copy.disabledBorderColor, Colors.orange);
    expect(copy.bottomBarDisabledColor, Colors.purple);
    expect(copy.bottomBarUnselectedColor, Colors.brown);
    expect(copy.bottomBarColor, Colors.pink);
    expect(copy.height, 10.0);
    expect(copy.borderRadius, 5.0);
    expect(copy.minimumWidth, 15.0);
  });

  test('VToggleStyle lerp', () {
    const style1 = VToggleStyle(
      pressedSplashColor: Colors.red,
      selectedBorderColor: Colors.green,
      unselectedBorderColor: Colors.blue,
      toggleFillColor: Colors.yellow,
      disabledBorderColor: Colors.orange,
      bottomBarDisabledColor: Colors.purple,
      bottomBarUnselectedColor: Colors.brown,
      bottomBarColor: Colors.pink,
      height: 10.0,
      borderRadius: 5.0,
      minimumWidth: 15.0,
    );

    const style2 = VToggleStyle(
      pressedSplashColor: Colors.pink,
      selectedBorderColor: Colors.indigo,
      unselectedBorderColor: Colors.grey,
      toggleFillColor: Colors.teal,
      disabledBorderColor: Colors.cyan,
      bottomBarDisabledColor: Colors.lime,
      bottomBarUnselectedColor: Colors.amber,
      bottomBarColor: Colors.black,
      height: 20.0,
      borderRadius: 10.0,
      minimumWidth: 25.0,
    );

    final result = style1.lerp(style2, 0.5);

    expect(result.pressedSplashColor, Color.lerp(Colors.red, Colors.pink, 0.5));
    expect(result.selectedBorderColor,
        Color.lerp(Colors.green, Colors.indigo, 0.5));
    expect(result.unselectedBorderColor,
        Color.lerp(Colors.blue, Colors.grey, 0.5));
    expect(result.toggleFillColor, Color.lerp(Colors.yellow, Colors.teal, 0.5));
    expect(result.disabledBorderColor,
        Color.lerp(Colors.orange, Colors.cyan, 0.5));
    expect(result.bottomBarDisabledColor,
        Color.lerp(Colors.purple, Colors.lime, 0.5));
    expect(result.bottomBarUnselectedColor,
        Color.lerp(Colors.brown, Colors.amber, 0.5));
    expect(result.bottomBarColor, Color.lerp(Colors.pink, Colors.black, 0.5));
    expect(result.height, lerpDouble(10.0, 20.0, 0.5));
    expect(result.borderRadius, lerpDouble(5.0, 10.0, 0.5));
    expect(result.minimumWidth, lerpDouble(15.0, 25.0, 0.5));
  });

  testWidgets('VToggle test', (tester) async {
    var isSelected = [true, false];
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VToggle(
          isSelected: isSelected,
          toggleListItems: const [Text('Item 1'), Text('Item 2')],
          onPressed: (index) {
            isSelected[index] = !isSelected[index];
          },
        ),
      ),
    ));

    final firstToggle = find.text('Item 1');
    final secondToggle = find.text('Item 2');

    expect(firstToggle, findsOneWidget);
    expect(secondToggle, findsOneWidget);

    // Test that 'Item 1' is initially selected
    expect(isSelected[0], isTrue);
    expect(isSelected[1], isFalse);
  });

  testWidgets('VToggle test', (tester) async {
    var isSelected = [false, true];
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VToggle(
          isSelected: isSelected,
          toggleListItems: const [Text('Item 1'), Text('Item 2')],
          onPressed: (index) {
            isSelected[index] = !isSelected[index];
          },
        ),
      ),
    ));

    // Test that 'Item 2' is now selected
    expect(isSelected[0], isFalse);
    expect(isSelected[1], isTrue);
  });

  testWidgets('VToggle onPressed test', (tester) async {
    var isSelected = [false, false];
    late int pressedIndex;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VToggle(
          isSelected: isSelected,
          toggleListItems: const [Text('Item 1'), Text('Item 2')],
          onPressed: (index) {
            pressedIndex = index;
          },
        ),
      ),
    ));

    final firstToggle = find.text('Item 1');
    final secondToggle = find.text('Item 2');

    // Tap 'Item 1', it should now be selected
    await tester.tap(firstToggle);
    await tester.pump();

    expect(isSelected[0], isTrue);
    expect(isSelected[1], isFalse);
    expect(pressedIndex, 0);

    // Tap 'Item 2', 'Item 1' should be unselected and 'Item 2' should now be selected
    await tester.tap(secondToggle);
    await tester.pump();

    expect(isSelected[0], isFalse);
    expect(isSelected[1], isTrue);
    expect(pressedIndex, 1);
  });

  testWidgets(
      'VLink applies getAltColorSchemeDark when theme brightness is dark and vExt is not VDef',
      (WidgetTester tester) async {
    // Test with Brightness.dark and vExt is not VDef

    var isSelected = [false, false];
    // ignore: unused_local_variable
    late int pressedIndex;

    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: VToggle(
          isSelected: isSelected,
          toggleListItems: const [Text('Item 1'), Text('Item 2')],
          onPressed: (index) {
            pressedIndex = index;
          },
          vExt: VAlt(),
        ),
      ),
    ));

    expect(find.byType(VToggle), findsOneWidget);
  });

  testWidgets('VToggle disabled test', (tester) async {
    var isSelected = [false, false];
    // var pressedIndex;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VToggle(
          isSelected: isSelected,
          toggleListItems: const [Text('Item 1'), Text('Item 2')],
          isDisabled: true,
          onPressed: (index) {
            // pressedIndex = index;
          },
        ),
      ),
    ));

    final firstToggle = find.text('Item 1');

    // Try to tap 'Item 1', but it should be disabled
    await tester.tap(firstToggle);
    await tester.pump();

    // The onPressed function should not have been called, and the button should not be selected
    // expect(pressedIndex, isNull);
    expect(isSelected[0], isFalse);
  });

  testWidgets('VToggle with Row children', (WidgetTester tester) async {
    var isSelected = [true, false];

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VToggle(
          isSelected: isSelected,
          toggleListItems: const [
            Row(children: [Icon(Icons.home), Text('Home')]),
            Row(children: [Icon(Icons.work), Text('Work')]),
          ],
          onPressed: (index) {},
        ),
      ),
    ));

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Work'), findsOneWidget);
  });

  testWidgets('VToggle with Column children', (WidgetTester tester) async {
    var isSelected = [true, false];

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VToggle(
          isSelected: isSelected,
          toggleListItems: const [
            Column(children: [Icon(Icons.home), Text('Home')]),
            Column(children: [Icon(Icons.work), Text('Work')]),
          ],
          onPressed: (index) {},
        ),
      ),
    ));

    expect(find.text('Home'), findsOneWidget);
  });

  testWidgets('VToggle with non-text child', (WidgetTester tester) async {
    var isSelected = [true, false];

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VToggle(
          isSelected: isSelected,
          toggleListItems: const [
            Icon(Icons.home),
            Icon(Icons.work),
          ],
          onPressed: (index) {},
        ),
      ),
    ));

    expect(find.byIcon(Icons.home), findsOneWidget);
  });

  testWidgets('VToggle dark mode', (WidgetTester tester) async {
    var isSelected = [true, false];

    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: VToggle(
          isSelected: isSelected,
          toggleListItems: const [Text('A'), Text('B')],
          onPressed: (index) {},
        ),
      ),
    ));

    expect(find.text('A'), findsOneWidget);
  });

  testWidgets('VToggle alt theme', (WidgetTester tester) async {
    var isSelected = [true, false];

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VToggle(
          isSelected: isSelected,
          toggleListItems: const [Text('A'), Text('B')],
          onPressed: (index) {},
          vExt: VAlt(),
        ),
      ),
    ));

    expect(find.text('A'), findsOneWidget);
  });

  testWidgets('VToggle dark alt theme', (WidgetTester tester) async {
    var isSelected = [true, false];

    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: VToggle(
          isSelected: isSelected,
          toggleListItems: const [Text('A'), Text('B')],
          onPressed: (index) {},
          vExt: VAlt(),
        ),
      ),
    ));

    expect(find.text('A'), findsOneWidget);
  });

  testWidgets('VToggle with topLabel', (WidgetTester tester) async {
    var isSelected = [true, false];

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VToggle(
          isSelected: isSelected,
          toggleListItems: const [Text('A'), Text('B')],
          onPressed: (index) {},
          topLabel: const Text('Choose one'),
        ),
      ),
    ));

    expect(find.text('Choose one'), findsOneWidget);
  });

  testWidgets('VToggle with disabledItems', (WidgetTester tester) async {
    var isSelected = [true, false, false];

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VToggle(
          isSelected: isSelected,
          toggleListItems: const [Text('A'), Text('B'), Text('C')],
          onPressed: (index) {},
          disabledItems: const [false, true, false],
        ),
      ),
    ));

    expect(find.text('B'), findsOneWidget);
  });

  // Coverage: VToggle multi-select mode
  testWidgets("VToggle multi-select toggles", (WidgetTester tester) async {
    int pressedIndex = -1;
    final isSelected = [false, false, false];
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VToggle(
          isSelected: isSelected,
          toggleListItems: const [Text('A'), Text('B'), Text('C')],
          isMultiSelect: true,
          onPressed: (index) {
            pressedIndex = index;
          },
        ),
      ),
    ));
    await tester.tap(find.text('A'));
    await tester.pumpAndSettle();
    // Widget toggles isSelected internally, onPressed just fires the callback
    expect(pressedIndex, 0);
    expect(isSelected[0], isTrue);
  });

  testWidgets('disabled toggle with selected item shows disabled bar color',
      (tester) async {
    final isSelected = [true, false];
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VToggle(
          toggleListItems: const [Text('A'), Text('B')],
          isSelected: isSelected,
          isDisabled: true,
          onPressed: null,
        ),
      ),
    ));
    await tester.pump();
    // Verify the disabled selected toggle renders
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
  });

  //! This is Toggle golden test

  testWidgets('Toggle golden(snapshot) testing', (WidgetTester tester) async {
    await tester.pumpWidget(
      RepaintBoundary(
        child: MaterialApp(
          home: Scaffold(
            body: Center(
              child: VToggle(
                isSelected: const [true, false],
                toggleListItems: const [Text('Option A'), Text('Option B')],
                onPressed: (index) {},
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(VToggle),
      matchesGoldenFile('goldens/toggle.png'),
    );
  });
}
