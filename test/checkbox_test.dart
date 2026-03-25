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

import 'package:visa_nova_flutter/widgets/visa_checkbox/models/nested_indeterminate_controller.dart';
import 'package:visa_nova_flutter/widgets/visa_checkbox/models/nested_indeterminate_item.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
import 'package:flutter/semantics.dart';

// BEGIN visaNestedIndeterminateCheckboxes
class VNestedIndeterminateCheckboxes extends StatefulWidget {
  const VNestedIndeterminateCheckboxes({
    Key? key,
  }) : super(key: key);
  @override
  State<VNestedIndeterminateCheckboxes> createState() =>
      _VNestedIndeterminateCheckboxesState();
}

class _VNestedIndeterminateCheckboxesState
    extends State<VNestedIndeterminateCheckboxes> {
  List<VNestedCheckboxItem> selected = [];
  bool isError = false;
  NestedCheckboxController nestedCheckboxController =
      NestedCheckboxController();
  final List<VNestedCheckboxItem> nestedCheckboxList = [
    VNestedCheckboxItem(label: 'All Vegetable', id: "all_vegetable", children: [
      VNestedCheckboxItem(
          label: 'Common',
          id: "all_vegetable_common",
          children: [
            VNestedCheckboxItem(
                label: 'onions', id: "all_vegetable_common_onions"),
            VNestedCheckboxItem(
                label: 'bell peppers', id: "all_vegetable_common_bell_peppers"),
            VNestedCheckboxItem(
                label: 'mushrooms', id: "all_vegetable_common_mushrooms")
          ]),
      VNestedCheckboxItem(
          label: 'Uncommon',
          id: "all_vegetable_uncommon",
          children: [
            VNestedCheckboxItem(
                label: 'spinach', id: "all_vegetable_uncommon_spinach"),
            VNestedCheckboxItem(
                label: 'artichokes', id: "all_vegetable_uncommon_artichokes")
          ]),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child:
                Text('* = required', style: defaultVTheme.textStyles.uiLabel),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 5),
            child: Text(
              'Select pizza toppings',
              style: defaultVTheme.textStyles.uiLabel,
            ),
          ),
          NestedCheckbox(
            controller: nestedCheckboxController,
            options: nestedCheckboxList,
            selectedValues: selected,
            setSelectedValues: (List<VNestedCheckboxItem> newValues) {
              setState(() {
                if (isError) isError = false;
                selected = newValues;
              });
            },
            style: VCheckboxStyle(
                borderColor:
                    isError ? VColors.negativeGraphics : VColors.defaultActive),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              'Selected options: ${selected.map((object) => object.label).toList()}'),
          const SizedBox(
            height: 10,
          ),
          ExcludeSemantics(
            child: Visibility(
              visible: isError,
              child: Text.rich(TextSpan(
                  style: defaultVTheme.textStyles.uiLabel,
                  children: const [
                    WidgetSpan(
                      child: VIcon(
                        svgIcon: VIcons.errorTiny,
                        iconColor: VColors.negativeText,
                      ),
                    ),
                    WidgetSpan(
                        child: Padding(padding: EdgeInsets.only(left: 5))),
                    TextSpan(
                        text: checkboxError,
                        style: TextStyle(color: VColors.negativeText))
                  ])),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          VButton(
              child: Text("Submit",
                  style: defaultVTheme.textStyles.buttonMedium
                      .copyWith(color: VColors.defaultSurface1)),
              onPressed: () async {
                debugPrint('${nestedCheckboxController.getAllSelectedItems()}');
                if (selected.isEmpty) {
                  setState(() {
                    isError = true;
                  });
                  SemanticsService.announce(
                      "Error: Please select at least one pizza topping",
                      TextDirection.ltr);
                } else {
                  setState(() {
                    selected.clear();
                    isError = false;
                  });
                  nestedCheckboxController.clearValues();
                }
              })
        ]);
  }
}
// END

