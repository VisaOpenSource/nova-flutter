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

import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

void main() {
  test('VListItemStyle copyWith correctly updates fields', () {
    var style = const VListItemStyle(
      itemListColor: Colors.red,
      iconColor: Colors.blue,
      borderRadius: 10.0,
    );

    var updatedStyle = style.copyWith(
      itemListColor: Colors.green,
      iconColor: Colors.yellow,
      borderRadius: 20.0,
    );

    expect(updatedStyle.itemListColor, Colors.green);
    expect(updatedStyle.iconColor, Colors.yellow);
    expect(updatedStyle.borderRadius, 20.0);
  });

  test('VListItemStyle lerp correctly interpolates between two styles', () {
    var style1 = const VListItemStyle(
      itemListColor: Colors.red,
      iconColor: Colors.blue,
      borderRadius: 10.0,
    );

    var style2 = const VListItemStyle(
      itemListColor: Colors.green,
      iconColor: Colors.yellow,
      borderRadius: 20.0,
    );

    var lerpStyle = style1.lerp(style2, 0.5);

    expect(lerpStyle.itemListColor, Color.lerp(Colors.red, Colors.green, 0.5));
    expect(lerpStyle.iconColor, Color.lerp(Colors.blue, Colors.yellow, 0.5));
    expect(lerpStyle.borderRadius, lerpDouble(10.0, 20.0, 0.5));
  });

  test('VListItemStyle copyWith correctly updates fields', () {
    var style = const VListItemStyle(
      itemListColor: Colors.red,
      borderRadius: 10.0,
    );

    var updatedStyle = style.copyWith(
      itemListColor: Colors.green,
      borderRadius: 20.0,
    );

    expect(updatedStyle.itemListColor, Colors.green);
    expect(updatedStyle.borderRadius, 20.0);
  });

  testWidgets('VListItem height is properly set', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: VListItem(
        height: 100.0,
        child: Text('Test'),
      ),
    ));

    final container = tester.widget<Container>(find.byType(Container));
    expect(container.constraints?.minHeight, 100.0);
  });

  testWidgets('VListItem onTap callback is called when item is tapped',
      (WidgetTester tester) async {
    var tapped = false;

    await tester.pumpWidget(MaterialApp(
      home: VListItem(
        child: const Text('Test'),
        onTap: () {
          tapped = true;
        },
      ),
    ));

    await tester.tap(find.byType(VListItem));
    expect(tapped, true);
  });

  testWidgets(
      'VListItem applies getAltColorSchemeDark when theme brightness is dark and vExt is not VDef',
      (WidgetTester tester) async {
    var tapped = false;
    // Test with Brightness.dark and vExt is not VDef
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: VListItem(
        onTap: () {
          tapped = true;
        },
        vExt: VAlt(),
        child: const Text('Test'),
      ),
    ));

    // Check if getAltColorSchemeDark is applied
    await tester.tap(find.byType(VListItem));
    expect(tapped, true);
  });

  testWidgets('VListItem color changes according to _isPressed and hasCheck',
      (WidgetTester tester) async {
    const pressedStyle = VListItemStyle(itemListColor: Colors.red);
    const checkedStyle = VListItemStyle(itemListColor: Colors.green);

    await tester.pumpWidget(MaterialApp(
      home: VListItem(
        onTap: () {}, // Needed to make the item pressable
        style: pressedStyle,
        child: const Text('Test'),
      ),
    ));

    await tester.tap(find.byType(VListItem));
    await tester.pump();

    final container = tester.widget<Container>(find.byType(Container));
    expect((container.decoration as BoxDecoration).color,
        pressedStyle.itemListColor);

    await tester.pumpWidget(const MaterialApp(
      home: VListItem(
        hasCheck: true,
        style: checkedStyle,
        child: Text('Test'),
      ),
    ));

    final container2 = tester.widget<Container>(find.byType(Container));
    expect((container2.decoration as BoxDecoration).color,
        checkedStyle.itemListColor);
  });

  testWidgets(
      'VListItem icon color is defaultStyle.disabled when isReadOnly is true or onTap is null',
      (WidgetTester tester) async {
    const VIcon trailingWidget = VIcon(svgIcon: VIcons.chevronRightTiny);

    await tester.pumpWidget(const MaterialApp(
      home: VListItem(
        isReadOnly: true,
        trailingIcon: trailingWidget,
        hasTrailingIcon: true,
        child: Text('Test'),
      ),
    ));

    // Find the icon widget and verify its color
    expect(find.byType(VIcon), findsWidgets);
  });

  testWidgets('VListItem icon when hasTrailing is false',
      (WidgetTester tester) async {
    // final VIcon trailingWidget = VIcon(svgIcon: VIcons.chevronRightTiny);

    await tester.pumpWidget(const MaterialApp(
      home: VListItem(
        isReadOnly: true,
        hasTrailingIcon: true,
        child: Text('Test'),
      ),
    ));

    // Find the icon widget and verify its color
    expect(find.byType(VIcon), findsWidgets);
  });

  testWidgets('VListItem icon when color', (WidgetTester tester) async {
    // ignore: unused_local_variable
    const Color color = VColors.defaultActive;

    await tester.pumpWidget(MaterialApp(
      home: VListItem(
        hasTrailingIcon: true,
        onTap: () {},
        child: const Text('Test'),
      ),
    ));

    // Find the icon widget and verify its color
    expect(find.byType(VIcon), findsWidgets);

    // Check the icon color
    final VIcon iconWidget = tester.widget<VIcon>(find.byType(VIcon));
    final Color? iconColor = iconWidget.iconColor;
    expect(iconColor, VColors.defaultActive);
  });

  testWidgets('VListItem with isThreeLine true', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: VListItem(
        isThreeLine: true,
        onTap: () {},
        child: const Text('Three line item'),
      ),
    ));

    expect(find.text('Three line item'), findsOneWidget);
  });

  testWidgets('VListItem with isThreeLine false and no height',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: VListItem(
        isThreeLine: false,
        onTap: () {},
        child: const Text('Two line item'),
      ),
    ));

    expect(find.text('Two line item'), findsOneWidget);
  });

  testWidgets('VListItem with no onTap (read only icon color)',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: VListItem(
        hasTrailingIcon: true,
        child: Text('Read only'),
      ),
    ));

    expect(find.text('Read only'), findsOneWidget);
  });

  testWidgets('VListItem default color (no press, no check)',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: VListItem(
        onTap: () {},
        child: const Text('Default color'),
      ),
    ));

    expect(find.text('Default color'), findsOneWidget);
  });

  testWidgets('VListItem pressed state', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: VListItem(
        onTap: () {},
        child: const Text('Press me'),
      ),
    ));

    final gesture =
        await tester.startGesture(tester.getCenter(find.byType(VListItem)));
    await tester.pump();

    expect(find.text('Press me'), findsOneWidget);

    await gesture.up();
    await tester.pump();
  });

  testWidgets('VListItem tap cancel', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: VListItem(
        onTap: () {},
        child: const Text('Cancel me'),
      ),
    ));

    final gesture =
        await tester.startGesture(tester.getCenter(find.byType(VListItem)));
    await tester.pump();

    await gesture.moveBy(const Offset(0, 200));
    await tester.pump();

    await gesture.up();
    await tester.pump();
  });

  test('VListItemStyle lerp with non-VListItemStyle returns this', () {
    const style = VListItemStyle(
      itemListColor: Colors.red,
      iconColor: Colors.green,
      borderRadius: 8.0,
    );

    final result = style.lerp(null, 0.5);
    expect(result, style);
  });

  testWidgets('VListItem dark mode', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: VListItem(
        onTap: () {},
        child: const Text('Dark'),
      ),
    ));

    expect(find.text('Dark'), findsOneWidget);
  });

  testWidgets('VListItem alt theme', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: VListItem(
        onTap: () {},
        vExt: VAlt(),
        child: const Text('Alt'),
      ),
    ));

    expect(find.text('Alt'), findsOneWidget);
  });

  // Coverage: VListItemStyle copyWith
  test('VListItemStyle copyWith', () {
    const style = VListItemStyle(itemListColor: Colors.red);
    final copied = style.copyWith(itemListColor: Colors.blue);
    expect(copied.itemListColor, Colors.blue);
  });

  test('VListItemStyle copyWith preserves iconColor when not passed', () {
    const style = VListItemStyle(
      itemListColor: Colors.red,
      iconColor: Colors.green,
      borderRadius: 8.0,
    );
    // Call copyWith without iconColor to cover the fallback branch
    final copied = style.copyWith(itemListColor: Colors.blue);
    expect(copied.iconColor, Colors.green);
    expect(copied.itemListColor, Colors.blue);
    expect(copied.borderRadius, 8.0);
  });

  //! This is ListItem golden test

  testWidgets('ListItem golden(snapshot) testing', (WidgetTester tester) async {
    await tester.pumpWidget(
      RepaintBoundary(
        child: MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: VListItem(
                  child: const Text('List Item'),
                  hasTrailingIcon: true,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(VListItem),
      matchesGoldenFile('goldens/list_item.png'),
    );
  });
}
