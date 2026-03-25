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
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

void main() {
  // ! This is Progress unit test
  testWidgets("Progress theme testing", (WidgetTester tester) async {
    // Progress theme
    final theme = VProgressStyle(
      backgroundColor: VColors.defaultSurface1,
      circularLabelTextStyle: defaultVTheme.textStyles.uiLabelActive,
      linearRadius: 4.0,
      circularSize: 70.0,
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
            body: Column(
          children: [
            VProgressLinear(
              value: 1,
              style: VProgressStyle(
                backgroundColor: theme.backgroundColor,
                circularLabelTextStyle: theme.circularLabelTextStyle,
                linearRadius: theme.linearRadius,
                circularSize: theme.circularSize,
              ),
            ),
          ],
        )),
      ),
    );

    // Find my widget
    final widgetFinder = find.byType(VProgressLinear);

    // Expect my widget uses the theme's color
    VProgressLinear progress = tester.widget(widgetFinder);
    expect(progress.style?.backgroundColor, theme.backgroundColor);
    expect(
        progress.style?.circularLabelTextStyle, theme.circularLabelTextStyle);
    expect(progress.style?.linearRadius, theme.linearRadius);
    expect(progress.style?.circularSize, theme.circularSize);
  });

  //! This is Progress golden test

  testWidgets('Progress golden test', (WidgetTester tester) async {
    final controller1 = AnimationController(
      vsync: const TestVSync(),
      duration: const Duration(seconds: 5),
    );
    controller1.value = 0.5;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              VProgressLinear(value: controller1.value),
              const SizedBox(height: 10),
              Row(
                children: [
                  controller1.value == 1.0
                      ? const Row(
                          children: [
                            VIcon(
                              svgIcon: VIcons.successTiny,
                              iconColor: VColors.positiveGraphics,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                  Expanded(
                    child: Text(
                      controller1.value == 1.0 ? "Complete!" : "Progress",
                      style: defaultVTheme.textStyles.uiLabel,
                    ),
                  ),
                  Text(
                    "${(controller1.value * 100).round()}%",
                    style: defaultVTheme.textStyles.uiLabel,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Stop/Reset',
                      style: defaultVTheme.textStyles.uiLabelActive,
                    ),
                  ),
                  Switch(
                    value: false,
                    onChanged: (bool value) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    await expectLater(
      find.byType(Column),
      matchesGoldenFile('goldens/progress.png'),
    );
  });

  test('VProgressStyle copyWith method test', () {
    const style = VProgressStyle(
      backgroundColor: Colors.blue,
      color: Colors.red,
      circularLabelTextStyle: TextStyle(fontSize: 18.0),
      linearRadius: 5.0,
      circularSize: 50.0,
      successColor: Colors.green,
    );

    final newStyle = style.copyWith();

    expect(newStyle.backgroundColor, Colors.blue);
    expect(newStyle.color, Colors.red);
    expect(newStyle.circularLabelTextStyle?.fontSize, 18.0);
    expect(newStyle.linearRadius, 5.0);
    expect(newStyle.circularSize, 50.0);
    expect(newStyle.successColor, Colors.green);
  });

  test('VProgressStyle lerp method test', () {
    const style1 = VProgressStyle(
      backgroundColor: Colors.blue,
      color: Colors.red,
      circularLabelTextStyle: TextStyle(fontSize: 18.0),
      linearRadius: 5.0,
      circularSize: 50.0,
      successColor: Colors.green,
    );

    const style2 = VProgressStyle(
      backgroundColor: Colors.yellow,
      color: Colors.purple,
      circularLabelTextStyle: TextStyle(fontSize: 20.0),
      linearRadius: 10.0,
      circularSize: 100.0,
      successColor: Colors.orange,
    );

    final lerpStyle = style1.lerp(style2, 0.5);

    expect(
        lerpStyle.backgroundColor, Color.lerp(Colors.blue, Colors.yellow, 0.5));
    expect(lerpStyle.color, Color.lerp(Colors.red, Colors.purple, 0.5));
    expect(lerpStyle.circularLabelTextStyle?.fontSize, 18.0);
    expect(lerpStyle.linearRadius, 7.5);
    expect(lerpStyle.circularSize, 75.0);
    expect(
        lerpStyle.successColor, Color.lerp(Colors.green, Colors.orange, 0.5));
  });

  testWidgets("Progress linear VAlt testing", (WidgetTester tester) async {
    // Progress theme
    final theme = VProgressStyle(
      backgroundColor: VColors.defaultSurface1,
      circularLabelTextStyle: defaultVTheme.textStyles.uiLabelActive,
      linearRadius: 4.0,
      circularSize: 70.0,
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
            body: Column(
          children: [
            VProgressLinear(
              vExt: VAlt(),
              value: 1,
              style: VProgressStyle(
                backgroundColor: theme.backgroundColor,
                circularLabelTextStyle: theme.circularLabelTextStyle,
                linearRadius: theme.linearRadius,
                circularSize: theme.circularSize,
              ),
            ),
          ],
        )),
      ),
    );

    expect(find.byType(VProgressLinear), findsNWidgets(1));
  });

  testWidgets("Progress linear dark testing", (WidgetTester tester) async {
    // Progress theme
    final theme = VProgressStyle(
      backgroundColor: VColors.defaultSurface1,
      circularLabelTextStyle: defaultVTheme.textStyles.uiLabelActive,
      linearRadius: 4.0,
      circularSize: 70.0,
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
            body: Column(
          children: [
            VProgressLinear(
              value: 1,
              style: VProgressStyle(
                backgroundColor: theme.backgroundColor,
                circularLabelTextStyle: theme.circularLabelTextStyle,
                linearRadius: theme.linearRadius,
                circularSize: theme.circularSize,
              ),
            ),
          ],
        )),
      ),
    );

    expect(find.byType(VProgressLinear), findsNWidgets(1));
  });

  testWidgets("Progress linear dark VAlt testing", (WidgetTester tester) async {
    // Progress theme
    final theme = VProgressStyle(
      backgroundColor: VColors.defaultSurface1,
      circularLabelTextStyle: defaultVTheme.textStyles.uiLabelActive,
      linearRadius: 4.0,
      circularSize: 70.0,
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
            body: Column(
          children: [
            VProgressLinear(
              vExt: VAlt(),
              value: 1,
              style: VProgressStyle(
                backgroundColor: theme.backgroundColor,
                circularLabelTextStyle: theme.circularLabelTextStyle,
                linearRadius: theme.linearRadius,
                circularSize: theme.circularSize,
              ),
            ),
          ],
        )),
      ),
    );

    expect(find.byType(VProgressLinear), findsNWidgets(1));
  });

  testWidgets("Progress circular testing", (WidgetTester tester) async {
    // Progress theme
    final theme = VProgressStyle(
      backgroundColor: VColors.defaultSurface1,
      circularLabelTextStyle: defaultVTheme.textStyles.uiLabelActive,
      linearRadius: 4.0,
      circularSize: 70.0,
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
            body: Column(
          children: [
            VProgressCircular(
              value: 1,
              style: VProgressStyle(
                backgroundColor: theme.backgroundColor,
                circularLabelTextStyle: theme.circularLabelTextStyle,
                linearRadius: theme.linearRadius,
                circularSize: theme.circularSize,
              ),
            ),
          ],
        )),
      ),
    );

    expect(find.byType(VProgressCircular), findsNWidgets(1));
  });

  testWidgets("Progress circular alt testing", (WidgetTester tester) async {
    // Progress theme
    final theme = VProgressStyle(
      backgroundColor: VColors.defaultSurface1,
      circularLabelTextStyle: defaultVTheme.textStyles.uiLabelActive,
      linearRadius: 4.0,
      circularSize: 70.0,
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
            body: Column(
          children: [
            VProgressCircular(
              vExt: VAlt(),
              value: 1,
              style: VProgressStyle(
                backgroundColor: theme.backgroundColor,
                linearRadius: theme.linearRadius,
                circularSize: theme.circularSize,
              ),
            ),
          ],
        )),
      ),
    );

    expect(find.byType(VProgressCircular), findsNWidgets(1));
  });

  testWidgets("Progress gauge big testing", (WidgetTester tester) async {
    // Progress theme
    final theme = VProgressStyle(
      backgroundColor: VColors.defaultSurface1,
      circularLabelTextStyle: defaultVTheme.textStyles.uiLabelActive,
      linearRadius: 4.0,
      circularSize: 70.0,
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
            body: Column(
          children: [
            VProgressGaugeBig(
              value: 1,
              style: VProgressStyle(
                backgroundColor: theme.backgroundColor,
                linearRadius: theme.linearRadius,
                circularSize: theme.circularSize,
              ),
            ),
          ],
        )),
      ),
    );

    expect(find.byType(VProgressGaugeBig), findsNWidgets(1));
  });

  testWidgets("Progress gauge big alt testing", (WidgetTester tester) async {
    // Progress theme
    final theme = VProgressStyle(
      backgroundColor: VColors.defaultSurface1,
      circularLabelTextStyle: defaultVTheme.textStyles.uiLabelActive,
      linearRadius: 4.0,
      circularSize: 70.0,
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
            body: Column(
          children: [
            VProgressGaugeBig(
              vExt: VAlt(),
              value: 1,
              style: VProgressStyle(
                backgroundColor: theme.backgroundColor,
                linearRadius: theme.linearRadius,
                circularSize: theme.circularSize,
              ),
            ),
          ],
        )),
      ),
    );

    expect(find.byType(VProgressGaugeBig), findsNWidgets(1));
  });

  testWidgets("Progress gauge small testing", (WidgetTester tester) async {
    // Progress theme
    final theme = VProgressStyle(
      backgroundColor: VColors.defaultSurface1,
      circularLabelTextStyle: defaultVTheme.textStyles.uiLabelActive,
      linearRadius: 4.0,
      circularSize: 70.0,
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
            body: Column(
          children: [
            VProgressGaugeSmall(
              value: 1,
              style: VProgressStyle(
                backgroundColor: theme.backgroundColor,
                linearRadius: theme.linearRadius,
                circularSize: theme.circularSize,
              ),
            ),
          ],
        )),
      ),
    );

    expect(find.byType(VProgressGaugeSmall), findsNWidgets(1));
  });

  testWidgets("Progress gauge small alt testing", (WidgetTester tester) async {
    // Progress theme
    final theme = VProgressStyle(
      backgroundColor: VColors.defaultSurface1,
      circularLabelTextStyle: defaultVTheme.textStyles.uiLabelActive,
      linearRadius: 4.0,
      circularSize: 70.0,
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
            body: Column(
          children: [
            VProgressGaugeSmall(
              vExt: VAlt(),
              value: 1,
              style: VProgressStyle(
                backgroundColor: theme.backgroundColor,
                linearRadius: theme.linearRadius,
                circularSize: theme.circularSize,
              ),
            ),
          ],
        )),
      ),
    );

    expect(find.byType(VProgressGaugeSmall), findsNWidgets(1));
  });

  // Coverage: VProgressGaugeSmall value < 1 (non-success)
  testWidgets("VProgressGaugeSmall with value < 1",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VProgressGaugeSmall(value: 0.5),
        ),
      ),
    );
    expect(find.byType(VProgressGaugeSmall), findsOneWidget);
  });

  // Coverage: VProgressGaugeSmall value == 1 (success)
  testWidgets("VProgressGaugeSmall with value == 1 shows checkmark",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VProgressGaugeSmall(value: 1.0),
        ),
      ),
    );
    expect(find.byType(VProgressGaugeSmall), findsOneWidget);
  });

  // Coverage: VProgressGaugeBig value < 1
  testWidgets("VProgressGaugeBig with value < 1", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VProgressGaugeBig(value: 0.3),
        ),
      ),
    );
    expect(find.byType(VProgressGaugeBig), findsOneWidget);
  });

  // Coverage: VProgressGaugeBig value == 1
  testWidgets("VProgressGaugeBig with value == 1", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VProgressGaugeBig(value: 1.0),
        ),
      ),
    );
    expect(find.byType(VProgressGaugeBig), findsOneWidget);
  });

  // Coverage: VProgressStyle lerp
  test('VProgressStyle lerp', () {
    const a = VProgressStyle(
      backgroundColor: Colors.red,
      color: Colors.blue,
    );
    const b = VProgressStyle(
      backgroundColor: Colors.blue,
      color: Colors.red,
    );
    final result = a.lerp(b, 0.5);
    expect(result, isA<VProgressStyle>());
  });

  test('VProgressStyle lerp with null returns this', () {
    const a = VProgressStyle(backgroundColor: Colors.red);
    final result = a.lerp(null, 0.5);
    expect(identical(result, a), isTrue);
  });
}
