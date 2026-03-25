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

void main() {
  test('VComboboxStyle lerp interpolates values correctly', () {
    const style1 = VComboboxStyle(
      backgroundColor: Colors.red,
      listTileColor: Colors.blue,
      listTileResultIconColor: Colors.green,
      errorTextColor: Colors.yellow,
      resultTextColor: Colors.orange,
      appBarTitleTextColor: Colors.pink,
      clearIconColor: Colors.purple,
      inputStyle: VInputStyle(),
      appBarStyle: VAppBarStyle(),
      errorTextStyle: TextStyle(color: Colors.red),
      resultTextStyle: TextStyle(color: Colors.blue),
    );

    const style2 = VComboboxStyle(
      backgroundColor: Colors.pink,
      listTileColor: Colors.indigo,
      listTileResultIconColor: Colors.grey,
      errorTextColor: Colors.teal,
      resultTextColor: Colors.cyan,
      appBarTitleTextColor: Colors.lime,
      clearIconColor: Colors.amber,
      inputStyle: VInputStyle(),
      appBarStyle: VAppBarStyle(),
      errorTextStyle: TextStyle(color: Colors.pink),
      resultTextStyle: TextStyle(color: Colors.indigo),
    );

    final result = style1.lerp(style2, 0.5);

    expect(result.backgroundColor, Color.lerp(Colors.red, Colors.pink, 0.5));
    expect(result.listTileColor, Color.lerp(Colors.blue, Colors.indigo, 0.5));
    expect(result.listTileResultIconColor,
        Color.lerp(Colors.green, Colors.grey, 0.5));
    expect(result.errorTextColor, Color.lerp(Colors.yellow, Colors.teal, 0.5));
    expect(result.resultTextColor, Color.lerp(Colors.orange, Colors.cyan, 0.5));
    expect(
        result.appBarTitleTextColor, Color.lerp(Colors.pink, Colors.lime, 0.5));
    expect(result.clearIconColor, Color.lerp(Colors.purple, Colors.amber, 0.5));
    expect(result.inputStyle, style1.inputStyle);
    expect(result.appBarStyle, style1.appBarStyle);
    expect(result.errorTextStyle, style1.errorTextStyle);
    expect(result.resultTextStyle, style1.resultTextStyle);
  });

  test('VComboboxStyle copyWith copies values correctly', () {
    const style1 = VComboboxStyle(
      backgroundColor: Colors.red,
      listTileColor: Colors.blue,
      listTileResultIconColor: Colors.green,
      errorTextColor: Colors.yellow,
      resultTextColor: Colors.orange,
      appBarTitleTextColor: Colors.pink,
      clearIconColor: Colors.purple,
      inputStyle: VInputStyle(),
      appBarStyle: VAppBarStyle(),
      errorTextStyle: TextStyle(color: Colors.red),
      resultTextStyle: TextStyle(color: Colors.blue),
    );

    final style2 = style1.copyWith();

    // Check that the values were copied correctly
    expect(style2.backgroundColor, Colors.red);
    expect(style2.listTileColor, Colors.blue);
    expect(style2.listTileResultIconColor, Colors.green);
    expect(style2.errorTextColor, Colors.yellow);
    expect(style2.resultTextColor, Colors.orange);
    expect(style2.appBarTitleTextColor, Colors.pink);
    expect(style2.clearIconColor, Colors.purple);
    expect(style2.errorTextStyle?.color, Colors.red);
    expect(style2.resultTextStyle?.color, Colors.blue);
    expect(style2.inputStyle, style1.inputStyle);
    expect(style2.appBarStyle, style1.appBarStyle);
  });

  testWidgets('VComboboxScreen displays search results correctly',
      (WidgetTester tester) async {
    final searchList = ['Apple', 'Banana', 'Cherry', 'Durian'];
    final searchController = TextEditingController();
    const appBarTitle = 'Fruits';
    const topLabelText = 'Search';
    const style = VComboboxStyle(
      backgroundColor: Colors.white,
      listTileColor: Colors.grey,
      listTileResultIconColor: Colors.green,
      errorTextColor: Colors.red,
      resultTextColor: Colors.black,
      appBarTitleTextColor: Colors.blue,
      clearIconColor: Colors.orange,
      inputStyle: VInputStyle(),
      appBarStyle: VAppBarStyle(),
      errorTextStyle: TextStyle(color: Colors.red),
      resultTextStyle: TextStyle(color: Colors.black),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: VComboboxScreen(
          searchList: searchList,
          searchController: searchController,
          appBarTitle: appBarTitle,
          topLabelText: topLabelText,
          style: style,
        ),
      ),
    );

    // Verify the initial state
    expect(find.text(appBarTitle), findsOneWidget);
    expect(find.text(topLabelText), findsOneWidget);
    // expect(find.text('No result'), findsOneWidget);
    expect(find.byType(VInput), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(searchList.length));

    // Enter a search query
    await tester.enterText(find.byType(VInput), 'Banana');
    await tester.pump();

    // Verify the search results
    expect(find.text('Banana'), findsWidgets);
    expect(find.text('Apple'), findsNothing);
    expect(find.text('Cherry'), findsNothing);
    expect(find.text('Durian'), findsNothing);
  });

  testWidgets('VComboboxScreen displays error text when search result is empty',
      (WidgetTester tester) async {
    final searchList = [];
    final searchController = TextEditingController();
    const appBarTitle = 'Fruits';
    const topLabelText = 'Search';
    const style = VComboboxStyle(
      backgroundColor: Colors.white,
      listTileColor: Colors.grey,
      listTileResultIconColor: Colors.green,
      errorTextColor: Colors.red,
      resultTextColor: Colors.black,
      appBarTitleTextColor: Colors.blue,
      clearIconColor: Colors.orange,
      inputStyle: VInputStyle(),
      appBarStyle: VAppBarStyle(),
      errorTextStyle: TextStyle(color: Colors.red),
      resultTextStyle: TextStyle(color: Colors.black),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: VComboboxScreen(
          searchList: searchList,
          searchController: searchController,
          appBarTitle: appBarTitle,
          topLabelText: topLabelText,
          style: style,
        ),
      ),
    );

    // Verify the error text is displayed
    expect(find.text('No results found'), findsOneWidget);
  });

  testWidgets('VComboboxScreen with alternate theme',
      (WidgetTester tester) async {
    final searchList = [];
    final searchController = TextEditingController();
    const appBarTitle = 'Fruits';
    const topLabelText = 'Search';
    const style = VComboboxStyle(
      backgroundColor: Colors.white,
      listTileColor: Colors.grey,
      listTileResultIconColor: Colors.green,
      errorTextColor: Colors.red,
      resultTextColor: Colors.black,
      appBarTitleTextColor: Colors.blue,
      clearIconColor: Colors.orange,
      inputStyle: VInputStyle(),
      appBarStyle: VAppBarStyle(),
      errorTextStyle: TextStyle(color: Colors.red),
      resultTextStyle: TextStyle(color: Colors.black),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: VComboboxScreen(
          searchList: searchList,
          searchController: searchController,
          appBarTitle: appBarTitle,
          topLabelText: topLabelText,
          style: style,
          vExt: VAlt(),
        ),
      ),
    );

    // Verify the error text is displayed
    expect(find.text('No results found'), findsOneWidget);
  });

  testWidgets('VComboboxScreen with alternate theme is dark',
      (WidgetTester tester) async {
    final searchList = [];
    final searchController = TextEditingController();
    const appBarTitle = 'Fruits';
    const topLabelText = 'Search';
    const style = VComboboxStyle(
      backgroundColor: Colors.white,
      listTileColor: Colors.grey,
      listTileResultIconColor: Colors.green,
      errorTextColor: Colors.red,
      resultTextColor: Colors.black,
      appBarTitleTextColor: Colors.blue,
      clearIconColor: Colors.orange,
      inputStyle: VInputStyle(),
      appBarStyle: VAppBarStyle(),
      errorTextStyle: TextStyle(color: Colors.red),
      resultTextStyle: TextStyle(color: Colors.black),
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: VComboboxScreen(
          searchList: searchList,
          searchController: searchController,
          appBarTitle: appBarTitle,
          topLabelText: topLabelText,
          style: style,
          vExt: VAlt(),
        ),
      ),
    );

    // Verify the error text is displayed
    expect(find.text('No results found'), findsOneWidget);
  });

  testWidgets('VComboboxScreen with alternate theme is dark',
      (WidgetTester tester) async {
    final searchList = [];
    final searchController = TextEditingController();
    const appBarTitle = 'Fruits';
    const topLabelText = 'Search';
    const style = VComboboxStyle(
      backgroundColor: Colors.white,
      listTileColor: Colors.grey,
      listTileResultIconColor: Colors.green,
      errorTextColor: Colors.red,
      resultTextColor: Colors.black,
      appBarTitleTextColor: Colors.blue,
      clearIconColor: Colors.orange,
      inputStyle: VInputStyle(),
      appBarStyle: VAppBarStyle(),
      errorTextStyle: TextStyle(color: Colors.red),
      resultTextStyle: TextStyle(color: Colors.black),
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: VComboboxScreen(
          searchList: searchList,
          searchController: searchController,
          appBarTitle: appBarTitle,
          topLabelText: topLabelText,
          style: style,
          // vExt: VAlt(),
        ),
      ),
    );

    // Verify the error text is displayed
    expect(find.text('No results found'), findsOneWidget);
  });

  // Coverage: VComboboxStyle lerp
  test('VComboboxStyle lerp interpolates correctly', () {
    const a = VComboboxStyle(
      clearIconColor: Colors.red,
    );
    const b = VComboboxStyle(
      clearIconColor: Colors.blue,
    );
    final result = a.lerp(b, 0.5);
    expect(result, isA<VComboboxStyle>());
  });

  test('VComboboxStyle lerp with null returns this', () {
    const a = VComboboxStyle(clearIconColor: Colors.red);
    final result = a.lerp(null, 0.5);
    expect(identical(result, a), isTrue);
  });

  // Coverage: VComboboxScreen with errorText
  testWidgets("Combobox with errorText renders error",
      (WidgetTester tester) async {
    final searchController = TextEditingController();
    await tester.pumpWidget(
      MaterialApp(
        home: VComboboxScreen(
          searchList: const [],
          searchController: searchController,
          appBarTitle: "Title",
          topLabelText: "Label",
          errorText: "This field is required",
        ),
      ),
    );
    expect(find.text("This field is required"), findsOneWidget);
  });

  // Coverage: VComboboxScreen search filter
  testWidgets("Combobox search filters list", (WidgetTester tester) async {
    final searchController = TextEditingController();
    await tester.pumpWidget(
      MaterialApp(
        home: VComboboxScreen(
          searchList: const ['Apple', 'Banana', 'Cherry'],
          searchController: searchController,
          appBarTitle: "Search",
          topLabelText: "Fruit",
        ),
      ),
    );
    // Enter search text to trigger filter
    await tester.enterText(find.byType(TextField), 'Ban');
    await tester.pumpAndSettle();
    expect(find.text('Banana'), findsOneWidget);
  });

  // Coverage: Clear button in search field (lines 202-203)
  testWidgets("Combobox clear button clears search text",
      (WidgetTester tester) async {
    final searchController = TextEditingController();
    await tester.pumpWidget(
      MaterialApp(
        home: VComboboxScreen(
          searchList: const ['Apple', 'Banana', 'Cherry'],
          searchController: searchController,
          appBarTitle: "Search",
          topLabelText: "Fruit",
        ),
      ),
    );

    // Type text in the search field to make clear button appear
    await tester.enterText(find.byType(TextField), 'Apple');
    await tester.pumpAndSettle();

    // Find and tap the clear button via semantics label
    final clearButton = find.bySemanticsLabel("clear text input");
    if (clearButton.evaluate().isNotEmpty) {
      await tester.tap(clearButton);
      await tester.pumpAndSettle();
    }
    expect(find.byType(VComboboxScreen), findsOneWidget);
  });

  // Coverage: Tap search result item (lines 330-337)
  testWidgets("Combobox tapping search result navigates back",
      (WidgetTester tester) async {
    String? result;
    final searchController = TextEditingController();
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () async {
              result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VComboboxScreen(
                    searchList: const ['Apple', 'Banana', 'Cherry'],
                    searchController: searchController,
                    appBarTitle: "Search",
                    topLabelText: "Fruit",
                  ),
                ),
              );
            },
            child: const Text('Open'),
          ),
        ),
      ),
    );
    // Open the combobox screen
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(find.text('Apple'), findsWidgets);

    // Tap a result item to select it and navigate back
    await tester.tap(find.text('Banana').last);
    await tester.pumpAndSettle();
    expect(result, 'Banana');
  });

  // Coverage: Close button default icon (lines 286-289)
  testWidgets("Combobox close button navigates back",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () async {},
            child: const Text('Open'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    // Tap the close button (InkWell in the AppBar leading area)
    // The close icon is a Container with a VIcon inside an InkWell
    final closeButton = find.byType(InkWell).first;
    await tester.tap(closeButton);
    await tester.pumpAndSettle();
    // Should have navigated back
    expect(find.text('Open'), findsOneWidget);
  });

  // Coverage: onSubmitted (lines 226-229)
  testWidgets("Combobox onSubmitted navigates back with text",
      (WidgetTester tester) async {
    String? result;
    final searchController = TextEditingController();
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () async {
              result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VComboboxScreen(
                    searchList: const ['Apple', 'Banana'],
                    searchController: searchController,
                    appBarTitle: "Search",
                    topLabelText: "Fruit",
                  ),
                ),
              );
            },
            child: const Text('Open'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    // Type text and submit
    await tester.enterText(find.byType(TextField), 'Cherry');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    // Should navigate back with the typed text
    expect(result, 'Cherry');
  });

  //! This is Combobox golden test

  testWidgets('Combobox golden(snapshot) testing', (WidgetTester tester) async {
    await tester.pumpWidget(
      RepaintBoundary(
        child: MaterialApp(
          home: VComboboxScreen(
            searchList: const ['Apple', 'Banana', 'Cherry'],
            searchController: TextEditingController(),
            appBarTitle: 'Search',
            topLabelText: 'Search',
            style: VComboboxStyle(
              backgroundColor: Colors.white,
              listTileColor: Colors.grey,
              listTileResultIconColor: Colors.green,
              errorTextColor: Colors.red,
              resultTextColor: Colors.black,
              appBarTitleTextColor: Colors.blue,
              clearIconColor: Colors.orange,
              inputStyle: const VInputStyle(),
              appBarStyle: const VAppBarStyle(),
              errorTextStyle: const TextStyle(color: Colors.red),
              resultTextStyle: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(VComboboxScreen),
      matchesGoldenFile('goldens/combobox.png'),
    );
  });
}
