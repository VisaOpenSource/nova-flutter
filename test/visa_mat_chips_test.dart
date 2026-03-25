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

// Tests for VRawChip and Chip (visa_mat_chips.dart)
import 'package:flutter/material.dart' hide Chip;
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

void main() {
  Widget buildApp(Widget child) {
    return MaterialApp(home: Scaffold(body: Center(child: child)));
  }

  group('VRawChip', () {
    testWidgets('renders with label', (tester) async {
      await tester.pumpWidget(buildApp(
        VRawChip(
          label: const Text('Chip'),
          onPressed: () {},
        ),
      ));
      await tester.pump();
      expect(find.text('Chip'), findsOneWidget);
    });

    testWidgets('tap triggers onPressed', (tester) async {
      bool pressed = false;
      await tester.pumpWidget(buildApp(
        VRawChip(
          label: const Text('Press me'),
          onPressed: () => pressed = true,
        ),
      ));
      await tester.tap(find.text('Press me'));
      await tester.pumpAndSettle();
      expect(pressed, isTrue);
    });

    testWidgets('selected state with onSelected', (tester) async {
      bool selected = false;
      await tester.pumpWidget(buildApp(
        StatefulBuilder(builder: (context, setState) {
          return VRawChip(
            label: const Text('Select'),
            selected: selected,
            onSelected: (v) => setState(() => selected = v),
          );
        }),
      ));
      await tester.tap(find.text('Select'));
      await tester.pumpAndSettle();
      expect(selected, isTrue);
    });

    testWidgets('renders with avatar', (tester) async {
      await tester.pumpWidget(buildApp(
        VRawChip(
          label: const Text('Avatar chip'),
          avatar: const CircleAvatar(child: Text('A')),
          onPressed: () {},
        ),
      ));
      await tester.pump();
      expect(find.text('A'), findsOneWidget);
      expect(find.text('Avatar chip'), findsOneWidget);
    });

    testWidgets('renders with deleteIcon and onDeleted', (tester) async {
      bool deleted = false;
      await tester.pumpWidget(buildApp(
        VRawChip(
          label: const Text('Delete me'),
          onDeleted: () => deleted = true,
        ),
      ));
      await tester.pump();
      // Find and tap the delete icon
      expect(find.byIcon(Icons.cancel), findsOneWidget);
      await tester.tap(find.byIcon(Icons.cancel));
      await tester.pumpAndSettle();
      expect(deleted, isTrue);
    });

    testWidgets('disabled chip', (tester) async {
      await tester.pumpWidget(buildApp(
        const VRawChip(
          label: Text('Disabled'),
          isEnabled: false,
        ),
      ));
      await tester.pump();
      expect(find.text('Disabled'), findsOneWidget);
    });

    testWidgets('renders with tooltip', (tester) async {
      await tester.pumpWidget(buildApp(
        VRawChip(
          label: const Text('Tooltip chip'),
          tooltip: 'My tooltip',
          onPressed: () {},
        ),
      ));
      await tester.pump();
      // Long press to show tooltip
      await tester.longPress(find.text('Tooltip chip'));
      await tester.pumpAndSettle();
      expect(find.text('My tooltip'), findsOneWidget);
    });

    testWidgets('renders with custom colors', (tester) async {
      await tester.pumpWidget(buildApp(
        VRawChip(
          label: const Text('Colored'),
          backgroundColor: Colors.blue,
          selectedColor: Colors.green,
          disabledColor: Colors.grey,
          selected: true,
          onSelected: (_) {},
        ),
      ));
      await tester.pump();
      expect(find.text('Colored'), findsOneWidget);
    });

    testWidgets('renders with shape and side', (tester) async {
      await tester.pumpWidget(buildApp(
        VRawChip(
          label: const Text('Shaped'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: const BorderSide(color: Colors.red),
          onPressed: () {},
        ),
      ));
      await tester.pump();
      expect(find.text('Shaped'), findsOneWidget);
    });

    testWidgets('renders with showCheckmark false', (tester) async {
      await tester.pumpWidget(buildApp(
        VRawChip(
          label: const Text('No check'),
          selected: true,
          showCheckmark: false,
          onSelected: (_) {},
        ),
      ));
      await tester.pump();
      expect(find.text('No check'), findsOneWidget);
    });

    testWidgets('renders with elevation and shadowColor', (tester) async {
      await tester.pumpWidget(buildApp(
        VRawChip(
          label: const Text('Elevated'),
          elevation: 4.0,
          shadowColor: Colors.black,
          pressElevation: 8.0,
          onPressed: () {},
        ),
      ));
      await tester.pump();
      expect(find.text('Elevated'), findsOneWidget);
    });

    testWidgets('tap down and up', (tester) async {
      await tester.pumpWidget(buildApp(
        VRawChip(
          label: const Text('TapAnim'),
          onPressed: () {},
        ),
      ));
      // Press and hold to trigger tapDown animation
      final gesture = await tester.startGesture(
          tester.getCenter(find.text('TapAnim')));
      await tester.pump(const Duration(milliseconds: 100));
      await gesture.up();
      await tester.pumpAndSettle();
    });

    testWidgets('delete button tooltip message', (tester) async {
      await tester.pumpWidget(buildApp(
        VRawChip(
          label: const Text('WithTooltip'),
          onDeleted: () {},
          deleteButtonTooltipMessage: 'Remove',
        ),
      ));
      await tester.pump();
      // Long press delete icon to show tooltip
      await tester.longPress(find.byIcon(Icons.cancel));
      await tester.pumpAndSettle();
      expect(find.text('Remove'), findsOneWidget);
    });

    testWidgets('selected chip with checkmark', (tester) async {
      await tester.pumpWidget(buildApp(
        VRawChip(
          label: const Text('Checked'),
          selected: true,
          showCheckmark: true,
          checkmarkColor: Colors.white,
          onSelected: (_) {},
        ),
      ));
      await tester.pump();
      await tester.pumpAndSettle();
      expect(find.text('Checked'), findsOneWidget);
    });

    testWidgets('chip with avatar and selected', (tester) async {
      await tester.pumpWidget(buildApp(
        VRawChip(
          label: const Text('AvatarSelect'),
          avatar: const CircleAvatar(child: Text('X')),
          selected: true,
          onSelected: (_) {},
        ),
      ));
      await tester.pump();
      await tester.pumpAndSettle();
      expect(find.text('AvatarSelect'), findsOneWidget);
    });

    testWidgets('isEnabled transition', (tester) async {
      bool isEnabled = true;
      await tester.pumpWidget(buildApp(
        StatefulBuilder(builder: (context, setState) {
          return Column(children: [
            VRawChip(
              label: const Text('Enable toggle'),
              isEnabled: isEnabled,
              onPressed: () {},
            ),
            ElevatedButton(
              onPressed: () => setState(() => isEnabled = !isEnabled),
              child: const Text('Toggle'),
            ),
          ]);
        }),
      ));
      await tester.tap(find.text('Toggle'));
      await tester.pumpAndSettle();
    });

    testWidgets('delete icon with custom color', (tester) async {
      await tester.pumpWidget(buildApp(
        VRawChip(
          label: const Text('ColorDelete'),
          onDeleted: () {},
          deleteIconColor: Colors.red,
        ),
      ));
      await tester.pump();
      expect(find.byIcon(Icons.cancel), findsOneWidget);
    });
  });

  group('Chip (wrapper)', () {
    testWidgets('Chip renders via VRawChip', (tester) async {
      await tester.pumpWidget(buildApp(
        const Chip(label: Text('Simple chip')),
      ));
      await tester.pump();
      expect(find.text('Simple chip'), findsOneWidget);
    });

    testWidgets('Chip with onDeleted', (tester) async {
      bool deleted = false;
      await tester.pumpWidget(buildApp(
        Chip(
          label: const Text('Deletable'),
          onDeleted: () => deleted = true,
        ),
      ));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.cancel));
      await tester.pumpAndSettle();
      expect(deleted, isTrue);
    });

    testWidgets('Chip with avatar', (tester) async {
      await tester.pumpWidget(buildApp(
        const Chip(
          label: Text('With avatar'),
          avatar: CircleAvatar(child: Text('B')),
        ),
      ));
      await tester.pump();
      expect(find.text('B'), findsOneWidget);
    });

    testWidgets('Chip with custom labelStyle and padding', (tester) async {
      await tester.pumpWidget(buildApp(
        const Chip(
          label: Text('Styled'),
          labelStyle: TextStyle(fontSize: 18),
          padding: EdgeInsets.all(12),
        ),
      ));
      await tester.pump();
      expect(find.text('Styled'), findsOneWidget);
    });
  });

  // ── Additional coverage tests ──

  group('VRawChip M3 / M2 background color paths', () {
    testWidgets('M3 theme resolves color through _getBackgroundColor',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          body: VRawChip(
            label: const Text('M3'),
            selected: true,
            onSelected: (_) {},
            backgroundColor: Colors.blue,
            selectedColor: Colors.green,
            disabledColor: Colors.grey,
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('M3'), findsOneWidget);
    });

    testWidgets('M2 theme resolves color through _getBackgroundColor',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
        theme: ThemeData(useMaterial3: false),
        home: Scaffold(
          body: VRawChip(
            label: const Text('M2'),
            selected: true,
            onSelected: (_) {},
            backgroundColor: Colors.blue,
            selectedColor: Colors.green,
            disabledColor: Colors.grey,
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('M2'), findsOneWidget);
    });

    testWidgets('M2 disabled chip background', (tester) async {
      await tester.pumpWidget(MaterialApp(
        theme: ThemeData(useMaterial3: false),
        home: const Scaffold(
          body: VRawChip(label: Text('dis'), isEnabled: false),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('dis'), findsOneWidget);
    });
  });

  group('VRawChip didUpdateWidget transitions', () {
    testWidgets('avatar appears then disappears', (tester) async {
      bool showAvatar = false;
      await tester.pumpWidget(buildApp(
        StatefulBuilder(builder: (context, setState) {
          return Column(children: [
            VRawChip(
              label: const Text('AV'),
              avatar: showAvatar
                  ? const CircleAvatar(child: Text('A'))
                  : null,
              onPressed: () {},
            ),
            ElevatedButton(
              onPressed: () => setState(() => showAvatar = !showAvatar),
              child: const Text('ToggleAv'),
            ),
          ]);
        }),
      ));
      // Show avatar
      await tester.tap(find.text('ToggleAv'));
      await tester.pumpAndSettle();
      expect(find.text('A'), findsOneWidget);
      // Hide avatar
      await tester.tap(find.text('ToggleAv'));
      await tester.pumpAndSettle();
    });

    testWidgets('onDeleted appears then disappears', (tester) async {
      bool showDelete = false;
      await tester.pumpWidget(buildApp(
        StatefulBuilder(builder: (context, setState) {
          return Column(children: [
            VRawChip(
              label: const Text('Del'),
              onDeleted: showDelete ? () {} : null,
              onPressed: () {},
            ),
            ElevatedButton(
              onPressed: () => setState(() => showDelete = !showDelete),
              child: const Text('ToggleDel'),
            ),
          ]);
        }),
      ));
      // Show delete
      await tester.tap(find.text('ToggleDel'));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.cancel), findsOneWidget);
      // Hide delete
      await tester.tap(find.text('ToggleDel'));
      await tester.pumpAndSettle();
    });

    testWidgets('selected toggles via parent rebuild', (tester) async {
      bool sel = false;
      await tester.pumpWidget(buildApp(
        StatefulBuilder(builder: (context, setState) {
          return Column(children: [
            VRawChip(
              label: const Text('Sel'),
              selected: sel,
              onSelected: (v) => setState(() => sel = v),
            ),
            ElevatedButton(
              onPressed: () => setState(() => sel = !sel),
              child: const Text('ToggleSel'),
            ),
          ]);
        }),
      ));
      await tester.tap(find.text('ToggleSel'));
      await tester.pumpAndSettle();
      // toggle back
      await tester.tap(find.text('ToggleSel'));
      await tester.pumpAndSettle();
    });
  });

  group('VRawChip RTL layout', () {
    testWidgets('renders correctly in RTL direction', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: VRawChip(
              label: const Text('RTL'),
              avatar: const CircleAvatar(child: Text('R')),
              onDeleted: () {},
              onPressed: () {},
            ),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('RTL'), findsOneWidget);
    });

    testWidgets('delete button hit detection in RTL', (tester) async {
      bool deleted = false;
      await tester.pumpWidget(MaterialApp(
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: VRawChip(
              label: const Text('RTL del'),
              onDeleted: () => deleted = true,
            ),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.cancel));
      await tester.pumpAndSettle();
      expect(deleted, isTrue);
    });
  });

  group('VRawChip dark theme paths', () {
    testWidgets('dark theme disabled chip covers _disabledColor dark branch',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
        theme: ThemeData.dark(),
        home: const Scaffold(
          body: VRawChip(label: Text('Dark disabled'), isEnabled: false),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Dark disabled'), findsOneWidget);
    });

    testWidgets('dark theme selected chip with checkmark', (tester) async {
      await tester.pumpWidget(MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          body: VRawChip(
            label: const Text('Dark check'),
            avatar: const CircleAvatar(child: Text('D')),
            selected: true,
            showCheckmark: true,
            onSelected: (_) {},
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Dark check'), findsOneWidget);
    });

    testWidgets('dark theme checkmark without avatar', (tester) async {
      await tester.pumpWidget(MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          body: VRawChip(
            label: const Text('Dark no avatar'),
            selected: true,
            showCheckmark: true,
            onSelected: (_) {},
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Dark no avatar'), findsOneWidget);
    });
  });

  group('VRawChip intrinsic sizing', () {
    testWidgets('chip inside IntrinsicWidth triggers computeMinIntrinsicWidth',
        (tester) async {
      await tester.pumpWidget(buildApp(
        IntrinsicWidth(
          child: VRawChip(
            label: const Text('Intrinsic'),
            onPressed: () {},
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Intrinsic'), findsOneWidget);
    });

    testWidgets(
        'chip inside IntrinsicHeight triggers computeMinIntrinsicHeight',
        (tester) async {
      await tester.pumpWidget(buildApp(
        IntrinsicHeight(
          child: VRawChip(
            label: const Text('IntH'),
            avatar: const CircleAvatar(child: Text('I')),
            onDeleted: () {},
            onPressed: () {},
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('IntH'), findsOneWidget);
    });
  });

  group('VRawChip materialTapTargetSize', () {
    testWidgets('padded tap target', (tester) async {
      await tester.pumpWidget(buildApp(
        VRawChip(
          label: const Text('Padded'),
          materialTapTargetSize: MaterialTapTargetSize.padded,
          onPressed: () {},
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Padded'), findsOneWidget);
    });

    testWidgets('shrinkWrap tap target', (tester) async {
      await tester.pumpWidget(buildApp(
        VRawChip(
          label: const Text('Shrink'),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {},
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Shrink'), findsOneWidget);
    });
  });

  group('VRawChip _IndividualOverrides resolve paths', () {
    testWidgets('selected + disabled state', (tester) async {
      await tester.pumpWidget(buildApp(
        const VRawChip(
          label: Text('SelDis'),
          selected: true,
          isEnabled: false,
          selectedColor: Colors.green,
          disabledColor: Colors.grey,
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('SelDis'), findsOneWidget);
    });
  });

  group('VRawChip checkmark animation phases', () {
    testWidgets('checkmark animates through t < 0.5 and t >= 0.5',
        (tester) async {
      bool sel = false;
      await tester.pumpWidget(buildApp(
        StatefulBuilder(builder: (context, setState) {
          return VRawChip(
            label: const Text('CheckAnim'),
            avatar: const CircleAvatar(child: Text('C')),
            selected: sel,
            showCheckmark: true,
            onSelected: (v) => setState(() => sel = v),
          );
        }),
      ));
      // Tap to select - triggers checkmark animation
      await tester.tap(find.text('CheckAnim'));
      // Pump at intermediate frames to hit t < 0.5
      await tester.pump(const Duration(milliseconds: 50));
      await tester.pump(const Duration(milliseconds: 50));
      // Pump more to hit t >= 0.5
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();
    });

    testWidgets('deselect triggers checkmark reverse animation',
        (tester) async {
      bool sel = true;
      await tester.pumpWidget(buildApp(
        StatefulBuilder(builder: (context, setState) {
          return VRawChip(
            label: const Text('Reverse'),
            avatar: const CircleAvatar(child: Text('R')),
            selected: sel,
            showCheckmark: true,
            onSelected: (v) => setState(() => sel = v),
          );
        }),
      ));
      await tester.pumpAndSettle();
      // Deselect
      await tester.tap(find.text('Reverse'));
      await tester.pump(const Duration(milliseconds: 50));
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();
    });
  });

  group('VRawChip disabled chip paint paths', () {
    testWidgets('disabled chip with delete icon covers _paintChild disabled path',
        (tester) async {
      await tester.pumpWidget(buildApp(
        const VRawChip(
          label: Text('DisabledDel'),
          isEnabled: false,
          onDeleted: null,
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('DisabledDel'), findsOneWidget);
    });

    testWidgets('disabling chip triggers enable animation reverse',
        (tester) async {
      bool enabled = true;
      await tester.pumpWidget(buildApp(
        StatefulBuilder(builder: (context, setState) {
          return Column(children: [
            VRawChip(
              label: const Text('EnDis'),
              isEnabled: enabled,
              onDeleted: () {},
              onPressed: () {},
              avatar: const CircleAvatar(child: Text('E')),
            ),
            ElevatedButton(
              onPressed: () => setState(() => enabled = !enabled),
              child: const Text('ToggleEn'),
            ),
          ]);
        }),
      ));
      await tester.pumpAndSettle();
      // Disable
      await tester.tap(find.text('ToggleEn'));
      await tester.pump(const Duration(milliseconds: 50));
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();
      // Re-enable
      await tester.tap(find.text('ToggleEn'));
      await tester.pump(const Duration(milliseconds: 50));
      await tester.pumpAndSettle();
    });
  });

  group('VRawChip tap cancel', () {
    testWidgets('tap cancel resets isTapping', (tester) async {
      await tester.pumpWidget(buildApp(
        VRawChip(
          label: const Text('Cancel'),
          onPressed: () {},
        ),
      ));
      final gesture = await tester.startGesture(
          tester.getCenter(find.text('Cancel')));
      await tester.pump(const Duration(milliseconds: 50));
      await gesture.cancel();
      await tester.pumpAndSettle();
    });
  });

  group('VRawChip color property with WidgetStateProperty', () {
    testWidgets('color WidgetStateProperty resolves in _IndividualOverrides',
        (tester) async {
      await tester.pumpWidget(buildApp(
        VRawChip(
          label: const Text('WSP'),
          color: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) return Colors.red;
            return Colors.blue;
          }),
          selected: true,
          onSelected: (_) {},
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('WSP'), findsOneWidget);
    });
  });

  group('VRawChip computeDistanceToActualBaseline', () {
    testWidgets('baseline accessible via LayoutBuilder', (tester) async {
      await tester.pumpWidget(buildApp(
        Baseline(
          baseline: 20.0,
          baselineType: TextBaseline.alphabetic,
          child: VRawChip(
            label: const Text('Base'),
            onPressed: () {},
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Base'), findsOneWidget);
    });
  });

  group('VRawChip iconTheme with avatar', () {
    testWidgets('chip with avatar picks up iconTheme from ChipTheme',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
        theme: ThemeData(
          chipTheme: const ChipThemeData(
            iconTheme: IconThemeData(color: Colors.red, size: 20),
          ),
        ),
        home: Scaffold(
          body: VRawChip(
            label: const Text('IconTheme'),
            avatar: const Icon(Icons.star),
            onPressed: () {},
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.star), findsOneWidget);
    });
  });
}
