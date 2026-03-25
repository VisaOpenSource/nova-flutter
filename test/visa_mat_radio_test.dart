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

// Tests for VMatRadio and VMatRadioListTile
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

void main() {
  Widget buildApp(Widget child) {
    return MaterialApp(home: Scaffold(body: Center(child: child)));
  }

  group('VMatRadio', () {
    testWidgets('renders selected radio', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatRadio<int>(
          value: 1,
          groupValue: 1,
          onChanged: (_) {},
        ),
      ));
      await tester.pump();
      expect(find.byType(VMatRadio<int>), findsOneWidget);
    });

    testWidgets('renders unselected radio', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatRadio<int>(
          value: 1,
          groupValue: 2,
          onChanged: (_) {},
        ),
      ));
      await tester.pump();
      expect(find.byType(VMatRadio<int>), findsOneWidget);
    });

    testWidgets('tap changes value', (tester) async {
      int? selectedValue;
      await tester.pumpWidget(buildApp(
        StatefulBuilder(builder: (context, setState) {
          return Column(
            children: [
              VMatRadio<int>(
                value: 1,
                groupValue: selectedValue,
                onChanged: (v) => setState(() => selectedValue = v),
              ),
              VMatRadio<int>(
                value: 2,
                groupValue: selectedValue,
                onChanged: (v) => setState(() => selectedValue = v),
              ),
            ],
          );
        }),
      ));
      // Tap first radio
      await tester.tap(find.byType(VMatRadio<int>).first);
      await tester.pumpAndSettle();
      expect(selectedValue, 1);

      // Tap second radio
      await tester.tap(find.byType(VMatRadio<int>).last);
      await tester.pumpAndSettle();
      expect(selectedValue, 2);
    });

    testWidgets('toggleable radio can be deselected', (tester) async {
      int? selectedValue = 1;
      await tester.pumpWidget(buildApp(
        StatefulBuilder(builder: (context, setState) {
          return VMatRadio<int>(
            value: 1,
            groupValue: selectedValue,
            toggleable: true,
            onChanged: (v) => setState(() => selectedValue = v),
          );
        }),
      ));
      // Tap to deselect
      await tester.tap(find.byType(VMatRadio<int>));
      await tester.pumpAndSettle();
      expect(selectedValue, isNull);
    });

    testWidgets('disabled radio cannot be tapped', (tester) async {
      await tester.pumpWidget(buildApp(
        const VMatRadio<int>(
          value: 1,
          groupValue: null,
          onChanged: null,
        ),
      ));
      await tester.pump();
      expect(find.byType(VMatRadio<int>), findsOneWidget);
    });

    testWidgets('renders with activeColor', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatRadio<int>(
          value: 1,
          groupValue: 1,
          onChanged: (_) {},
          activeColor: Colors.red,
        ),
      ));
      await tester.pump();
      expect(find.byType(VMatRadio<int>), findsOneWidget);
    });

    testWidgets('renders with fillColor', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatRadio<int>(
          value: 1,
          groupValue: 1,
          onChanged: (_) {},
          fillColor: WidgetStateProperty.all(Colors.green),
        ),
      ));
      await tester.pump();
      expect(find.byType(VMatRadio<int>), findsOneWidget);
    });

    testWidgets('renders with overlayColor', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatRadio<int>(
          value: 1,
          groupValue: 1,
          onChanged: (_) {},
          overlayColor: WidgetStateProperty.all(Colors.blue.withAlpha(30)),
        ),
      ));
      await tester.pump();
      expect(find.byType(VMatRadio<int>), findsOneWidget);
    });

    testWidgets('didUpdateWidget triggers animation', (tester) async {
      int groupValue = 2;
      await tester.pumpWidget(buildApp(
        StatefulBuilder(builder: (context, setState) {
          return Column(children: [
            VMatRadio<int>(
              value: 1,
              groupValue: groupValue,
              onChanged: (v) => setState(() => groupValue = v!),
            ),
            ElevatedButton(
              onPressed: () => setState(() => groupValue = 1),
              child: const Text('Select'),
            ),
          ]);
        }),
      ));
      await tester.tap(find.text('Select'));
      await tester.pumpAndSettle();
    });

    testWidgets('renders with shrinkWrap materialTapTargetSize',
        (tester) async {
      await tester.pumpWidget(buildApp(
        VMatRadio<int>(
          value: 1,
          groupValue: 1,
          onChanged: (_) {},
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ));
      await tester.pump();
      expect(find.byType(VMatRadio<int>), findsOneWidget);
    });
  });

  group('VMatRadioListTile', () {
    testWidgets('renders with title', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatRadioListTile<int>(
          value: 1,
          groupValue: 1,
          onChanged: (_) {},
          title: const Text('Option 1'),
        ),
      ));
      await tester.pump();
      expect(find.text('Option 1'), findsOneWidget);
    });

    testWidgets('renders with title and subtitle', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatRadioListTile<int>(
          value: 1,
          groupValue: 1,
          onChanged: (_) {},
          title: const Text('Option 1'),
          subtitle: const Text('Description'),
        ),
      ));
      await tester.pump();
      expect(find.text('Description'), findsOneWidget);
    });

    testWidgets('trailing controlAffinity', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatRadioListTile<int>(
          value: 1,
          groupValue: 1,
          onChanged: (_) {},
          title: const Text('Trailing'),
          controlAffinity: ListTileControlAffinity.trailing,
          secondary: const Icon(Icons.star),
        ),
      ));
      await tester.pump();
      expect(find.text('Trailing'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('toggleable and tapped when checked', (tester) async {
      int? groupValue = 1;
      await tester.pumpWidget(buildApp(
        StatefulBuilder(builder: (context, setState) {
          return VMatRadioListTile<int>(
            value: 1,
            groupValue: groupValue,
            toggleable: true,
            onChanged: (v) => setState(() => groupValue = v),
            title: const Text('Toggle'),
          );
        }),
      ));
      // Tap to deselect
      await tester.tap(find.text('Toggle'));
      await tester.pumpAndSettle();
      expect(groupValue, isNull);
    });

    testWidgets('tap selects when unchecked', (tester) async {
      int? groupValue;
      await tester.pumpWidget(buildApp(
        StatefulBuilder(builder: (context, setState) {
          return VMatRadioListTile<int>(
            value: 1,
            groupValue: groupValue,
            onChanged: (v) => setState(() => groupValue = v),
            title: const Text('Select me'),
          );
        }),
      ));
      await tester.tap(find.text('Select me'));
      await tester.pumpAndSettle();
      expect(groupValue, 1);
    });

    testWidgets('disabled radio list tile', (tester) async {
      await tester.pumpWidget(buildApp(
        const VMatRadioListTile<int>(
          value: 1,
          groupValue: null,
          onChanged: null,
          title: Text('Disabled'),
        ),
      ));
      await tester.pump();
      expect(find.text('Disabled'), findsOneWidget);
    });

    testWidgets('renders with fillColor and overlayColor', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatRadioListTile<int>(
          value: 1,
          groupValue: 1,
          onChanged: (_) {},
          title: const Text('Styled'),
          fillColor: WidgetStateProperty.all(Colors.purple),
          overlayColor: WidgetStateProperty.all(Colors.purple.withAlpha(30)),
        ),
      ));
      await tester.pump();
      expect(find.text('Styled'), findsOneWidget);
    });
  });
}
