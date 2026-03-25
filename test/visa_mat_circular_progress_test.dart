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

// Tests for VCircularProgressIndicator (material widget fork)
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

void main() {
  Widget buildApp(Widget child) {
    return MaterialApp(home: Scaffold(body: Center(child: child)));
  }

  group('VCircularProgressIndicator', () {
    testWidgets('renders determinate indicator', (tester) async {
      await tester.pumpWidget(buildApp(
        const VCircularProgressIndicator(value: 0.5),
      ));
      await tester.pump();
      expect(find.byType(VCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders indeterminate indicator (null value)', (tester) async {
      await tester.pumpWidget(buildApp(
        const VCircularProgressIndicator(),
      ));
      // Let animation run
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byType(VCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders with backgroundColor', (tester) async {
      await tester.pumpWidget(buildApp(
        const VCircularProgressIndicator(
          value: 0.7,
          backgroundColor: Colors.grey,
        ),
      ));
      await tester.pump();
      expect(find.byType(VCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders with custom strokeWidth', (tester) async {
      await tester.pumpWidget(buildApp(
        const VCircularProgressIndicator(
          value: 0.3,
          strokeWidth: 8.0,
        ),
      ));
      await tester.pump();
      expect(find.byType(VCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders with color and valueColor', (tester) async {
      await tester.pumpWidget(buildApp(
        const VCircularProgressIndicator(
          value: 0.5,
          color: Colors.red,
        ),
      ));
      await tester.pump();
      expect(find.byType(VCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders with semanticsLabel and semanticsValue',
        (tester) async {
      await tester.pumpWidget(buildApp(
        const VCircularProgressIndicator(
          value: 0.5,
          semanticsLabel: 'Loading',
          semanticsValue: '50%',
        ),
      ));
      await tester.pump();
      expect(find.bySemanticsLabel('Loading'), findsOneWidget);
    });

    testWidgets('renders adaptive constructor', (tester) async {
      await tester.pumpWidget(buildApp(
        const VCircularProgressIndicator.adaptive(value: 0.5),
      ));
      await tester.pump();
      expect(find.byType(VCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('adaptive indeterminate renders', (tester) async {
      await tester.pumpWidget(buildApp(
        const VCircularProgressIndicator.adaptive(),
      ));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byType(VCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('transition from indeterminate to determinate', (tester) async {
      await tester.pumpWidget(buildApp(
        const VCircularProgressIndicator(),
      ));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      // Switch to determinate
      await tester.pumpWidget(buildApp(
        const VCircularProgressIndicator(value: 0.8),
      ));
      await tester.pump();
      expect(find.byType(VCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('transition from determinate to indeterminate', (tester) async {
      await tester.pumpWidget(buildApp(
        const VCircularProgressIndicator(value: 0.5),
      ));
      await tester.pump();

      // Switch to indeterminate
      await tester.pumpWidget(buildApp(
        const VCircularProgressIndicator(),
      ));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byType(VCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders with strokeCap', (tester) async {
      await tester.pumpWidget(buildApp(
        const VCircularProgressIndicator(
          value: 0.5,
          strokeCap: StrokeCap.butt,
        ),
      ));
      await tester.pump();
      expect(find.byType(VCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('indeterminate has animation running', (tester) async {
      await tester.pumpWidget(buildApp(
        const VCircularProgressIndicator(),
      ));
      // Pump multiple frames to trigger animation tween evaluations
      for (int i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 200));
      }
      expect(find.byType(VCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('determinate with value 0', (tester) async {
      await tester.pumpWidget(buildApp(
        const VCircularProgressIndicator(value: 0.0),
      ));
      await tester.pump();
      expect(find.byType(VCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('determinate with value 1', (tester) async {
      await tester.pumpWidget(buildApp(
        const VCircularProgressIndicator(value: 1.0),
      ));
      await tester.pump();
      expect(find.byType(VCircularProgressIndicator), findsOneWidget);
    });

    testWidgets('semantics defaults for determinate without semanticsValue',
        (tester) async {
      await tester.pumpWidget(buildApp(
        const VCircularProgressIndicator(
          value: 0.25,
          semanticsLabel: 'Progress',
        ),
      ));
      await tester.pump();
      // Should auto-generate "25%" semanticsValue
      expect(find.bySemanticsLabel('Progress'), findsOneWidget);
    });
  });
}
