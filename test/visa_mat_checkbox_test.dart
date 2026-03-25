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

// Tests for VMatCheckbox and VMatCheckboxListTile
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

void main() {
  Widget buildApp(Widget child) {
    return MaterialApp(home: Scaffold(body: Center(child: child)));
  }

  group('VMatCheckbox', () {
    testWidgets('renders checked', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatCheckbox(
          value: true,
          onChanged: (_) {},
        ),
      ));
      await tester.pump();
      expect(find.byType(VMatCheckbox), findsOneWidget);
    });

    testWidgets('renders unchecked', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatCheckbox(
          value: false,
          onChanged: (_) {},
        ),
      ));
      await tester.pump();
      expect(find.byType(VMatCheckbox), findsOneWidget);
    });

    testWidgets('tap toggles value', (tester) async {
      bool? val = false;
      await tester.pumpWidget(buildApp(
        StatefulBuilder(builder: (context, setState) {
          return VMatCheckbox(
            value: val,
            onChanged: (v) => setState(() => val = v),
          );
        }),
      ));
      await tester.tap(find.byType(VMatCheckbox));
      await tester.pumpAndSettle();
      expect(val, true);
    });

    testWidgets('disabled checkbox', (tester) async {
      await tester.pumpWidget(buildApp(
        const VMatCheckbox(
          value: true,
          onChanged: null,
        ),
      ));
      await tester.pump();
      expect(find.byType(VMatCheckbox), findsOneWidget);
    });

    testWidgets('disabled unchecked checkbox', (tester) async {
      await tester.pumpWidget(buildApp(
        const VMatCheckbox(
          value: false,
          onChanged: null,
        ),
      ));
      await tester.pump();
      expect(find.byType(VMatCheckbox), findsOneWidget);
    });

    testWidgets('tristate checkbox null value', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatCheckbox(
          value: null,
          tristate: true,
          onChanged: (_) {},
        ),
      ));
      await tester.pump();
      expect(find.byType(VMatCheckbox), findsOneWidget);
    });

    testWidgets('tristate cycles false->true->null->false', (tester) async {
      bool? val = false;
      await tester.pumpWidget(buildApp(
        StatefulBuilder(builder: (context, setState) {
          return VMatCheckbox(
            value: val,
            tristate: true,
            onChanged: (v) => setState(() => val = v),
          );
        }),
      ));
      // false -> true
      await tester.tap(find.byType(VMatCheckbox));
      await tester.pumpAndSettle();
      expect(val, true);

      // true -> null
      await tester.tap(find.byType(VMatCheckbox));
      await tester.pumpAndSettle();
      expect(val, isNull);

      // null -> false
      await tester.tap(find.byType(VMatCheckbox));
      await tester.pumpAndSettle();
      expect(val, false);
    });

    testWidgets('renders with activeColor', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatCheckbox(
          value: true,
          onChanged: (_) {},
          activeColor: Colors.red,
        ),
      ));
      await tester.pump();
      expect(find.byType(VMatCheckbox), findsOneWidget);
    });

    testWidgets('renders with fillColor', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatCheckbox(
          value: true,
          onChanged: (_) {},
          fillColor: WidgetStateProperty.all(Colors.green),
        ),
      ));
      await tester.pump();
      expect(find.byType(VMatCheckbox), findsOneWidget);
    });

    testWidgets('renders with checkColor', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatCheckbox(
          value: true,
          onChanged: (_) {},
          checkColor: Colors.yellow,
        ),
      ));
      await tester.pump();
      expect(find.byType(VMatCheckbox), findsOneWidget);
    });

    testWidgets('renders with shape', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatCheckbox(
          value: true,
          onChanged: (_) {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ));
      await tester.pump();
      expect(find.byType(VMatCheckbox), findsOneWidget);
    });

    testWidgets('renders with side', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatCheckbox(
          value: false,
          onChanged: (_) {},
          side: const BorderSide(color: Colors.blue, width: 2),
        ),
      ));
      await tester.pump();
      expect(find.byType(VMatCheckbox), findsOneWidget);
    });

    testWidgets('didUpdateWidget triggers animation', (tester) async {
      bool val = false;
      await tester.pumpWidget(buildApp(
        StatefulBuilder(builder: (context, setState) {
          return Column(children: [
            VMatCheckbox(
              value: val,
              onChanged: (v) => setState(() => val = v!),
            ),
            ElevatedButton(
              onPressed: () => setState(() => val = true),
              child: const Text('Check'),
            ),
          ]);
        }),
      ));
      await tester.tap(find.text('Check'));
      await tester.pumpAndSettle();
    });

    testWidgets('shrinkWrap materialTapTargetSize', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatCheckbox(
          value: true,
          onChanged: (_) {},
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ));
      await tester.pump();
      expect(find.byType(VMatCheckbox), findsOneWidget);
    });
  });

  group('VMatCheckboxListTile', () {
    testWidgets('renders with title', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatCheckboxListTile(
          value: true,
          onChanged: (_) {},
          title: 'Check option',
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Check option'), findsOneWidget);
    });

    testWidgets('renders with title and subtitle', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatCheckboxListTile(
          value: false,
          onChanged: (_) {},
          title: 'Title',
          subtitle: 'Subtitle text',
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle text'), findsOneWidget);
    });

    testWidgets('trailing controlAffinity', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatCheckboxListTile(
          value: true,
          onChanged: (_) {},
          title: 'Trailing',
          controlAffinity: ListTileControlAffinity.trailing,
          secondary: const Icon(Icons.info),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Trailing'), findsOneWidget);
      expect(find.byIcon(Icons.info), findsOneWidget);
    });

    testWidgets('trailing controlAffinity with subtitle', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatCheckboxListTile(
          value: true,
          onChanged: (_) {},
          title: 'Trailing',
          subtitle: 'Sub',
          controlAffinity: ListTileControlAffinity.trailing,
          secondary: const Icon(Icons.info),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Sub'), findsOneWidget);
    });

    testWidgets('trailing controlAffinity with secondary', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatCheckboxListTile(
          value: false,
          onChanged: (_) {},
          title: 'With icon',
          controlAffinity: ListTileControlAffinity.trailing,
          secondary: const Icon(Icons.star),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('crossAxisAlignment start', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatCheckboxListTile(
          value: true,
          onChanged: (_) {},
          title: 'Start align',
          crossAxisAlignment: CrossAxisAlignment.start,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Start align'), findsOneWidget);
    });

    testWidgets('crossAxisAlignment end with subtitle', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatCheckboxListTile(
          value: true,
          onChanged: (_) {},
          title: 'End align',
          subtitle: 'Sub',
          crossAxisAlignment: CrossAxisAlignment.end,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('End align'), findsOneWidget);
    });

    testWidgets('crossAxisAlignment end without subtitle', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatCheckboxListTile(
          value: true,
          onChanged: (_) {},
          title: 'End no sub',
          crossAxisAlignment: CrossAxisAlignment.end,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('End no sub'), findsOneWidget);
    });

    testWidgets('tap toggles value', (tester) async {
      bool? val = false;
      await tester.pumpWidget(buildApp(
        StatefulBuilder(builder: (context, setState) {
          return VMatCheckboxListTile(
            value: val,
            onChanged: (v) => setState(() => val = v),
            title: 'Tap me',
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          );
        }),
      ));
      await tester.tap(find.text('Tap me'));
      await tester.pumpAndSettle();
      expect(val, true);
    });

    testWidgets('tristate tap cycles', (tester) async {
      bool? val = true;
      await tester.pumpWidget(buildApp(
        StatefulBuilder(builder: (context, setState) {
          return VMatCheckboxListTile(
            value: val,
            tristate: true,
            onChanged: (v) => setState(() => val = v),
            title: 'Tristate',
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          );
        }),
      ));
      // true -> null
      await tester.tap(find.text('Tristate'));
      await tester.pumpAndSettle();
      expect(val, isNull);

      // null -> false
      await tester.tap(find.text('Tristate'));
      await tester.pumpAndSettle();
      expect(val, false);
    });

    testWidgets('disabled', (tester) async {
      await tester.pumpWidget(buildApp(
        const VMatCheckboxListTile(
          value: false,
          onChanged: null,
          title: 'Disabled',
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Disabled'), findsOneWidget);
    });

    testWidgets('renders with child widget', (tester) async {
      await tester.pumpWidget(buildApp(
        VMatCheckboxListTile(
          value: true,
          onChanged: (_) {},
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Text('Custom child'),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Custom child'), findsOneWidget);
    });
  });
}
