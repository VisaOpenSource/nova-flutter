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

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

void main() {
  test('VAccordionStyle copyWith and lerp testing', () {
    // Create an initial style
    var style = const VAccordionStyle(
      headerTextColorDefault: Colors.blue,
      headerOpenColor: Colors.red,
      iconColorDefault: Colors.green,
      headerBorderRadius: 1.0,
      headerTextStyle: TextStyle(color: Colors.yellow),
    );

    // Test copyWith with non-null values
    var copiedStyle = style.copyWith();
    expect(copiedStyle.headerTextColorDefault, Colors.blue);
    expect(
      copiedStyle.headerOpenColor,
      Colors.red,
    );
    expect(
      copiedStyle.iconColorDefault,
      Colors.green,
    );
    expect(copiedStyle.headerBorderRadius, 1.0);
    expect(copiedStyle.headerTextStyle?.color, Colors.yellow);

    // Create another style for lerp testing
    var anotherStyle = const VAccordionStyle(
      headerTextColorDefault: Colors.black,
      headerOpenColor: Colors.white,
      iconColorDefault: Colors.grey,
      headerBorderRadius: 3.0,
      headerTextStyle: TextStyle(color: Colors.teal),
    );

    // Test lerp
    var lerpedStyle = style.lerp(anotherStyle, 0.5);
    expect(lerpedStyle.headerTextColorDefault,
        Color.lerp(Colors.blue, Colors.black, 0.5));
    expect(
        lerpedStyle.headerOpenColor, Color.lerp(Colors.red, Colors.white, 0.5));
    expect(lerpedStyle.iconColorDefault,
        Color.lerp(Colors.green, Colors.grey, 0.5));
    expect(lerpedStyle.headerBorderRadius,
        2.0); // Changed to expect the mid-point value
    expect(lerpedStyle.headerTextStyle, isNotNull);
  });

  testWidgets('VAccordion builds correctly in initial state',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: Text('Test Body'),
          isEnabled: true,
          isSubtle: true,
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'),
        findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });
  testWidgets('VAccordion dark', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: const VAccordion(
          title: 'Test Title',
          body: Text('Test Body'),
          isEnabled: true,
          isSubtle: true,
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'),
        findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });
  testWidgets('VAccordion alt', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: const Text('Test Body'),
          isEnabled: true,
          isSubtle: true,
          vExt: VAlt(),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'),
        findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });
  testWidgets('VAccordion disabled', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: Text('Test Body'),
          isEnabled: false,
          isSubtle: true,
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'),
        findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });

  testWidgets('VAccordion subtle', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: Text('Test Body'),
          isEnabled: true,
          isSubtle: false,
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'),
        findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });

  testWidgets('VAccordion subtle alt', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: const Text('Test Body'),
          isEnabled: true,
          isSubtle: false,
          vExt: VAlt(),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'),
        findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });

  testWidgets('VAccordion disabled subtle', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: Text('Test Body'),
          isEnabled: false,
          isSubtle: false,
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'),
        findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });

  testWidgets('VAccordion disabled subtle alt', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: const Text('Test Body'),
          isEnabled: false,
          isSubtle: false,
          vExt: VAlt(),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'),
        findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });

  testWidgets('VAccordion subtle disabled', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: Text('Test Body'),
          isEnabled: false,
          isSubtle: true,
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'),
        findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });

  testWidgets('VAccordion subtle disabled alt', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: const Text('Test Body'),
          isEnabled: false,
          isSubtle: true,
          vExt: VAlt(),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'),
        findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });

  testWidgets('VAccordion disabled subtle disabled alt',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: const Text('Test Body'),
          isEnabled: false,
          isSubtle: false,
          vExt: VAlt(),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'),
        findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });

  testWidgets('Test if the widget and its children are rendered',
      (WidgetTester tester) async {
    // Build and render your widget.
    await tester.pumpWidget(
      MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: const Text('Test Body'),
          isEnabled: false,
          isSubtle: false,
          vExt: VAlt(),
        ),
      ),
    );

    expect(find.byType(Container), findsWidgets);
    expect(find.byType(Card), findsWidgets);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(InkWell), findsOneWidget);
  });

  testWidgets('VAccordion should toggle body visibility when tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: 'Test title',
          body: Column(
            children: <Widget>[
              Text('Line 1'),
              Text('Line 2'),
              Text('Line 3'),
            ],
          ),
        ),
      ),
    ));

    // Initially the body should not be visible.
    expect(find.text('Line 1'), findsNothing);
    expect(find.text('Line 2'), findsNothing);
    expect(find.text('Line 3'), findsNothing);

    // Tap the VAccordion to open it.
    await tester.tap(find.text('Test title'));
    await tester.pumpAndSettle();

    // Now the body should be visible.
    expect(find.text('Line 1'), findsOneWidget);
    expect(find.text('Line 2'), findsOneWidget);
    expect(find.text('Line 3'), findsOneWidget);

    // Tap the VAccordion again to close it.
    await tester.tap(find.text('Test title'));
    await tester.pumpAndSettle();

    // The body should not be visible again.
    expect(find.text('Line 1'), findsNothing);
    expect(find.text('Line 2'), findsNothing);
    expect(find.text('Line 3'), findsNothing);
  });

  testWidgets(
      'VAccordion should render title, leading icon and trailing widget correctly',
      (WidgetTester tester) async {
    const title = 'Test title';
    const leadingSvgIcon = VIcons.cloudTiny; // use your preferred SVG icon
    const trailingWidget =
        Icon(Icons.more_vert); // replace with your actual trailing widget
    const body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          leadingSvgIcon: leadingSvgIcon,
          trailing: trailingWidget,
          body: body,
        ),
      ),
    ));

    // Check that the title, leading icon, and trailing widget are rendered.
    expect(find.text(title), findsOneWidget);
    expect(find.byType(VIcon), findsWidgets); // Check that VIcon is present
    expect(find.byIcon(Icons.more_vert), findsOneWidget);
  });

  testWidgets('VAccordion should render title correctly',
      (WidgetTester tester) async {
    const title = 'Test title';
    const leadingSvgIcon = VIcons.cloudTiny; // use your preferred SVG icon
    const trailingWidget =
        Icon(Icons.more_vert); // replace with your actual trailing widget
    const body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          leadingSvgIcon: leadingSvgIcon,
          trailing: trailingWidget,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Check that the title is within an Expanded widget.
    final Finder expandedFinder = find.byType(Expanded);
    final Finder textFinder = find.text(title);
    final Finder expandedTextFinder =
        find.descendant(of: expandedFinder, matching: textFinder);
    expect(expandedTextFinder, findsOneWidget);
  });

  testWidgets('VAccordion should render title text with correct style',
      (WidgetTester tester) async {
    const title = 'Test title';
    const isSubtle = false; // change this as per your test requirement
    const leadingSvgIcon = VIcons.cloudTiny; // use your preferred SVG icon
    const trailingWidget =
        Icon(Icons.more_vert); // replace with your actual trailing widget
    const body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          leadingSvgIcon: leadingSvgIcon,
          trailing: trailingWidget,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Check the TextStyle of the Text widget
    final Text textWidget = tester.widget<Text>(find.text(title));
    final TextStyle? textStyle = textWidget.style;

    // Add your asserts for non-subtle style here
    expect(textStyle?.color, VColors.defaultText);
    // Add more assertions as needed
  });

  testWidgets('VAccordion should render title text with correct color',
      (WidgetTester tester) async {
    const title = 'Test title';
    const isSubtle = false; // change this as per your test requirement
    const leadingSvgIcon = VIcons.cloudTiny; // use your preferred SVG icon
    const trailingWidget =
        Icon(Icons.more_vert); // replace with your actual trailing widget
    const body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          leadingSvgIcon: leadingSvgIcon,
          trailing: trailingWidget,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Check the TextStyle color of the Text widget
    final Text textWidget = tester.widget<Text>(find.text(title));
    final Color? textStyleColor = textWidget.style?.color;

    // Check color of headerBoldTextStyleBold or bodyTextStyle
    const Color expectedColor = VColors.defaultText;
    expect(textStyleColor, expectedColor);
  });

  testWidgets('VAccordion should render title text with correct font size',
      (WidgetTester tester) async {
    const title = 'Test title';
    const isSubtle = false; // change this as per your test requirement
    const leadingSvgIcon = VIcons.cloudTiny; // use your preferred SVG icon
    const trailingWidget =
        Icon(Icons.more_vert); // replace with your actual trailing widget
    const body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          leadingSvgIcon: leadingSvgIcon,
          trailing: trailingWidget,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Check the TextStyle fontSize of the Text widget
    final Text textWidget = tester.widget<Text>(find.text(title));
    final double? textStyleFontSize = textWidget.style?.fontSize;

    // Check fontSize of headerBoldTextStyleBold or bodyTextStyle
    const double expectedFontSize = 16.0;
    expect(textStyleFontSize, expectedFontSize);
  });

  testWidgets('VAccordion should render title text with correct style',
      (WidgetTester tester) async {
    const title = 'Test Title';
    const isSubtle = false;
    const body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Check the TextStyle of the Text widget
    final Text textWidget = tester.widget<Text>(find.text(title));
    final TextStyle? textStyle = textWidget.style;

    // Add your asserts for non-subtle style here

    expect(textStyle?.color, VColors.defaultText);
    // Add more assertions as needed
  });

  testWidgets('VAccordion should render title text with correct color',
      (WidgetTester tester) async {
    const title = 'Test Title';
    const isSubtle = false;
    const body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Check the TextStyle color of the Text widget
    final Text textWidget = tester.widget<Text>(find.text(title));
    final Color? textStyleColor = textWidget.style?.color;

    // Check color of headerBoldTextStyleBold or bodyTextStyle
    const Color expectedColor = VColors.defaultText;
    expect(textStyleColor, expectedColor);
  });

  testWidgets('VAccordion should render title text with correct color',
      (WidgetTester tester) async {
    const title = 'Test Title';
    const isSubtle = true;
    const body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Check the TextStyle color of the Text widget
    final Text textWidget = tester.widget<Text>(find.text(title));
    final Color? textStyleColor = textWidget.style?.color;

    // Check color of headerBoldTextStyleBold or bodyTextStyle
    const Color expectedColor = VColors.defaultActive;
    expect(textStyleColor, expectedColor);
  });

  testWidgets(
      'VAccordion should render title text with correct color when isSubtle is false and isEnabled is false',
      (WidgetTester tester) async {
    const title = 'Test Title';
    const isSubtle = false;
    const isEnabled = false;
    const body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          isEnabled: isEnabled,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Check the TextStyle color of the Text widget
    final Text textWidget = tester.widget<Text>(find.text(title));
    final Color? textStyleColor = textWidget.style?.color;

    // Check the color when the widget is disabled and not subtle
    final Color expectedColor = VColors.defaultDisabled;
    expect(textStyleColor, expectedColor);
  });

  testWidgets(
      'VAccordion should render title text with correct color when isSubtle is true and isDown is true',
      (WidgetTester tester) async {
    const title = 'Test Title';
    const isSubtle = true;
    const isEnabled =
        true; // Assuming that the widget must be enabled for isDown to be true
    const body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          isEnabled: isEnabled,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Simulate pressing down on the widget and then releasing it
    await tester.press(find.text(title));
    await tester.pump();

    // Check the TextStyle color of the Text widget
    final Text textWidgetAfterPress = tester.widget<Text>(find.text(title));
    final Color? textStyleColorAfterPress = textWidgetAfterPress.style?.color;

    // Check the color when the widget is subtle and pressed down
    const Color expectedColorAfterPress = VColors.defaultActivePressed;
    expect(textStyleColorAfterPress, expectedColorAfterPress);

    await tester.press(find.text(title));

    // Check the TextStyle color of the Text widget after release
    final Text textWidgetAfterRelease = tester.widget<Text>(find.text(title));
    final Color? textStyleColorAfterRelease =
        textWidgetAfterRelease.style?.color;

    // Add your expected color after release
    const Color expectedColorAfterRelease =
        VColors.defaultActivePressed; // Replace with your actual color
    expect(textStyleColorAfterRelease, expectedColorAfterRelease);
  });

  testWidgets(
      'VAccordion should render title text with correct color when isSubtle is true and isDown is true',
      (WidgetTester tester) async {
    const title = 'Test Title';
    const isSubtle = true;
    const isEnabled =
        true; // Assuming that the widget must be enabled for isDown to be true
    const body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          isEnabled: isEnabled,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Simulate pressing down on the widget
    await tester.press(find.text(title));
    await tester.pump();

    // Check the TextStyle color of the Text widget
    final Text textWidgetAfterPress = tester.widget<Text>(find.text(title));
    final Color? textStyleColorAfterPress = textWidgetAfterPress.style?.color;

    // Check the color when the widget is subtle and pressed down
    const Color expectedColorAfterPress = VColors.defaultActivePressed;
    expect(textStyleColorAfterPress, expectedColorAfterPress);
  });

  testWidgets(
      'VAccordion should render title text with correct color when isSubtle is true and isEnabled is false',
      (WidgetTester tester) async {
    const title = 'Test Title';
    const isSubtle = true;
    const isEnabled = false;
    const body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          isEnabled: isEnabled,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Check the TextStyle color of the Text widget
    final Text textWidget = tester.widget<Text>(find.text(title));
    final Color? textStyleColor = textWidget.style?.color;

    // Check the color when the widget is subtle and disabled
    final Color expectedColor = VColors.defaultDisabled;
    expect(textStyleColor, expectedColor);
  });

  testWidgets(
      'VAccordion should render icon with correct color when isDown is true',
      (WidgetTester tester) async {
    const title = 'Test Title';
    const isEnabled =
        true; // Assuming that the widget must be enabled for isDown to be true
    const isSubtle =
        false; // Assuming that you want to test when isSubtle is false
    const body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          isEnabled: isEnabled,
          body: body,
        ),
      ),
    ));

    // Simulate pressing down on the widget
    await tester.press(find.byType(VAccordion));
    await tester.pump();

    // Check the icon color
    final VIcon iconWidget = tester.widget<VIcon>(find.byType(VIcon));
    final Color? iconColor = iconWidget.iconColor;

    // Check the color when the widget is pressed down
    const Color expectedColor =
        VColors.defaultActive; // Replace with your actual color
    expect(iconColor, expectedColor);
  });

  // Coverage: VAccordion dark theme
  testWidgets("Accordion dark theme renders correctly",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.dark(useMaterial3: false).copyWith(
          extensions: <ThemeExtension<dynamic>>{
            VDef.defaultColorSchemeDark,
            VAlt.altColorSchemeDark,
            messageColorScheme,
          },
        ),
        home: const Scaffold(
          body: VAccordion(
            title: "Dark Accordion",
            body: Text("Body"),
          ),
        ),
      ),
    );
    expect(find.text("Dark Accordion"), findsOneWidget);
  });

  // Coverage: VAccordion controlled mode
  testWidgets("Accordion controlled mode (isExpanded true)",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VAccordion(
            title: "Controlled",
            body: const Text("Expanded body"),
            isExpanded: true,
            onExpansionChanged: (bool expanded) {},
          ),
        ),
      ),
    );
    expect(find.text("Expanded body"), findsOneWidget);
  });

  // Coverage: VAccordion subtle + disabled
  testWidgets("Accordion subtle disabled", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VAccordion(
            title: "Subtle Disabled",
            body: Text("Body"),
            isSubtle: true,
            isEnabled: false,
          ),
        ),
      ),
    );
    expect(find.text("Subtle Disabled"), findsOneWidget);
  });

  // Coverage: VAccordion bold pressed states
  testWidgets("Accordion bold tap and release", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VAccordion(
            title: "Bold Tap",
            body: Text("Body"),
            isSubtle: false,
          ),
        ),
      ),
    );
    // Tap to expand
    await tester.tap(find.text("Bold Tap"));
    await tester.pumpAndSettle();
    expect(find.text("Body"), findsOneWidget);

    // Tap again to collapse
    await tester.tap(find.text("Bold Tap"));
    await tester.pumpAndSettle();
  });

  // Coverage: VAccordionStyle lerp
  test('VAccordionStyle lerp', () {
    const a = VAccordionStyle(
      headerTextColorDefault: Colors.red,
      headerOpenColor: Colors.black,
    );
    const b = VAccordionStyle(
      headerTextColorDefault: Colors.blue,
      headerOpenColor: Colors.white,
    );
    final result = a.lerp(b, 0.5);
    expect(result, isA<VAccordionStyle>());
  });

  test('VAccordionStyle lerp with null returns this', () {
    const a = VAccordionStyle(headerTextColorDefault: Colors.red);
    final result = a.lerp(null, 0.5);
    expect(identical(result, a), isTrue);
  });

  // Coverage: Accordion alt theme dark
  testWidgets("Accordion alt theme dark", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VAccordion(
            title: "Alt Dark",
            vExt: VAlt(),
            body: const Text("Body"),
          ),
        ),
      ),
    );
    expect(find.text("Alt Dark"), findsOneWidget);
  });

  // Coverage: Accordion disabled + not subtle (iconColorState disabled branch)
  testWidgets("Accordion disabled not subtle", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VAccordion(
            title: "Disabled Bold",
            isEnabled: false,
            isSubtle: false,
            body: Text("Body"),
          ),
        ),
      ),
    );
    expect(find.text("Disabled Bold"), findsOneWidget);
  });

  // Coverage: Accordion subtle pressed state text color
  testWidgets("Accordion subtle tap pressed", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VAccordion(
            title: "Subtle",
            isSubtle: true,
            body: Text("Body"),
          ),
        ),
      ),
    );
    final gesture =
        await tester.startGesture(tester.getCenter(find.text("Subtle")));
    await tester.pump();
    await gesture.up();
    await tester.pumpAndSettle();
    expect(find.text("Body"), findsOneWidget);
  });

  // Coverage: VAccordion expanded state for iconColorState (line 363)
  testWidgets("VAccordion initially expanded shows icon",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: VAccordion(
          title: "Expanded Title",
          body: Text("Expanded Body"),
          initiallyExpanded: true,
        ),
      ),
    );
    expect(find.text("Expanded Title"), findsOneWidget);
    expect(find.text("Expanded Body"), findsOneWidget);
  });

  // Coverage: controlled mode onExpansionChanged (line 491)
  testWidgets("VAccordion controlled mode fires onExpansionChanged",
      (WidgetTester tester) async {
    bool? expandedState;
    await tester.pumpWidget(
      MaterialApp(
        home: VAccordion(
          title: "Controlled",
          body: const Text("Controlled Body"),
          isExpanded: false,
          onExpansionChanged: (value) {
            expandedState = value;
          },
        ),
      ),
    );
    await tester.tap(find.text("Controlled"));
    await tester.pumpAndSettle();
    expect(expandedState, isTrue);
  });

  // Coverage: subtle enabled + pressed text color (lines 390-391)
  testWidgets("VAccordion subtle enabled pressed text",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: VAccordion(
          title: "SubtleEnabled",
          body: Text("Body"),
          isSubtle: true,
        ),
      ),
    );
    // Press down to trigger isDown = true for textColor subtle path
    final gesture =
        await tester.startGesture(tester.getCenter(find.text("SubtleEnabled")));
    await tester.pump();
    expect(find.text("SubtleEnabled"), findsOneWidget);
    await gesture.up();
    await tester.pumpAndSettle();
  });

  // Coverage: didUpdateWidget controlled→uncontrolled (lines 279-284)
  testWidgets("VAccordion switching from controlled to uncontrolled",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: VAccordion(
          title: "CtrlToUnctrl",
          body: Text("Body"),
          isExpanded: true,
        ),
      ),
    );
    expect(find.text("Body"), findsOneWidget);
    // Rebuild without isExpanded (uncontrolled)
    await tester.pumpWidget(
      const MaterialApp(
        home: VAccordion(
          title: "CtrlToUnctrl",
          body: Text("Body"),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text("CtrlToUnctrl"), findsOneWidget);
  });

  testWidgets('VAccordion pressed state triggers icon and text color changes',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VAccordion(
            title: "PressTest",
            body: Text("Body"),
            isEnabled: true,
            isSubtle: false,
          ),
        ),
      ),
    );
    // Start a press gesture to trigger isDown state (covers iconColorState isDown branch, textColor isDown branch)
    final gesture =
        await tester.startGesture(tester.getCenter(find.text("PressTest")));
    await tester.pump();
    // Release
    await gesture.up();
    await tester.pumpAndSettle();
    expect(find.text("PressTest"), findsOneWidget);
  });

  testWidgets('VAccordion subtle pressed state', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VAccordion(
            title: "SubtlePress",
            body: Text("Body"),
            isEnabled: true,
            isSubtle: true,
          ),
        ),
      ),
    );
    // Start a press gesture to trigger isDown + isSubtle branches
    final gesture =
        await tester.startGesture(tester.getCenter(find.text("SubtlePress")));
    await tester.pump();
    await gesture.up();
    await tester.pumpAndSettle();
    expect(find.text("SubtlePress"), findsOneWidget);
  });

  testWidgets('VAccordion expanded state shows active icon color',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VAccordion(
            title: "ExpandIcon",
            body: Text("Body"),
            isEnabled: true,
          ),
        ),
      ),
    );
    // Tap to expand (covers iconColorState _isExpanded branch)
    await tester.tap(find.text("ExpandIcon"));
    await tester.pumpAndSettle();
    expect(find.text("Body"), findsOneWidget);
  });

  testWidgets('VAccordion disabled subtle icon color',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VAccordion(
            title: "DisabledSubtle",
            body: Text("Body"),
            isEnabled: false,
            isSubtle: true,
          ),
        ),
      ),
    );
    expect(find.text("DisabledSubtle"), findsOneWidget);
  });

  //! This is Accordion golden test

  testWidgets('Accordion golden(snapshot) testing',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      RepaintBoundary(
        child: MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 400,
                child: VAccordion(
                  title: 'Accordion Title',
                  body: const Text('Accordion body content'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(VAccordion),
      matchesGoldenFile('goldens/accordion.png'),
    );
  });
}
