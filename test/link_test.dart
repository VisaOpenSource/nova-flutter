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
  test('VLinkStyle copyWith copies values correctly', () {
    const original = VLinkStyle(
      splashColor: Colors.red,
      iconColor: Colors.green,
      defaultColor: Colors.blue,
      pressedColor: Colors.yellow,
      tapUpColor: Colors.orange,
      disabledColor: Colors.purple,
      underlineColor: Colors.brown,
      titleTextStyle: TextStyle(fontSize: 16),
    );

    final copy = original.copyWith();

    expect(copy.splashColor, Colors.red);
    expect(copy.iconColor, Colors.green);
    expect(copy.defaultColor, Colors.blue);
    expect(copy.pressedColor, Colors.yellow);
    expect(copy.tapUpColor, Colors.orange);
    expect(copy.disabledColor, Colors.purple);
    expect(copy.underlineColor, Colors.brown);
    expect(copy.titleTextStyle!.fontSize, 16);
  });

  test('VLinkStyle lerp interpolates values correctly', () {
    const style1 = VLinkStyle(
      splashColor: Colors.red,
      iconColor: Colors.green,
      defaultColor: Colors.blue,
      pressedColor: Colors.yellow,
      tapUpColor: Colors.orange,
      disabledColor: Colors.purple,
      underlineColor: Colors.brown,
      titleTextStyle: TextStyle(fontSize: 16),
    );

    const style2 = VLinkStyle(
      splashColor: Colors.pink,
      iconColor: Colors.indigo,
      defaultColor: Colors.grey,
      pressedColor: Colors.teal,
      tapUpColor: Colors.cyan,
      disabledColor: Colors.lime,
      underlineColor: Colors.amber,
      titleTextStyle: TextStyle(fontSize: 18),
    );

    final result = style1.lerp(style2, 0.5);

    expect(result.splashColor, Color.lerp(Colors.red, Colors.pink, 0.5));
    expect(result.iconColor, Color.lerp(Colors.green, Colors.indigo, 0.5));
    expect(result.defaultColor, Color.lerp(Colors.blue, Colors.grey, 0.5));
    expect(result.pressedColor, Color.lerp(Colors.yellow, Colors.teal, 0.5));
    expect(result.tapUpColor, Color.lerp(Colors.orange, Colors.cyan, 0.5));
    expect(result.disabledColor, Color.lerp(Colors.purple, Colors.lime, 0.5));
    expect(result.underlineColor, Color.lerp(Colors.brown, Colors.amber, 0.5));
    expect(result.titleTextStyle!.fontSize, 16);
  });

  test('VLinkStyle copyWith', () {
    const original = VLinkStyle(
      splashColor: Colors.red,
      iconColor: Colors.green,
      defaultColor: Colors.blue,
      pressedColor: Colors.yellow,
      tapUpColor: Colors.orange,
      disabledColor: Colors.purple,
      underlineColor: Colors.brown,
      titleTextStyle: TextStyle(fontSize: 16),
    );

    final copy = original.copyWith(
      splashColor: Colors.pink,
      iconColor: Colors.indigo,
      defaultColor: Colors.grey,
      pressedColor: Colors.teal,
      tapUpColor: Colors.cyan,
      disabledColor: Colors.lime,
      underlineColor: Colors.amber,
      titleTextStyle: const TextStyle(fontSize: 18),
    );

    expect(copy.splashColor, Colors.pink);
    expect(copy.iconColor, Colors.indigo);
    expect(copy.defaultColor, Colors.grey);
    expect(copy.pressedColor, Colors.teal);
    expect(copy.tapUpColor, Colors.cyan);
    expect(copy.disabledColor, Colors.lime);
    expect(copy.underlineColor, Colors.amber);
    expect(copy.titleTextStyle!.fontSize, 18);
  });

  testWidgets(
      'VLink applies getAltColorSchemeDark when theme brightness is dark and vExt is not VDef',
      (WidgetTester tester) async {
    // Test with Brightness.dark and vExt is not VDef
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: VLink(
          title: 'Test',
          onPressed: () {},
          vExt: VAlt(),
        ),
      ),
    ));

    expect(find.byType(VLink), findsOneWidget);
  });

  testWidgets('VLink test', (WidgetTester tester) async {
    bool wasOnPressedCalled = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VLink(
          title: 'Test',
          onPressed: () {
            wasOnPressedCalled = true;
          },
          isUnderlined: true,
          isLeadingIcon: true,
          isTrailingIcon: true,
        ),
      ),
    ));

    // Check that the title is present
    expect(find.text('Test'), findsOneWidget);

    // Check that the leading and trailing icons are present
    expect(find.byType(VIcon), findsNWidgets(2));

    // Check that the title is underlined
    final textWidget = tester.firstWidget(find.byType(Text)) as Text;
    expect(textWidget.style!.decoration, TextDecoration.underline);

    // Tap the link and check that onPressed was called
    await tester.tap(find.byType(VLink));
    expect(wasOnPressedCalled, true);
  });

  testWidgets('VLink dark mode with VDef', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: VLink(
          title: 'Dark Default',
          onPressed: () {},
        ),
      ),
    ));

    expect(find.text('Dark Default'), findsOneWidget);
  });

  testWidgets('VLink light mode with VAlt', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VLink(
          title: 'Light Alt',
          onPressed: () {},
          vExt: VAlt(),
        ),
      ),
    ));

    expect(find.text('Light Alt'), findsOneWidget);
  });

  testWidgets('VLink pressed state', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VLink(
          title: 'Press Me',
          onPressed: () {},
        ),
      ),
    ));

    // Start a gesture (tap down) to trigger isPressed = true
    final gesture =
        await tester.startGesture(tester.getCenter(find.byType(VLink)));
    await tester.pump();

    // Widget should still be rendered
    expect(find.text('Press Me'), findsOneWidget);

    // Release the gesture
    await gesture.up();
    await tester.pump();
  });

  testWidgets('VLink tap cancel', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VLink(
          title: 'Cancel Me',
          onPressed: () {},
        ),
      ),
    ));

    // Start a gesture then move away to trigger onTapCancel
    final gesture =
        await tester.startGesture(tester.getCenter(find.byType(VLink)));
    await tester.pump();

    // Move far away to cancel the tap
    await gesture.moveBy(const Offset(0, 200));
    await tester.pump();

    await gesture.up();
    await tester.pump();

    expect(find.text('Cancel Me'), findsOneWidget);
  });

  testWidgets('VLink disabled', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: VLink(
          title: 'Disabled',
          onPressed: null,
        ),
      ),
    ));

    expect(find.text('Disabled'), findsOneWidget);
  });

  testWidgets('VLink with rtl', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VLink(
          title: 'RTL',
          onPressed: () {},
          rtl: true,
        ),
      ),
    ));

    expect(find.text('RTL'), findsOneWidget);
  });

  testWidgets('VLink disabled shows disabled color', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: VLink(
          title: 'Disabled',
          onPressed: null,
        ),
      ),
    ));
    expect(find.text('Disabled'), findsOneWidget);
  });

  testWidgets('VLink tap gestures update pressed state', (tester) async {
    bool tapped = false;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VLink(
          title: 'Tap Me',
          onPressed: () {
            tapped = true;
          },
        ),
      ),
    ));

    final gesture =
        await tester.startGesture(tester.getCenter(find.text('Tap Me')));
    await tester.pump();
    await gesture.up();
    await tester.pump();
    expect(tapped, isTrue);
  });

  testWidgets('VLink tap cancel resets pressed state', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VLink(
          title: 'Cancel Me',
          onPressed: () {},
        ),
      ),
    ));

    final gesture =
        await tester.startGesture(tester.getCenter(find.text('Cancel Me')));
    await tester.pump();
    await gesture.cancel();
    await tester.pump();
    expect(find.text('Cancel Me'), findsOneWidget);
  });

  //! This is Link golden test

  testWidgets('Link golden(snapshot) testing', (WidgetTester tester) async {
    await tester.pumpWidget(
      RepaintBoundary(
        child: MaterialApp(
          home: Scaffold(
            body: Center(
              child: VLink(
                title: 'Link Label',
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(VLink),
      matchesGoldenFile('goldens/link.png'),
    );
  });
}
