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
import 'package:visa_nova_flutter/widgets/visa_checkbox/models/nested_indeterminate_item.dart';

void main() {
  group('VDef', () {
    test('switchLightTheme with null resets to defaults', () {
      final vDef = VDef();
      vDef.switchLightTheme(null);
      expect(VDef.defaultColorScheme.active, VColors.defaultActive);
      expect(VDef.defaultColorScheme.activeHover, VColors.defaultActiveHover);
      expect(VDef.defaultColorScheme.text, VColors.defaultText);
      expect(VDef.defaultColorScheme.vAccordionProperties, isNotNull);
      expect(VDef.defaultColorScheme.vButtonProperties, isNotNull);
    });

    test('switchLightTheme with data calls copyWith', () {
      final vDef = VDef();
      vDef.switchLightTheme(null); // Reset first
      vDef.switchLightTheme(const VDefaultThemeProps(
        active: Colors.purple,
      ));
      expect(VDef.defaultColorScheme.active, Colors.purple);
    });

    test('switchDarkTheme with null resets to dark defaults', () {
      final vDef = VDef();
      vDef.switchDarkTheme(null);
      expect(VDef.defaultColorSchemeDark.active, VColors.defaultActiveDark);
      expect(VDef.defaultColorSchemeDark.text, VColors.defaultTextDark);
      expect(VDef.defaultColorSchemeDark.vAccordionProperties, isNotNull);
    });

    test('switchDarkTheme with data calls copyWith', () {
      final vDef = VDef();
      vDef.switchDarkTheme(null); // Reset first
      vDef.switchDarkTheme(const VDefaultThemeProps(
        active: Colors.amber,
      ));
      expect(VDef.defaultColorSchemeDark.active, Colors.amber);
      // Reset to avoid side effects
      vDef.switchDarkTheme(null);
    });
  });

  group('VAlt', () {
    test('altColorScheme has correct light colors', () {
      expect(VAlt.altColorScheme.active, VColors.alternateActive);
      expect(VAlt.altColorScheme.vAccordionProperties, isNotNull);
    });

    test('altColorSchemeDark has correct dark colors', () {
      expect(VAlt.altColorSchemeDark.active, VColors.alternateActiveDark);
      expect(VAlt.altColorSchemeDark.vAccordionProperties, isNotNull);
    });
  });

  group('VTextStyle', () {
    test('default fontFamily is correct', () {
      final ts = VTextStyle();
      expect(ts.fontFamily, 'packages/visa_nova_flutter/VisaDialectUI');
    });

    test('baseTextStyle has correct defaults', () {
      final ts = VTextStyle();
      expect(ts.baseTextStyle.fontSize, 16.0);
      expect(ts.baseTextStyle.fontWeight, VFontWeight.regular);
      expect(ts.baseTextStyle.color, VColors.defaultText);
    });

    test('display1 has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.display1.fontSize, 70.0);
      expect(ts.display1.fontWeight, VFontWeight.semiBold);
    });

    test('display2 has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.display2.fontSize, 58.0);
      expect(ts.display2.fontWeight, VFontWeight.semiBold);
    });

    test('headline1 has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.headline1.fontSize, 36.0);
      expect(ts.headline1.fontWeight, VFontWeight.medium);
    });

    test('headline2 has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.headline2.fontSize, 28.0);
      expect(ts.headline2.fontWeight, VFontWeight.regular);
    });

    test('headline3 has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.headline3.fontSize, 24.0);
      expect(ts.headline3.fontWeight, VFontWeight.semiBold);
    });

    test('headline4 has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.headline4.fontSize, 22.0);
      expect(ts.headline4.fontWeight, VFontWeight.semiBold);
    });

    test('subtitle1 has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.subtitle1.fontSize, 18.0);
      expect(ts.subtitle1.fontWeight, VFontWeight.semiBold);
    });

    test('subtitle2 has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.subtitle2.fontSize, 18.0);
      expect(ts.subtitle2.fontWeight, VFontWeight.medium);
    });

    test('subtitle3 has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.subtitle3.fontSize, 16.0);
      expect(ts.subtitle3.fontWeight, VFontWeight.semiBold);
    });

    test('overline has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.overline.fontSize, 11.0);
      expect(ts.overline.fontWeight, VFontWeight.semiBold);
    });

    test('bodyText1 has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.bodyText1.fontSize, 18.0);
      expect(ts.bodyText1.fontWeight, VFontWeight.regular);
    });

    test('bodyText2 has correct size, weight, and height', () {
      final ts = VTextStyle();
      expect(ts.bodyText2.fontSize, 16.0);
      expect(ts.bodyText2.fontWeight, VFontWeight.regular);
      expect(ts.bodyText2.height, 1.5);
    });

    test('bodyText2Medium has correct size, weight, and height', () {
      final ts = VTextStyle();
      expect(ts.bodyText2Medium.fontSize, 16.0);
      expect(ts.bodyText2Medium.fontWeight, VFontWeight.medium);
      expect(ts.bodyText2Medium.height, 1.5);
    });

    test('bodyText3 has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.bodyText3.fontSize, 14.0);
      expect(ts.bodyText3.fontWeight, VFontWeight.regular);
    });

    test('buttonLarge has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.buttonLarge.fontSize, 16.0);
      expect(ts.buttonLarge.fontWeight, VFontWeight.semiBold);
    });

    test('buttonMedium has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.buttonMedium.fontSize, 14.0);
      expect(ts.buttonMedium.fontWeight, VFontWeight.semiBold);
    });

    test('buttonSmall has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.buttonSmall.fontSize, 14.0);
      expect(ts.buttonSmall.fontWeight, VFontWeight.medium);
    });

    test('uiLabelLarge has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.uiLabelLarge.fontSize, 16.0);
      expect(ts.uiLabelLarge.fontWeight, VFontWeight.regular);
    });

    test('uiLabelLargeActive has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.uiLabelLargeActive.fontSize, 16.0);
      expect(ts.uiLabelLargeActive.fontWeight, VFontWeight.medium);
    });

    test('uiLabel has correct size, weight, and height', () {
      final ts = VTextStyle();
      expect(ts.uiLabel.fontSize, 14.0);
      expect(ts.uiLabel.fontWeight, VFontWeight.regular);
      expect(ts.uiLabel.height, 1.4286);
    });

    test('uiLabelActive has correct size, weight, and height', () {
      final ts = VTextStyle();
      expect(ts.uiLabelActive.fontSize, 14.0);
      expect(ts.uiLabelActive.fontWeight, VFontWeight.medium);
      expect(ts.uiLabelActive.height, 1.4286);
    });

    test('uiLabelSmall has correct size, weight, and height', () {
      final ts = VTextStyle();
      expect(ts.uiLabelSmall.fontSize, 12.0);
      expect(ts.uiLabelSmall.fontWeight, VFontWeight.regular);
      expect(ts.uiLabelSmall.height, 1.3333);
    });

    test('uiLabelXSmall has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.uiLabelXSmall.fontSize, 10.0);
      expect(ts.uiLabelXSmall.fontWeight, VFontWeight.regular);
    });

    test('input has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.input.fontSize, 16.0);
      expect(ts.input.fontWeight, VFontWeight.regular);
    });

    test('tab has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.tab.fontSize, 16.0);
      expect(ts.tab.fontWeight, VFontWeight.regular);
    });

    test('tabSelected has correct size and weight', () {
      final ts = VTextStyle();
      expect(ts.tabSelected.fontSize, 16.0);
      expect(ts.tabSelected.fontWeight, VFontWeight.medium);
    });

    test('custom fontFamily propagates', () {
      final ts = VTextStyle(fontFamily: 'CustomFont');
      expect(ts.fontFamily, 'CustomFont');
      expect(ts.baseTextStyle.fontFamily, 'CustomFont');
    });
  });

  group('VTheme', () {
    test('primaryTheme has correct extensions', () {
      final theme = VTheme();
      final themeData = theme.primaryTheme;
      expect(themeData.extension<VDefaultThemeProps>(), isNotNull);
      expect(themeData.extension<VAltThemeProps>(), isNotNull);
      expect(themeData.extension<VMessageColorSet>(), isNotNull);
    });

    test('primaryThemeDark has correct extensions', () {
      final theme = VTheme();
      final themeData = theme.primaryThemeDark;
      expect(themeData.extension<VDefaultThemeProps>(), isNotNull);
      expect(themeData.extension<VAltThemeProps>(), isNotNull);
      expect(themeData.extension<VMessageColorSet>(), isNotNull);
    });

    test('custom fontFamily propagates', () {
      final theme = VTheme(fontFamily: 'CustomFont');
      expect(theme.fontFamily, 'CustomFont');
      expect(theme.textStyles.fontFamily, 'CustomFont');
    });
  });

  group('Global theme helpers', () {
    test('getDefaultColorScheme returns VDefaultThemeProps', () {
      final result = getDefaultColorScheme();
      expect(result, isA<VDefaultThemeProps>());
    });

    test('getDefaultColorSchemeDark returns VDefaultThemeProps', () {
      final result = getDefaultColorSchemeDark();
      expect(result, isA<VDefaultThemeProps>());
    });

    test('getAltColorScheme returns VAltThemeProps', () {
      final result = getAltColorScheme();
      expect(result, isA<VAltThemeProps>());
    });

    test('getAltColorSchemeDark returns VAltThemeProps', () {
      final result = getAltColorSchemeDark();
      expect(result, isA<VAltThemeProps>());
    });

    test('getMessageColorScheme returns VMessageColorSet', () {
      final result = getMessageColorScheme();
      expect(result, isA<VMessageColorSet>());
    });
  });

  group('size_helper', () {
    testWidgets('smallSpace returns height * 0.01', (tester) async {
      late double result;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(builder: (context) {
            result = smallSpace(context);
            return const SizedBox();
          }),
        ),
      );
      final height =
          tester.view.physicalSize.height / tester.view.devicePixelRatio;
      expect(result, height * 0.01);
    });

    testWidgets('mediumSpace returns height * 0.03', (tester) async {
      late double result;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(builder: (context) {
            result = mediumSpace(context);
            return const SizedBox();
          }),
        ),
      );
      final height =
          tester.view.physicalSize.height / tester.view.devicePixelRatio;
      expect(result, height * 0.03);
    });

    testWidgets('largeSpace returns height * 0.06', (tester) async {
      late double result;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(builder: (context) {
            result = largeSpace(context);
            return const SizedBox();
          }),
        ),
      );
      final height =
          tester.view.physicalSize.height / tester.view.devicePixelRatio;
      expect(result, height * 0.06);
    });

    testWidgets('visaButtonWidth returns height * 0.1', (tester) async {
      late double result;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(builder: (context) {
            result = visaButtonWidth(context);
            return const SizedBox();
          }),
        ),
      );
      final height =
          tester.view.physicalSize.height / tester.view.devicePixelRatio;
      expect(result, height * 0.1);
    });

    testWidgets('visaButtonHeight returns height * 0.0567', (tester) async {
      late double result;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(builder: (context) {
            result = visaButtonHeight(context);
            return const SizedBox();
          }),
        ),
      );
      final height =
          tester.view.physicalSize.height / tester.view.devicePixelRatio;
      expect(result, height * 0.0567);
    });
  });

  group('VNestedCheckboxItem', () {
    test('constructor sets parent for children', () {
      final child1 = VNestedCheckboxItem(label: 'Child 1', id: 'c1');
      final child2 = VNestedCheckboxItem(label: 'Child 2', id: 'c2');
      final parent = VNestedCheckboxItem(
        label: 'Parent',
        id: 'p1',
        children: [child1, child2],
      );
      expect(child1.parent, parent);
      expect(child2.parent, parent);
    });

    test('constructor defaults children to empty list', () {
      final item = VNestedCheckboxItem(label: 'Item', id: 'i1');
      expect(item.children, isNotNull);
      expect(item.children, isEmpty);
    });

    test('equality by id', () {
      final a = VNestedCheckboxItem(label: 'A', id: 'same');
      final b = VNestedCheckboxItem(label: 'B', id: 'same');
      expect(a == b, isTrue);
    });

    test('inequality by id', () {
      final a = VNestedCheckboxItem(label: 'A', id: 'x');
      final b = VNestedCheckboxItem(label: 'A', id: 'y');
      expect(a == b, isFalse);
    });

    test('identical returns true', () {
      final a = VNestedCheckboxItem(label: 'A', id: 'x');
      expect(a == a, isTrue);
    });

    test('inequality with different type', () {
      final a = VNestedCheckboxItem(label: 'A', id: 'x');
      // ignore: unrelated_type_equality_checks
      expect(a == 'not a checkbox item', isFalse);
    });

    test('hashCode matches id.hashCode', () {
      final item = VNestedCheckboxItem(label: 'A', id: 'myId');
      expect(item.hashCode, 'myId'.hashCode);
    });
  });
}
