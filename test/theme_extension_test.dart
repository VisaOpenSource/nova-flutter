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

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

void main() {
  group('VDefaultThemeProps', () {
    test('copyWith returns new instance with overridden fields', () {
      const original = VDefaultThemeProps(
        active: Colors.red,
        activeHover: Colors.blue,
        activePressed: Colors.green,
        subtle: Colors.grey,
        activeSubtle: Colors.orange,
        surface1: Colors.white,
        surface2: Colors.black,
        surface3: Colors.purple,
        surfaceHighlight: Colors.yellow,
        surfaceLowlight: Colors.brown,
        text: Colors.black,
        textSubtle: Colors.grey,
        onActive: Colors.white,
        border: Colors.black,
        disabled: Colors.grey,
        disabledIcon: Colors.grey,
        accent: Colors.pink,
        overlay: Colors.black54,
        transparent: Colors.transparent,
      );

      final copied = original.copyWith(
        active: Colors.amber,
        vAccordionProperties: VAccordionProperties(),
      ) as VDefaultThemeProps;

      expect(copied.active, Colors.amber);
      expect(copied.activeHover, Colors.blue);
      expect(copied.vAccordionProperties, isNotNull);
    });

    test('copyWith with no arguments returns equivalent instance', () {
      const original = VDefaultThemeProps(
        active: Colors.red,
        text: Colors.black,
      );
      final copied = original.copyWith() as VDefaultThemeProps;
      expect(copied.active, Colors.red);
      expect(copied.text, Colors.black);
    });

    test('lerp returns this when other is null', () {
      const props = VDefaultThemeProps(
        active: Colors.red,
      );
      final result = props.lerp(null, 0.5);
      expect(identical(result, props), isTrue);
    });

    test('lerp interpolates colors correctly at t=0', () {
      const a = VDefaultThemeProps(
        active: Colors.red,
        text: Colors.black,
      );
      const b = VDefaultThemeProps(
        active: Colors.blue,
        text: Colors.white,
      );
      final result = a.lerp(b, 0.0) as VDefaultThemeProps;
      expect(result.active?.value, Colors.red.value);
      expect(result.text?.value, Colors.black.value);
    });

    test('lerp interpolates colors correctly at t=1', () {
      const a = VDefaultThemeProps(
        active: Colors.red,
        text: Colors.black,
      );
      const b = VDefaultThemeProps(
        active: Colors.blue,
        text: Colors.white,
      );
      final result = a.lerp(b, 1.0) as VDefaultThemeProps;
      expect(result.active?.value, Colors.blue.value);
      expect(result.text?.value, Colors.white.value);
    });

    test('lerp interpolates colors correctly at t=0.5', () {
      const a = VDefaultThemeProps(
        active: Color(0xFF000000),
        activeHover: Color(0xFF000000),
        activePressed: Color(0xFF000000),
        subtle: Color(0xFF000000),
        activeSubtle: Color(0xFF000000),
        surface1: Color(0xFF000000),
        surface2: Color(0xFF000000),
        surface3: Color(0xFF000000),
        surfaceHighlight: Color(0xFF000000),
        surfaceLowlight: Color(0xFF000000),
        text: Color(0xFF000000),
        textSubtle: Color(0xFF000000),
        onActive: Color(0xFF000000),
        border: Color(0xFF000000),
        disabled: Color(0xFF000000),
        disabledIcon: Color(0xFF000000),
        accent: Color(0xFF000000),
        overlay: Color(0xFF000000),
        transparent: Color(0xFF000000),
      );
      const b = VDefaultThemeProps(
        active: Color(0xFFFFFFFF),
        activeHover: Color(0xFFFFFFFF),
        activePressed: Color(0xFFFFFFFF),
        subtle: Color(0xFFFFFFFF),
        activeSubtle: Color(0xFFFFFFFF),
        surface1: Color(0xFFFFFFFF),
        surface2: Color(0xFFFFFFFF),
        surface3: Color(0xFFFFFFFF),
        surfaceHighlight: Color(0xFFFFFFFF),
        surfaceLowlight: Color(0xFFFFFFFF),
        text: Color(0xFFFFFFFF),
        textSubtle: Color(0xFFFFFFFF),
        onActive: Color(0xFFFFFFFF),
        border: Color(0xFFFFFFFF),
        disabled: Color(0xFFFFFFFF),
        disabledIcon: Color(0xFFFFFFFF),
        accent: Color(0xFFFFFFFF),
        overlay: Color(0xFFFFFFFF),
        transparent: Color(0xFFFFFFFF),
      );
      final result = a.lerp(b, 0.5) as VDefaultThemeProps;
      expect(result.active, isNotNull);
      expect(result.activeHover, isNotNull);
      expect(result.activePressed, isNotNull);
      expect(result.subtle, isNotNull);
      expect(result.activeSubtle, isNotNull);
      expect(result.surface1, isNotNull);
      expect(result.surface2, isNotNull);
      expect(result.surface3, isNotNull);
      expect(result.surfaceHighlight, isNotNull);
      expect(result.surfaceLowlight, isNotNull);
      expect(result.text, isNotNull);
      expect(result.textSubtle, isNotNull);
      expect(result.onActive, isNotNull);
      expect(result.border, isNotNull);
      expect(result.disabled, isNotNull);
      expect(result.disabledIcon, isNotNull);
      expect(result.accent, isNotNull);
      expect(result.overlay, isNotNull);
      expect(result.transparent, isNotNull);
    });

    test('lerp preserves widget properties from source', () {
      final accordionProps = VAccordionProperties(headerBorderRadius: 16);
      final a = VDefaultThemeProps(
        active: Colors.red,
        vAccordionProperties: accordionProps,
      );
      const b = VDefaultThemeProps(
        active: Colors.blue,
      );
      final result = a.lerp(b, 0.5) as VDefaultThemeProps;
      expect(result.vAccordionProperties, accordionProps);
    });

    test('copyWith overrides all widget properties', () {
      const original = VDefaultThemeProps(active: Colors.red);
      final copied = original.copyWith(
        vAppBarProperties: VAppBarProperties(),
        vAvatarProperties: VAvatarProperties(),
        vBannerProperties: VBannerProperties(),
        vBottomNavBarProperties: VBottomNavBarProperties(),
        vButtonProperties: VButtonProperties(),
        vChipsRemovableProperties: VChipsRemovableProperties(),
        vChipsSelectionProperties: VChipsSelectionProperties(),
        vComboboxProperties: VComboboxProperties(),
        vContentCardProperties: VContentCardProperties(),
        vDividerProperties: VDividerProperties(),
        vDropdownIconProperties: VDropdownIconProperties(),
        vDropdownTextProperties: VDropdownTextProperties(),
        vFlagProperties: VFlagProperties(),
        vInputProperties: VInputProperties(),
        vLinkProperties: VLinkProperties(),
        vListItemProperties: VListItemProperties(),
        vNavDrawerProperties: VNavDrawerProperties(),
        vPanelProperties: VPanelProperties(),
        vProgressProperties: VProgressProperties(),
        vSelectProperties: VSelectProperties(),
        vTabBarProperties: VTabBarProperties(),
        vToggleProperties: VToggleProperties(),
        vWizardProperties: VWizardProperties(),
      ) as VDefaultThemeProps;

      expect(copied.vAppBarProperties, isNotNull);
      expect(copied.vAvatarProperties, isNotNull);
      expect(copied.vBannerProperties, isNotNull);
      expect(copied.vBottomNavBarProperties, isNotNull);
      expect(copied.vButtonProperties, isNotNull);
      expect(copied.vChipsRemovableProperties, isNotNull);
      expect(copied.vChipsSelectionProperties, isNotNull);
      expect(copied.vComboboxProperties, isNotNull);
      expect(copied.vContentCardProperties, isNotNull);
      expect(copied.vDividerProperties, isNotNull);
      expect(copied.vDropdownIconProperties, isNotNull);
      expect(copied.vDropdownTextProperties, isNotNull);
      expect(copied.vFlagProperties, isNotNull);
      expect(copied.vInputProperties, isNotNull);
      expect(copied.vLinkProperties, isNotNull);
      expect(copied.vListItemProperties, isNotNull);
      expect(copied.vNavDrawerProperties, isNotNull);
      expect(copied.vPanelProperties, isNotNull);
      expect(copied.vProgressProperties, isNotNull);
      expect(copied.vSelectProperties, isNotNull);
      expect(copied.vTabBarProperties, isNotNull);
      expect(copied.vToggleProperties, isNotNull);
      expect(copied.vWizardProperties, isNotNull);
    });

    test('copyWith overrides all color fields', () {
      const original = VDefaultThemeProps();
      final copied = original.copyWith(
        active: Colors.red,
        activeHover: Colors.blue,
        activePressed: Colors.green,
        subtle: Colors.grey,
        activeSubtle: Colors.orange,
        surface1: Colors.white,
        surface2: Colors.black,
        surface3: Colors.purple,
        surfaceHighlight: Colors.yellow,
        surfaceLowlight: Colors.brown,
        text: Colors.black,
        textSubtle: Colors.grey,
        onActive: Colors.white,
        border: Colors.black,
        disabled: Colors.grey,
        disabledIcon: Colors.grey,
        accent: Colors.pink,
        overlay: Colors.black54,
        transparent: Colors.transparent,
      ) as VDefaultThemeProps;

      expect(copied.active, Colors.red);
      expect(copied.activeHover, Colors.blue);
      expect(copied.activePressed, Colors.green);
      expect(copied.subtle, Colors.grey);
      expect(copied.activeSubtle, Colors.orange);
      expect(copied.surface1, Colors.white);
      expect(copied.surface2, Colors.black);
      expect(copied.surface3, Colors.purple);
      expect(copied.surfaceHighlight, Colors.yellow);
      expect(copied.surfaceLowlight, Colors.brown);
      expect(copied.text, Colors.black);
      expect(copied.textSubtle, Colors.grey);
      expect(copied.onActive, Colors.white);
      expect(copied.border, Colors.black);
      expect(copied.disabled, Colors.grey);
      expect(copied.disabledIcon, Colors.grey);
      expect(copied.accent, Colors.pink);
      expect(copied.overlay, Colors.black54);
      expect(copied.transparent, Colors.transparent);
    });
  });

  group('VAltThemeProps', () {
    test('copyWith returns new instance with overridden fields', () {
      const original = VAltThemeProps(
        active: Colors.red,
        activeHover: Colors.blue,
      );
      final copied = original.copyWith(
        active: Colors.amber,
      ) as VAltThemeProps;
      expect(copied.active, Colors.amber);
      expect(copied.activeHover, Colors.blue);
    });

    test('copyWith with no arguments returns equivalent instance', () {
      const original = VAltThemeProps(
        active: Colors.red,
        text: Colors.black,
      );
      final copied = original.copyWith() as VAltThemeProps;
      expect(copied.active, Colors.red);
      expect(copied.text, Colors.black);
    });

    test('lerp returns this when other is null', () {
      const props = VAltThemeProps(active: Colors.red);
      final result = props.lerp(null, 0.5);
      expect(identical(result, props), isTrue);
    });

    test('lerp interpolates colors at t=0', () {
      const a = VAltThemeProps(active: Colors.red, text: Colors.black);
      const b = VAltThemeProps(active: Colors.blue, text: Colors.white);
      final result = a.lerp(b, 0.0) as VAltThemeProps;
      expect(result.active?.value, Colors.red.value);
      expect(result.text?.value, Colors.black.value);
    });

    test('lerp interpolates colors at t=1', () {
      const a = VAltThemeProps(active: Colors.red, text: Colors.black);
      const b = VAltThemeProps(active: Colors.blue, text: Colors.white);
      final result = a.lerp(b, 1.0) as VAltThemeProps;
      expect(result.active?.value, Colors.blue.value);
      expect(result.text?.value, Colors.white.value);
    });

    test('lerp interpolates all colors at t=0.5', () {
      const a = VAltThemeProps(
        active: Color(0xFF000000),
        activeHover: Color(0xFF000000),
        activePressed: Color(0xFF000000),
        subtle: Color(0xFF000000),
        activeSubtle: Color(0xFF000000),
        surface1: Color(0xFF000000),
        surface2: Color(0xFF000000),
        surface3: Color(0xFF000000),
        surfaceHighlight: Color(0xFF000000),
        surfaceLowlight: Color(0xFF000000),
        text: Color(0xFF000000),
        textSubtle: Color(0xFF000000),
        onActive: Color(0xFF000000),
        border: Color(0xFF000000),
        disabled: Color(0xFF000000),
        disabledIcon: Color(0xFF000000),
        accent: Color(0xFF000000),
        overlay: Color(0xFF000000),
        transparent: Color(0xFF000000),
      );
      const b = VAltThemeProps(
        active: Color(0xFFFFFFFF),
        activeHover: Color(0xFFFFFFFF),
        activePressed: Color(0xFFFFFFFF),
        subtle: Color(0xFFFFFFFF),
        activeSubtle: Color(0xFFFFFFFF),
        surface1: Color(0xFFFFFFFF),
        surface2: Color(0xFFFFFFFF),
        surface3: Color(0xFFFFFFFF),
        surfaceHighlight: Color(0xFFFFFFFF),
        surfaceLowlight: Color(0xFFFFFFFF),
        text: Color(0xFFFFFFFF),
        textSubtle: Color(0xFFFFFFFF),
        onActive: Color(0xFFFFFFFF),
        border: Color(0xFFFFFFFF),
        disabled: Color(0xFFFFFFFF),
        disabledIcon: Color(0xFFFFFFFF),
        accent: Color(0xFFFFFFFF),
        overlay: Color(0xFFFFFFFF),
        transparent: Color(0xFFFFFFFF),
      );
      final result = a.lerp(b, 0.5) as VAltThemeProps;
      expect(result.active, isNotNull);
      expect(result.activeHover, isNotNull);
      expect(result.activePressed, isNotNull);
      expect(result.subtle, isNotNull);
      expect(result.activeSubtle, isNotNull);
      expect(result.surface1, isNotNull);
      expect(result.surface2, isNotNull);
      expect(result.surface3, isNotNull);
      expect(result.surfaceHighlight, isNotNull);
      expect(result.surfaceLowlight, isNotNull);
      expect(result.text, isNotNull);
      expect(result.textSubtle, isNotNull);
      expect(result.onActive, isNotNull);
      expect(result.border, isNotNull);
      expect(result.disabled, isNotNull);
      expect(result.disabledIcon, isNotNull);
      expect(result.accent, isNotNull);
      expect(result.overlay, isNotNull);
      expect(result.transparent, isNotNull);
    });

    test('lerp preserves widget properties from source', () {
      final accordionProps = VAccordionProperties(headerBorderRadius: 16);
      final a = VAltThemeProps(
        active: Colors.red,
        vAccordionProperties: accordionProps,
      );
      const b = VAltThemeProps(active: Colors.blue);
      final result = a.lerp(b, 0.5) as VAltThemeProps;
      expect(result.vAccordionProperties, accordionProps);
    });

    test('copyWith overrides all widget properties', () {
      const original = VAltThemeProps(active: Colors.red);
      final copied = original.copyWith(
        vAccordionProperties: VAccordionProperties(),
        vAppBarProperties: VAppBarProperties(),
        vAvatarProperties: VAvatarProperties(),
        vBannerProperties: VBannerProperties(),
        vBottomNavBarProperties: VBottomNavBarProperties(),
        vButtonProperties: VButtonProperties(),
        vChipsRemovableProperties: VChipsRemovableProperties(),
        vChipsSelectionProperties: VChipsSelectionProperties(),
        vComboboxProperties: VComboboxProperties(),
        vContentCardProperties: VContentCardProperties(),
        vDividerProperties: VDividerProperties(),
        vDropdownIconProperties: VDropdownIconProperties(),
        vDropdownTextProperties: VDropdownTextProperties(),
        vFlagProperties: VFlagProperties(),
        vInputProperties: VInputProperties(),
        vLinkProperties: VLinkProperties(),
        vListItemProperties: VListItemProperties(),
        vNavDrawerProperties: VNavDrawerProperties(),
        vPanelProperties: VPanelProperties(),
        vProgressProperties: VProgressProperties(),
        vSelectProperties: VSelectProperties(),
        vTabBarProperties: VTabBarProperties(),
        vToggleProperties: VToggleProperties(),
        vWizardProperties: VWizardProperties(),
      ) as VAltThemeProps;

      expect(copied.vAccordionProperties, isNotNull);
      expect(copied.vAppBarProperties, isNotNull);
      expect(copied.vAvatarProperties, isNotNull);
    });

    test('copyWith overrides all color fields', () {
      const original = VAltThemeProps();
      final copied = original.copyWith(
        active: Colors.red,
        activeHover: Colors.blue,
        activePressed: Colors.green,
        subtle: Colors.grey,
        activeSubtle: Colors.orange,
        surface1: Colors.white,
        surface2: Colors.black,
        surface3: Colors.purple,
        surfaceHighlight: Colors.yellow,
        surfaceLowlight: Colors.brown,
        text: Colors.black,
        textSubtle: Colors.grey,
        onActive: Colors.white,
        border: Colors.black,
        disabled: Colors.grey,
        disabledIcon: Colors.grey,
        accent: Colors.pink,
        overlay: Colors.black54,
        transparent: Colors.transparent,
      ) as VAltThemeProps;

      expect(copied.active, Colors.red);
      expect(copied.activeHover, Colors.blue);
      expect(copied.text, Colors.black);
    });
  });

  group('VMessageColorSet', () {
    test('copyWith returns new instance with overridden fields', () {
      const original = VMessageColorSet(
        normalColor: Colors.red,
        positiveSurface: Colors.green,
      );
      final copied = original.copyWith(
        normalColor: Colors.blue,
      ) as VMessageColorSet;
      expect(copied.normalColor, Colors.blue);
      expect(copied.positiveSurface, Colors.green);
    });

    test('copyWith with no arguments returns equivalent instance', () {
      const original = VMessageColorSet(
        normalColor: Colors.red,
      );
      final copied = original.copyWith() as VMessageColorSet;
      expect(copied.normalColor, Colors.red);
    });

    test('lerp returns this when other is null', () {
      const props = VMessageColorSet(normalColor: Colors.red);
      final result = props.lerp(null, 0.5);
      expect(identical(result, props), isTrue);
    });

    test('lerp interpolates colors at t=0', () {
      const a = VMessageColorSet(normalColor: Colors.red);
      const b = VMessageColorSet(normalColor: Colors.blue);
      final result = a.lerp(b, 0.0) as VMessageColorSet;
      expect(result.normalColor?.value, Colors.red.value);
    });

    test('lerp interpolates colors at t=1', () {
      const a = VMessageColorSet(normalColor: Colors.red);
      const b = VMessageColorSet(normalColor: Colors.blue);
      final result = a.lerp(b, 1.0) as VMessageColorSet;
      expect(result.normalColor?.value, Colors.blue.value);
    });

    test('lerp interpolates all color fields at t=0.5', () {
      const a = VMessageColorSet(
        normalColor: Color(0xFF000000),
        positiveSurface: Color(0xFF000000),
        positiveGraphics: Color(0xFF000000),
        positiveText: Color(0xFF000000),
        warningSurface: Color(0xFF000000),
        warningGraphics: Color(0xFF000000),
        warningText: Color(0xFF000000),
        negativeSurfaceHighLight: Color(0xFF000000),
        negativeSurfaceLowLight: Color(0xFF000000),
        negativeSurface: Color(0xFF000000),
        negativeGraphics: Color(0xFF000000),
        negativeTextHover: Color(0xFF000000),
        negativeText: Color(0xFF000000),
        negativeTextPressed: Color(0xFF000000),
        infoSurface: Color(0xFF000000),
        infoGraphics: Color(0xFF000000),
        infoText: Color(0xFF000000),
        surface2: Color(0xFF000000),
        transparent: Color(0xFF000000),
        subtleText: Color(0xFF000000),
        defaultText: Color(0xFF000000),
        errorBorderColor: Color(0xFF000000),
      );
      const b = VMessageColorSet(
        normalColor: Color(0xFFFFFFFF),
        positiveSurface: Color(0xFFFFFFFF),
        positiveGraphics: Color(0xFFFFFFFF),
        positiveText: Color(0xFFFFFFFF),
        warningSurface: Color(0xFFFFFFFF),
        warningGraphics: Color(0xFFFFFFFF),
        warningText: Color(0xFFFFFFFF),
        negativeSurfaceHighLight: Color(0xFFFFFFFF),
        negativeSurfaceLowLight: Color(0xFFFFFFFF),
        negativeSurface: Color(0xFFFFFFFF),
        negativeGraphics: Color(0xFFFFFFFF),
        negativeTextHover: Color(0xFFFFFFFF),
        negativeText: Color(0xFFFFFFFF),
        negativeTextPressed: Color(0xFFFFFFFF),
        infoSurface: Color(0xFFFFFFFF),
        infoGraphics: Color(0xFFFFFFFF),
        infoText: Color(0xFFFFFFFF),
        surface2: Color(0xFFFFFFFF),
        transparent: Color(0xFFFFFFFF),
        subtleText: Color(0xFFFFFFFF),
        defaultText: Color(0xFFFFFFFF),
        errorBorderColor: Color(0xFFFFFFFF),
      );
      final result = a.lerp(b, 0.5) as VMessageColorSet;
      expect(result.normalColor, isNotNull);
      expect(result.positiveSurface, isNotNull);
      expect(result.positiveGraphics, isNotNull);
      expect(result.positiveText, isNotNull);
      expect(result.warningSurface, isNotNull);
      expect(result.warningGraphics, isNotNull);
      expect(result.warningText, isNotNull);
      expect(result.negativeSurfaceHighLight, isNotNull);
      expect(result.negativeSurfaceLowLight, isNotNull);
      expect(result.negativeSurface, isNotNull);
      expect(result.negativeGraphics, isNotNull);
      expect(result.negativeTextHover, isNotNull);
      expect(result.negativeText, isNotNull);
      expect(result.negativeTextPressed, isNotNull);
      expect(result.infoSurface, isNotNull);
      expect(result.infoGraphics, isNotNull);
      expect(result.infoText, isNotNull);
      expect(result.surface2, isNotNull);
      expect(result.transparent, isNotNull);
      expect(result.subtleText, isNotNull);
      expect(result.defaultText, isNotNull);
      expect(result.errorBorderColor, isNotNull);
    });

    test('copyWith overrides all fields', () {
      const original = VMessageColorSet();
      final copied = original.copyWith(
        normalColor: Colors.red,
        positiveSurface: Colors.green,
        positiveGraphics: Colors.green,
        positiveText: Colors.green,
        warningSurface: Colors.yellow,
        warningGraphics: Colors.yellow,
        warningText: Colors.yellow,
        negativeSurfaceHighLight: Colors.red,
        negativeSurfaceLowLight: Colors.red,
        negativeSurface: Colors.red,
        negativeGraphics: Colors.red,
        negativeTextHover: Colors.red,
        negativeText: Colors.red,
        negativeTextPressed: Colors.red,
        infoSurface: Colors.blue,
        infoGraphics: Colors.blue,
        infoText: Colors.blue,
        surface2: Colors.grey,
        transparent: Colors.transparent,
        subtleText: Colors.grey,
        defaultText: Colors.black,
        errorBorderColor: Colors.red,
      ) as VMessageColorSet;
      expect(copied.normalColor, Colors.red);
      expect(copied.positiveSurface, Colors.green);
      expect(copied.errorBorderColor, Colors.red);
    });
  });

  group('Property classes defaults', () {
    test('VAccordionProperties has correct defaults', () {
      final p = VAccordionProperties();
      expect(p.headerBorderRadius, 8);
      expect(p.subtleBorderRadius, 8);
      expect(p.borderRadius, 8);
    });

    test('VAppBarProperties has correct defaults', () {
      final p = VAppBarProperties();
      expect(p.elevation, 1.0);
      expect(p.buttonOpacity, 1.0);
      expect(p.borderRadius, 0.0);
    });

    test('VAvatarProperties has correct defaults', () {
      final p = VAvatarProperties();
      expect(p.radius, 20.0);
      expect(p.borderRadius, 100.0);
    });

    test('VBannerProperties has correct defaults', () {
      final p = VBannerProperties();
      expect(p.borderRadius, 0.0);
      expect(p.boxShadowSpreadRadius, 0.0);
      expect(p.boxShadowBlurRadius, 0.0);
    });

    test('VButtonProperties has correct defaults', () {
      final p = VButtonProperties();
      expect(p.elevation, 0.0);
      expect(p.minimumSize, const Size(0, 46));
      expect(p.borderRadiusActive, 8.0);
      expect(p.borderRadiusDisabled, 8.0);
    });

    test('VContentCardProperties has correct defaults', () {
      final p = VContentCardProperties();
      expect(p.borderRadius, 13.0);
      expect(p.elevation, 0.0);
    });

    test('VToggleProperties has correct defaults', () {
      final p = VToggleProperties();
      expect(p.borderRadius, 8);
      expect(p.height, 40);
      expect(p.minimumWidth, 44);
    });

    test('VWizardProperties has correct defaults', () {
      final p = VWizardProperties();
      expect(p.borderRadius, 20);
    });

    test('VDividerProperties has correct defaults', () {
      final p = VDividerProperties();
      expect(p.thickness, 1.0);
    });

    test('VInputProperties has correct defaults', () {
      final p = VInputProperties();
      expect(p.trackRadius, 7.0);
      expect(p.borderRadius, 8.0);
      expect(p.inputContainerHeight, 46.0);
    });

    test('VListItemProperties has correct defaults', () {
      final p = VListItemProperties();
      expect(p.borderRadius, 0.0);
    });

    test('VNavDrawerProperties has correct defaults', () {
      final p = VNavDrawerProperties();
      expect(p.borderRadius, 0.0);
    });

    test('VPanelProperties has correct defaults', () {
      final p = VPanelProperties();
      expect(p.borderRadius, 0.0);
    });

    test('VProgressProperties has correct defaults', () {
      final p = VProgressProperties();
      expect(p.linearRadius, 4.0);
      expect(p.circularSize, 70.0);
    });

    test('VSelectProperties has correct defaults', () {
      final p = VSelectProperties();
      expect(p.buttonHeight, 46.0);
      expect(p.borderRadius, 8.0);
      expect(p.dropDownElevation, 8.0);
      expect(p.dropDownBorderRadius, 8.0);
    });

    test('VTabBarProperties has correct defaults', () {
      final p = VTabBarProperties();
      expect(p.indicatorWeight, 2.0);
    });

    test('VDropdownIconProperties has correct defaults', () {
      final p = VDropdownIconProperties();
      expect(p.dropdownBorderRadius, 8.0);
      expect(p.bigIconSize, 72.0);
      expect(p.defaultIconSize, 46.0);
    });

    test('VDropdownTextProperties has correct defaults', () {
      final p = VDropdownTextProperties();
      expect(p.dropdownBorderRadius, 8.0);
      expect(p.borderRadius, 8.0);
      expect(p.bigButtonSize, 58.0);
      expect(p.defaultButtonSize, 46.0);
    });

    test('VChipsRemovableProperties has correct defaults', () {
      final p = VChipsRemovableProperties();
      expect(p.standardBorderRadius, 40.0);
      expect(p.compactBorderRadius, 6.0);
      expect(p.elevation, 0);
      expect(p.pressedElevation, 0);
    });

    test('VChipsSelectionProperties has correct defaults', () {
      final p = VChipsSelectionProperties();
      expect(p.borderRadius, 22.0);
      expect(p.elevation, 0);
      expect(p.pressedElevation, 0);
    });
  });
}
