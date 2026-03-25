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
  test('VWizardStyle copyWith and lerp test', () {
    // Create two VWizardStyle objects
    const style1 = VWizardStyle(
      defaultBackgroundColor: Colors.red,
      inProgressColor: Colors.green,
      successColor: Colors.blue,
      incompleteColor: Colors.yellow,
      numberTextStyle: TextStyle(fontSize: 12),
      borderRadius: 5.0,
    );

    const style2 = VWizardStyle(
      defaultBackgroundColor: Colors.white,
      inProgressColor: Colors.black,
      successColor: Colors.purple,
      incompleteColor: Colors.orange,
      numberTextStyle: TextStyle(fontSize: 16),
      borderRadius: 10.0,
    );

    // Test copyWith method
    final copiedStyle = style1.copyWith();
    expect(copiedStyle.defaultBackgroundColor, style1.defaultBackgroundColor);
    expect(copiedStyle.numberTextStyle, style1.numberTextStyle);
    expect(copiedStyle.inProgressColor,
        style1.inProgressColor); // Not copied, should remain as in style1

    // Test lerp method
    final lerpedStyle = style1.lerp(style2, 0.5);
    expect(
        lerpedStyle.defaultBackgroundColor,
        Color.lerp(
            style1.defaultBackgroundColor, style2.defaultBackgroundColor, 0.5));
    expect(
        lerpedStyle.numberTextStyle,
        style1
            .numberTextStyle); // lerp not implemented for TextStyle, should remain as in style1
    expect(lerpedStyle.borderRadius,
        lerpDouble(style1.borderRadius, style2.borderRadius, 0.5));
  });

  testWidgets('VWizard test', (WidgetTester tester) async {
    // Create the VWizard widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VWizard(
            completedSteps: [true, false, false, false, false],
            currentStep: 2,
            totalSteps: 5,
          ),
        ),
      ),
    );

    // Verify the total steps
    expect(
        find.byType(Container), findsNWidgets(5 * 2 - 1)); // totalSteps * 2 - 1

    // Verify the current step
    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('VWizard alt test', (WidgetTester tester) async {
    // Create the VWizard widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VWizard(
            completedSteps: const [true, false, false, false, false],
            vExt: VAlt(),
            currentStep: 2,
            totalSteps: 5,
          ),
        ),
      ),
    );

    // Verify the total steps
    expect(
        find.byType(Container), findsNWidgets(5 * 2 - 1)); // totalSteps * 2 - 1

    // Verify the current step
    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('VWizard with error on current step',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VWizard(
            completedSteps: [true, false, false],
            currentStep: 2,
            totalSteps: 3,
            hasError: true,
          ),
        ),
      ),
    );

    // Verify the widget renders
    expect(find.byType(VWizard), findsOneWidget);
    // Error step should show error icon semantics
    expect(find.bySemanticsLabel('Error, step 2 of 3'), findsOneWidget);
  });

  testWidgets('VWizard with completed current step',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VWizard(
            completedSteps: [true, true, false],
            currentStep: 2,
            totalSteps: 3,
          ),
        ),
      ),
    );

    // Verify the widget renders with a completed current step (checkmark)
    expect(find.byType(VWizard), findsOneWidget);
    expect(find.bySemanticsLabel('Current step, completed, step 2 of 3'),
        findsOneWidget);
  });

  testWidgets('VWizard dark mode', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: const Scaffold(
          body: VWizard(
            completedSteps: [true, false, false],
            currentStep: 2,
            totalSteps: 3,
          ),
        ),
      ),
    );

    expect(find.byType(VWizard), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('VWizard dark mode alt', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VWizard(
            completedSteps: const [true, false, false],
            currentStep: 2,
            totalSteps: 3,
            vExt: VAlt(),
          ),
        ),
      ),
    );

    expect(find.byType(VWizard), findsOneWidget);
  });

  //! This is Wizard golden test

  testWidgets('Wizard golden(snapshot) testing', (WidgetTester tester) async {
    await tester.pumpWidget(
      RepaintBoundary(
        child: MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 400,
                child: VWizard(
                  completedSteps: const [true, true, false, false, false],
                  currentStep: 2,
                  totalSteps: 5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(VWizard),
      matchesGoldenFile('goldens/wizard.png'),
    );
  });
}
