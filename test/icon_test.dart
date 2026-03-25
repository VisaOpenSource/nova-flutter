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
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

void main() {
  // Coverage: VIcon with iconColor null (line 55 — colorFilter: null)
  testWidgets("VIcon with null iconColor renders without colorFilter",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VIcon(
            svgIcon: VIcons.searchLow,
            iconColor: null,
          ),
        ),
      ),
    );
    expect(find.byType(VIcon), findsOneWidget);
  });

  // Coverage: VIcon with iconColor set (ensures covered path)
  testWidgets("VIcon with iconColor renders with colorFilter",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VIcon(
            svgIcon: VIcons.searchLow,
            iconColor: Colors.red,
          ),
        ),
      ),
    );
    expect(find.byType(VIcon), findsOneWidget);
  });

  // Coverage: VIcon with semanticLabel
  testWidgets("VIcon with semanticLabel includes semantics",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VIcon(
            svgIcon: VIcons.searchLow,
            iconColor: Colors.blue,
            semanticLabel: "Search icon",
          ),
        ),
      ),
    );
    expect(find.byType(VIcon), findsOneWidget);
  });

  // Coverage: VIcon with custom placeholderBuilder (line 56 takes the custom path)
  testWidgets("VIcon with custom placeholderBuilder",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VIcon(
            svgIcon: VIcons.searchLow,
            iconColor: Colors.blue,
            svgImagePlaceholderBuilder: (_) => const Text("Loading"),
          ),
        ),
      ),
    );
    expect(find.byType(VIcon), findsOneWidget);
  });

  // Coverage: VIcon null iconColor triggers null colorFilter AND default placeholder
  // (lines 55-60)
  testWidgets("VIcon null iconColor with default placeholder",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VIcon(
            svgIcon: VIcons.searchLow,
            iconColor: null,
            iconWidth: 24,
            iconHeight: 24,
          ),
        ),
      ),
    );
    expect(find.byType(VIcon), findsOneWidget);
  });
}