void main() {
  // ! This is Checkbox unit test
  testWidgets("Checkbox theme testing", (WidgetTester tester) async {
    // Checkbox theme
    var theme = VCheckboxStyle(
      borderColor: VColors.defaultActive,
      borderColorDisabled: VColors.defaultDisabled,
      borderColorError: VColors.negativeGraphics,
      fillColor: VColors.defaultActive,
      fillColorDisabled: VColors.disabled,
      fillColorPressed: VColors.defaultActivePressed,
      iconColor: VColors.negativeText,
      overlayColor: VColors.defaultSurfaceLowlight,
      textColor: VColors.defaultText,
      textColorDisabled: VColors.defaultDisabled,
      textColorError: VColors.negativeText,
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Material(
              child: VCheckboxValidationTile(
                validationButtonText: "Checkbox test",
                errorMessage: "Checkbox test",
                displayError: true,
                label: "Checkbox test",
                style: VCheckboxStyle(
                  borderColor: theme.borderColor,
                  borderColorDisabled: theme.borderColorDisabled,
                  borderColorError: theme.borderColorError,
                  fillColor: theme.fillColor,
                  fillColorDisabled: theme.fillColorDisabled,
                  fillColorPressed: theme.fillColorPressed,
                  iconColor: theme.iconColor,
                  overlayColor: theme.overlayColor,
                  textColor: theme.textColor,
                  textColorDisabled: theme.textColorDisabled,
                  textColorError: theme.textColorError,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // Find my widget
    final widgetFinder = find.byType(VCheckboxValidationTile);

    // Expect my widget uses the theme's color
    VCheckboxValidationTile checkbox = tester.widget(widgetFinder);
    expect(checkbox.style.borderColor, theme.borderColor);
    expect(checkbox.style.borderColorDisabled, theme.borderColorDisabled);
    expect(checkbox.style.borderColorError, theme.borderColorError);
    expect(checkbox.style.fillColor, theme.fillColor);
    expect(checkbox.style.fillColorDisabled, theme.fillColorDisabled);
    expect(checkbox.style.fillColorPressed, theme.fillColorPressed);
    expect(checkbox.style.iconColor, theme.iconColor);
    expect(checkbox.style.overlayColor, theme.overlayColor);
    expect(checkbox.style.textColor, theme.textColor);
    expect(checkbox.style.textColorDisabled, theme.textColorDisabled);
    expect(checkbox.style.textColorError, theme.textColorError);
  });

  //! This is Checkbox golden test

  testWidgets('Checkbox golden(snapshot) testing', (WidgetTester tester) async {
    // Build widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: RepaintBoundary(
          child: Center(
            child: SizedBox(
              width: 420,
              height: 200,
              child: Material(
                child: VCheckboxValidationTile(
                  style: VCheckboxStyle(
                    borderColor: VColors.defaultActive,
                    borderColorDisabled: VColors.defaultDisabled,
                    borderColorError: VColors.negativeGraphics,
                    fillColor: VColors.defaultActive,
                    fillColorDisabled: VColors.disabled,
                    fillColorPressed: VColors.defaultActivePressed,
                    iconColor: VColors.negativeText,
                    overlayColor: VColors.defaultSurfaceLowlight,
                    textColor: VColors.defaultText,
                    textColorDisabled: VColors.defaultDisabled,
                    textColorError: VColors.negativeText,
                  ),
                  validationButtonText: "Checkbox test",
                  errorMessage: "Checkbox test",
                  displayError: true,
                  label: "Checkbox test",
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // Take a snapshot of the widget.
    await expectLater(
      find.byType(VCheckboxValidationTile),
      matchesGoldenFile('goldens/checkbox.png'),
    );
  });

  test('VCheckboxStyle copyWith', () {
    const style = VCheckboxStyle(
      borderColor: Colors.red,
      borderColorDisabled: Colors.green,
      borderColorError: Colors.blue,
      fillColor: Colors.yellow,
      fillColorPressed: Colors.orange,
      fillColorDisabled: Colors.pink,
      iconColor: Colors.purple,
      iconColorError: Colors.brown,
      textColor: Colors.grey,
      textColorDisabled: Colors.cyan,
      textColorError: Colors.lime,
      overlayColor: Colors.indigo,
    );

    final copiedStyle = style.copyWith();

    expect(copiedStyle.borderColor, Colors.red);
    expect(copiedStyle.borderColorDisabled, Colors.green);
    expect(copiedStyle.borderColorError, Colors.blue);
    expect(copiedStyle.fillColor, Colors.yellow);
    expect(copiedStyle.fillColorPressed, Colors.orange);
    expect(copiedStyle.fillColorDisabled, Colors.pink);
    expect(copiedStyle.iconColor, Colors.purple);
    expect(copiedStyle.iconColorError, Colors.brown);
    expect(copiedStyle.textColor, Colors.grey);
    expect(copiedStyle.textColorDisabled, Colors.cyan);
    expect(copiedStyle.textColorError, Colors.lime);
    expect(copiedStyle.overlayColor, Colors.indigo);
  });

  test('VCheckboxStyle lerp', () {
    const style1 = VCheckboxStyle(
      borderColor: Colors.red,
      borderColorDisabled: Colors.green,
      borderColorError: Colors.blue,
      fillColor: Colors.yellow,
      fillColorPressed: Colors.orange,
      fillColorDisabled: Colors.pink,
      iconColor: Colors.purple,
      iconColorError: Colors.brown,
      textColor: Colors.grey,
      textColorDisabled: Colors.cyan,
      textColorError: Colors.lime,
      overlayColor: Colors.indigo,
    );

    const style2 = VCheckboxStyle(
      borderColor: Colors.purple,
      borderColorDisabled: Colors.orange,
      borderColorError: Colors.teal,
      fillColor: Colors.amber,
      fillColorPressed: Colors.lightGreen,
      fillColorDisabled: Colors.lightBlue,
      iconColor: Colors.deepPurple,
      iconColorError: Colors.deepOrange,
      textColor: Colors.blueGrey,
      textColorDisabled: Colors.deepOrangeAccent,
      textColorError: Colors.greenAccent,
      overlayColor: Colors.pinkAccent,
    );

    final lerped = style1.lerp(style2, 0.5);

    expect(lerped.borderColor, Color.lerp(Colors.red, Colors.purple, 0.5));
    expect(lerped.borderColorDisabled,
        Color.lerp(Colors.green, Colors.orange, 0.5));
    expect(lerped.borderColorError, Color.lerp(Colors.blue, Colors.teal, 0.5));
    expect(lerped.fillColor, Color.lerp(Colors.yellow, Colors.amber, 0.5));
    expect(lerped.fillColorPressed,
        Color.lerp(Colors.orange, Colors.lightGreen, 0.5));
    expect(lerped.fillColorDisabled,
        Color.lerp(Colors.pink, Colors.lightBlue, 0.5));
    expect(lerped.iconColor, Color.lerp(Colors.purple, Colors.deepPurple, 0.5));
    expect(lerped.iconColorError,
        Color.lerp(Colors.brown, Colors.deepOrange, 0.5));
    expect(lerped.textColor, Color.lerp(Colors.grey, Colors.blueGrey, 0.5));
    expect(lerped.textColorDisabled,
        Color.lerp(Colors.cyan, Colors.deepOrangeAccent, 0.5));
    expect(lerped.textColorError,
        Color.lerp(Colors.lime, Colors.greenAccent, 0.5));
    expect(
        lerped.overlayColor, Color.lerp(Colors.indigo, Colors.pinkAccent, 0.5));
  });

  testWidgets('VCheckboxTile test', (WidgetTester tester) async {
    // Create the widget
    VCheckboxTile checkboxTile = VCheckboxTile(
      title: "Test label",
      isChecked: false,
      style: const VCheckboxStyle(
        borderColor: Colors.red,
        borderColorDisabled: Colors.green,
        fillColor: Colors.blue,
        fillColorPressed: Colors.yellow,
        fillColorDisabled: Colors.orange,
        textColor: Colors.purple,
        textColorDisabled: Colors.brown,
        overlayColor: Colors.grey,
      ),
    );

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: checkboxTile,
        ),
      ),
    );

    // Verify the label text is present
    expect(find.text('Test label'), findsOneWidget);

    // Verify the initial state of checkbox
    expect(checkboxTile.isChecked, false);

    // Tap the checkbox
    await tester.tap(find.byType(VCheckboxTile));
    await tester.pumpAndSettle();

    // Verify the checkbox is checked after being tapped
    checkboxTile = tester.widget<VCheckboxTile>(find.byType(VCheckboxTile));
    expect(checkboxTile.isChecked, true);
  });

  testWidgets('VCheckboxTile build method with non-VDef',
      (WidgetTester tester) async {
    // Build the VCheckboxTile widget with a non-VDef value for vExt
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VCheckboxTile(
          style: const VCheckboxStyle(fillColor: VColors.alternateActive),
          title: "Test label",
          vExt: VAlt(),
        ),
      ),
    ));

    // Verify that the alternate color scheme was applied
    final checkboxTile =
        tester.widget<VCheckboxTile>(find.byType(VCheckboxTile));
    expect(checkboxTile.style?.fillColor, getAltColorScheme().active);
  });

  testWidgets(
      'VCheckboxTile applies defaultColorSchemeDark when theme brightness is dark and vExt is VDef',
      (WidgetTester tester) async {
    // Test with Brightness.dark and vExt is VDef
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: VCheckboxTile(
          style: const VCheckboxStyle(fillColor: VColors.defaultActiveDark),
          title: "Test label",
          vExt: VDef(),
        ),
      ),
    ));

    // Check if defaultColorSchemeDark is applied
    final checkboxTileDark =
        tester.widget<VCheckboxTile>(find.byType(VCheckboxTile));
    expect(checkboxTileDark.style?.fillColor,
        equals(getDefaultColorSchemeDark().active));
  });

  testWidgets(
      'VCheckboxTile applies altColorSchemeDark when theme brightness is dark and vExt is not VDef',
      (WidgetTester tester) async {
    // Test with Brightness.dark and vExt is not VDef
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: VCheckboxTile(
          style: const VCheckboxStyle(fillColor: VColors.alternateActiveDark),
          title: "Test label",
          vExt: VAlt(),
        ),
      ),
    ));

    // Check if altColorSchemeDark is applied
    final checkboxTileAltDark =
        tester.widget<VCheckboxTile>(find.byType(VCheckboxTile));
    expect(checkboxTileAltDark.style?.fillColor,
        equals(getAltColorSchemeDark().active));
  });

  testWidgets('VNestedCheckboxTile test', (WidgetTester tester) async {
    bool checkboxValue = false;

    // Create the widget
    VNestedCheckboxTile nestedCheckboxTile = VNestedCheckboxTile(
      label: 'Nested checkbox',
      value: checkboxValue,
      valueChanged: (bool value) {
        checkboxValue = value;
      },
      checkboxType: CheckboxType.child,
    );

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: nestedCheckboxTile,
        ),
      ),
    );

    // Verify the label text is present
    expect(find.text('Nested checkbox'), findsOneWidget);

    // Verify the initial state of checkbox
    expect(checkboxValue, false);

    // Tap the checkbox
    await tester.tap(find.byType(VNestedCheckboxTile));
    await tester.pumpAndSettle();

    // Verify the checkbox is checked after being tapped
    expect(checkboxValue, true);
  });

  testWidgets('VNestedCheckboxTile indeterminate state test',
      (WidgetTester tester) async {
    // Indeterminate state is null
    bool? checkboxValue;

    // Create the widget
    VNestedCheckboxTile nestedCheckboxTile = VNestedCheckboxTile(
      label: 'Nested checkbox',
      value: checkboxValue,
      valueChanged: (bool value) {
        checkboxValue = value;
      },
      checkboxType: CheckboxType.parent,
    );

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: nestedCheckboxTile,
        ),
      ),
    );

    // Verify the label text is present
    expect(find.text('Nested checkbox'), findsOneWidget);

    // Verify the initial state of checkbox
    expect(checkboxValue, null);

    // Tap the checkbox
    await tester.tap(find.byType(VNestedCheckboxTile));
    await tester.pumpAndSettle();

    // Verify the checkbox is checked after being tapped
    expect(checkboxValue, true);
  });

  testWidgets('VCheckboxValidationTile test', (WidgetTester tester) async {
    // Create the widget
    VCheckboxValidationTile checkboxValidationTile = VCheckboxValidationTile(
      label: 'Checkbox label',
      errorMessage: 'Error message',
      validationButtonText: 'Validate',
      style: const VCheckboxStyle(),
    );

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: checkboxValidationTile,
        ),
      ),
    );

    // Verify the label text is present
    expect(find.text('Checkbox label'), findsOneWidget);

    // Verify the initial state of checkbox
    expect(checkboxValidationTile.isChecked, false);

    // Tap the checkbox
    await tester.tap(find.byType(VMatCheckbox));
    await tester.pumpAndSettle();

    // Verify the checkbox is checked after being tapped
    expect(checkboxValidationTile.isChecked, true);

    // Tap the validation button
    await tester.tap(find.text('Validate'));
    await tester.pumpAndSettle();

    // Verify the displayError is false after validation button is pressed
    expect(checkboxValidationTile.displayError, false);
  });

  testWidgets('VCheckboxValidationTile validation test',
      (WidgetTester tester) async {
    bool isChecked = false;
    bool displayError = true;

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return VCheckboxValidationTile(
                label: 'Checkbox label',
                errorMessage: 'Error message',
                validationButtonText: 'Validate',
                style: const VCheckboxStyle(),
                isChecked: isChecked,
                displayError: displayError,
              );
            },
          ),
        ),
      ),
    );

    // Verify the initial state of checkbox
    expect(isChecked, false);

    // Tap the validation button
    await tester.tap(find.text('Validate'));
    await tester.pumpAndSettle();

    // Verify the displayError is true after validation button is pressed
    // and the checkbox is not checked
    expect(displayError, true);
  });

  testWidgets('Nested checkbox test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VNestedIndeterminateCheckboxes(),
        ),
      ),
    );

    // Verify the checkbox list is displayed
    expect(find.text('All Vegetable'), findsOneWidget);

    // Tap the submit button
    await tester.tap(find.text('Submit'));
    await tester.pump();
  });

  testWidgets(
      'VNestedIndeterminateCheckboxes allows to select and deselect items',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VNestedIndeterminateCheckboxes(),
        ),
      ),
    );

    // Tap on a parent checkbox item
    await tester.tap(find.text('All Vegetable'));
    await tester.pump();

    // Verify the parent and all its children items are selected
    expect(
        find.text(
            'Selected options: [onions, bell peppers, mushrooms, spinach, artichokes]'),
        findsOneWidget);

    // Tap on the parent item again to deselect
    await tester.tap(find.text('All Vegetable'));
    await tester.pump();

    // Verify all items are deselected
    expect(find.text('Selected options: []'), findsOneWidget);

    // Tap on a child checkbox item
    await tester.tap(find.text('onions'));
    await tester.pump();

    // Verify the child item is selected
    expect(find.text('Selected options: [onions]'), findsOneWidget);

    // Tap on a child checkbox item
    await tester.tap(find.text('onions'));
    await tester.pump();

    // Verify the child item is selected
    expect(find.text('Selected options: []'), findsOneWidget);

    // Tap on a parent checkbox item
    await tester.tap(find.text('Common'));
    await tester.pump();

    // Verify the child item is selected
    expect(find.text('Selected options: [onions, bell peppers, mushrooms]'),
        findsOneWidget);

    // Tap on a parent checkbox item
    await tester.tap(find.text('onions'));
    await tester.pump();

    // Verify the child item is selected
    expect(find.text('Selected options: [bell peppers, mushrooms]'),
        findsOneWidget);
  });

  // Coverage: VCheckboxStyle lerp
  test('VCheckboxStyle lerp', () {
    const a = VCheckboxStyle(
      borderColor: Colors.red,
    );
    const b = VCheckboxStyle(
      borderColor: Colors.blue,
    );
    final result = a.lerp(b, 0.5);
    expect(result, isA<VCheckboxStyle>());
  });

  test('VCheckboxStyle lerp with null returns this', () {
    const a = VCheckboxStyle(borderColor: Colors.red);
    final result = a.lerp(null, 0.5);
    expect(identical(result, a), isTrue);
  });

  // Coverage: VCheckboxTile alt theme
  testWidgets("VCheckboxTile with alt theme renders",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VCheckboxTile(
            title: "Alt Checkbox",
            isChecked: false,
            onChanged: (_) {},
            vExt: VAlt(),
          ),
        ),
      ),
    );
    expect(find.text("Alt Checkbox"), findsOneWidget);
  });

  // Coverage: VCheckboxTile with onChanged: null and isDisabled: false
  // triggers the fallback setState path (line 217)
  testWidgets(
      'VCheckboxTile with onChanged null and isDisabled false triggers fallback setState',
      (WidgetTester tester) async {
    final checkboxTile = VCheckboxTile(
      title: "Fallback Checkbox",
      isChecked: false,
      isDisabled: false,
      onChanged: null,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: checkboxTile,
        ),
      ),
    );

    // Verify initial unchecked state
    expect(checkboxTile.isChecked, false);

    // Tap the checkbox — since onChanged is null and isDisabled is false,
    // the fallback setState should set isChecked to the new value
    await tester.tap(find.byType(VMatCheckboxListTile));
    await tester.pumpAndSettle();

    // After tapping, isChecked should be true via the fallback setState
    expect(checkboxTile.isChecked, true);
  });

  // Coverage: NestedCheckbox with 2 leaf children —
  // select one child (parent becomes indeterminate), then select the other
  // (parent becomes fully selected). Covers _parentChanged and _childrenChanged.
  testWidgets(
      'NestedCheckbox with 2 leaf children: indeterminate then fully selected',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    List<VNestedCheckboxItem> selectedItems = [];

    final options = [
      VNestedCheckboxItem(
        label: 'Fruits',
        id: 'fruits',
        children: [
          VNestedCheckboxItem(label: 'Apple', id: 'apple'),
          VNestedCheckboxItem(label: 'Banana', id: 'banana'),
        ],
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                children: [
                  NestedCheckbox(
                    options: options,
                    setSelectedValues: (List<VNestedCheckboxItem> newValues) {
                      setState(() {
                        selectedItems = newValues;
                      });
                    },
                  ),
                  Text(
                      'Selected: ${selectedItems.map((e) => e.label).toList()}'),
                ],
              );
            },
          ),
        ),
      ),
    );

    // Verify initial state
    expect(find.text('Selected: []'), findsOneWidget);

    // Tap first child — parent should become indeterminate
    await tester.tap(find.text('Apple'));
    await tester.pump();
    expect(find.text('Selected: [Apple]'), findsOneWidget);

    // Tap second child — parent should become fully selected
    await tester.tap(find.text('Banana'));
    await tester.pump();
    expect(find.text('Selected: [Apple, Banana]'), findsOneWidget);

    // Deselect first child — parent should become indeterminate again
    await tester.tap(find.text('Apple'));
    await tester.pump();
    expect(find.text('Selected: [Banana]'), findsOneWidget);

    // Deselect second child — parent should become unselected
    await tester.tap(find.text('Banana'));
    await tester.pump();
    expect(find.text('Selected: []'), findsOneWidget);
  });

  // Coverage: NestedCheckbox with a sub-parent (grandchild) —
  // select a grandchild to test recursive _childrenChanged/_parentChanged paths.
  testWidgets(
      'NestedCheckbox with sub-parent: grandchild selection triggers recursive paths',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    List<VNestedCheckboxItem> selectedItems = [];
    final controller = NestedCheckboxController();

    final options = [
      VNestedCheckboxItem(
        label: 'All Animals',
        id: 'all_animals',
        children: [
          VNestedCheckboxItem(
            label: 'Mammals',
            id: 'mammals',
            children: [
              VNestedCheckboxItem(label: 'Dog', id: 'dog'),
              VNestedCheckboxItem(label: 'Cat', id: 'cat'),
            ],
          ),
          VNestedCheckboxItem(
            label: 'Birds',
            id: 'birds',
            children: [
              VNestedCheckboxItem(label: 'Eagle', id: 'eagle'),
            ],
          ),
        ],
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                children: [
                  Expanded(
                    child: NestedCheckbox(
                      controller: controller,
                      options: options,
                      selectedValues: selectedItems,
                      setSelectedValues:
                          (List<VNestedCheckboxItem> newValues) {
                        setState(() {
                          selectedItems = newValues;
                        });
                      },
                    ),
                  ),
                  Text(
                      'Selected: ${selectedItems.map((e) => e.label).toList()}'),
                ],
              );
            },
          ),
        ),
      ),
    );

    // Verify initial state
    expect(find.text('Selected: []'), findsOneWidget);

    // Select a grandchild (Dog) — Mammals becomes indeterminate, All Animals becomes indeterminate
    await tester.tap(find.text('Dog'));
    await tester.pump();
    expect(find.text('Selected: [Dog]'), findsOneWidget);

    // Select the other grandchild under Mammals (Cat) — Mammals becomes fully selected,
    // All Animals stays indeterminate (Birds still unselected)
    await tester.tap(find.text('Cat'));
    await tester.pump();
    expect(find.text('Selected: [Dog, Cat]'), findsOneWidget);

    // Select the only child under Birds (Eagle) — Birds becomes fully selected,
    // All Animals becomes fully selected
    await tester.tap(find.text('Eagle'));
    await tester.pump();
    expect(find.text('Selected: [Dog, Cat, Eagle]'), findsOneWidget);

    // Deselect a grandchild (Dog) — Mammals becomes indeterminate,
    // All Animals becomes indeterminate
    await tester.tap(find.text('Dog'));
    await tester.pump();
    expect(find.text('Selected: [Cat, Eagle]'), findsOneWidget);

    // Select the root parent (All Animals) — should select all descendants
    await tester.tap(find.text('All Animals'));
    await tester.pump();
    expect(find.text('Selected: [Cat, Eagle, Dog]'), findsOneWidget);

    // Deselect the root parent (All Animals) — should deselect all descendants
    await tester.tap(find.text('All Animals'));
    await tester.pump();
    expect(find.text('Selected: []'), findsOneWidget);
  });
}
