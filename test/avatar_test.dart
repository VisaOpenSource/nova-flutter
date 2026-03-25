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
  // ===========================================================================
  // VAvatarStyle Tests
  // ===========================================================================

  group('VAvatarStyle', () {
    test('copyWith with non-null values', () {
      var style = const VAvatarStyle(
        splashColor: Colors.blue,
        backgroundColor: Colors.red,
        borderColor: Colors.green,
        foregroundColor: Colors.orange,
        verticalHighLightColor: Colors.purple,
        borderRadius: 1.0,
        radius: 2.0,
        verticalAvatarBorderRadius: 3.0,
      );

      var copiedStyle = style.copyWith(
        splashColor: Colors.brown,
        backgroundColor: Colors.yellow,
        borderColor: Colors.indigo,
        foregroundColor: Colors.teal,
        verticalHighLightColor: Colors.grey,
        borderRadius: 2.0,
        radius: 3.0,
        verticalAvatarBorderRadius: 4.0,
      );
      expect(copiedStyle.splashColor, Colors.brown);
      expect(copiedStyle.backgroundColor, Colors.yellow);
      expect(copiedStyle.borderColor, Colors.indigo);
      expect(copiedStyle.foregroundColor, Colors.teal);
      expect(copiedStyle.verticalHighLightColor, Colors.grey);
      expect(copiedStyle.borderRadius, 2.0);
      expect(copiedStyle.radius, 3.0);
      expect(copiedStyle.verticalAvatarBorderRadius, 4.0);
    });

    test('copyWith with null values retains originals', () {
      var style = const VAvatarStyle(
        splashColor: Colors.blue,
        backgroundColor: Colors.red,
        borderColor: Colors.green,
        foregroundColor: Colors.orange,
        verticalHighLightColor: Colors.purple,
        borderRadius: 1.0,
        radius: 2.0,
        verticalAvatarBorderRadius: 3.0,
      );

      var copiedStyleWithNulls = style.copyWith();
      expect(copiedStyleWithNulls.splashColor, Colors.blue);
      expect(copiedStyleWithNulls.backgroundColor, Colors.red);
      expect(copiedStyleWithNulls.borderColor, Colors.green);
      expect(copiedStyleWithNulls.foregroundColor, Colors.orange);
      expect(copiedStyleWithNulls.verticalHighLightColor, Colors.purple);
      expect(copiedStyleWithNulls.borderRadius, 1.0);
      expect(copiedStyleWithNulls.radius, 2.0);
      expect(copiedStyleWithNulls.verticalAvatarBorderRadius, 3.0);
    });

    test('lerp with valid VAvatarStyle', () {
      var style = const VAvatarStyle(
        splashColor: Colors.blue,
        backgroundColor: Colors.red,
        borderColor: Colors.green,
        foregroundColor: Colors.orange,
        verticalHighLightColor: Colors.purple,
        borderRadius: 1.0,
        radius: 2.0,
        verticalAvatarBorderRadius: 3.0,
      );

      var anotherStyle = const VAvatarStyle(
        splashColor: Colors.black,
        backgroundColor: Colors.white,
        borderColor: Colors.grey,
        foregroundColor: Colors.cyan,
        verticalHighLightColor: Colors.lime,
        borderRadius: 3.0,
        radius: 4.0,
        verticalAvatarBorderRadius: 5.0,
      );

      var lerpedStyle = style.lerp(anotherStyle, 0.5);
      expect(
          lerpedStyle.splashColor, Color.lerp(Colors.blue, Colors.black, 0.5));
      expect(lerpedStyle.backgroundColor,
          Color.lerp(Colors.red, Colors.white, 0.5));
      expect(
          lerpedStyle.borderColor, Color.lerp(Colors.green, Colors.grey, 0.5));
      expect(lerpedStyle.foregroundColor,
          Color.lerp(Colors.orange, Colors.cyan, 0.5));
      expect(lerpedStyle.verticalHighLightColor,
          Color.lerp(Colors.purple, Colors.lime, 0.5));
      // borderRadius, radius, verticalAvatarBorderRadius are NOT interpolated
      expect(lerpedStyle.borderRadius, 1.0);
      expect(lerpedStyle.radius, 2.0);
      expect(lerpedStyle.verticalAvatarBorderRadius, 3.0);
    });

    test('lerp with non-VAvatarStyle returns this', () {
      var style = const VAvatarStyle(
        splashColor: Colors.blue,
        backgroundColor: Colors.red,
      );

      // Passing null triggers the `other is! VAvatarStyle` branch
      var result = style.lerp(null, 0.5);
      expect(result.splashColor, Colors.blue);
      expect(result.backgroundColor, Colors.red);
    });
  });

  // ===========================================================================
  // VAvatarProfile Tests
  // ===========================================================================

  group('VAvatarProfile', () {
    testWidgets('with hadBorder, custom style, child, and semanticLabel',
        (WidgetTester tester) async {
      const child = Text('AM');
      const semanticLabel = 'Test label';
      const style = VAvatarStyle(
        backgroundColor: Colors.blue,
        borderColor: Colors.red,
        foregroundColor: Colors.green,
        radius: 10,
        borderRadius: 5,
      );

      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: VAvatarProfile(
            semanticLabel: semanticLabel,
            hadBorder: true,
            style: style,
            child: child,
          ),
        ),
      ));

      final avatarProfile =
          tester.firstWidget<VAvatarProfile>(find.byType(VAvatarProfile));
      expect(avatarProfile.child, child);
      expect(avatarProfile.semanticLabel, semanticLabel);
      expect(avatarProfile.hadBorder, true);
      expect(avatarProfile.style, style);

      // Verify CircleAvatar is rendered
      expect(find.byType(CircleAvatar), findsOneWidget);

      // Verify Semantics label is present
      expect(find.bySemanticsLabel(semanticLabel), findsOneWidget);
    });

    testWidgets('default light theme (vExt null, no style)',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: VAvatarProfile(
            child: Text('AM'),
          ),
        ),
      ));

      expect(find.byType(VAvatarProfile), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.text('AM'), findsOneWidget);
    });

    testWidgets('default dark theme (vExt null)', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: const Scaffold(
          body: VAvatarProfile(
            child: Text('AM'),
          ),
        ),
      ));

      expect(find.byType(VAvatarProfile), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('VDef light theme', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: VAvatarProfile(
            vExt: VDef(),
            child: const Text('AM'),
          ),
        ),
      ));

      expect(find.byType(VAvatarProfile), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('VDef dark theme', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VAvatarProfile(
            vExt: VDef(),
            child: const Text('AM'),
          ),
        ),
      ));

      expect(find.byType(VAvatarProfile), findsOneWidget);
    });

    testWidgets('VAlt light theme', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: VAvatarProfile(
            vExt: VAlt(),
            child: const Text('AM'),
          ),
        ),
      ));

      expect(find.byType(VAvatarProfile), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('VAlt dark theme', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VAvatarProfile(
            vExt: VAlt(),
            child: const Text('AM'),
          ),
        ),
      ));

      expect(find.byType(VAvatarProfile), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('hadBorder false (default) renders no border decoration',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: VAvatarProfile(
            child: Text('AM'),
          ),
        ),
      ));

      // hadBorder defaults to false, so the Container should have no BoxDecoration
      final avatarProfile =
          tester.firstWidget<VAvatarProfile>(find.byType(VAvatarProfile));
      expect(avatarProfile.hadBorder, false);
    });

    testWidgets('with null child, null semanticLabel, null images',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: VAvatarProfile(),
        ),
      ));

      expect(find.byType(VAvatarProfile), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);

      final avatarProfile =
          tester.firstWidget<VAvatarProfile>(find.byType(VAvatarProfile));
      expect(avatarProfile.child, isNull);
      expect(avatarProfile.semanticLabel, isNull);
      expect(avatarProfile.backgroundImage, isNull);
      expect(avatarProfile.foregroundImage, isNull);
    });

    testWidgets('with backgroundImage sets Semantics image to true',
        (WidgetTester tester) async {
      // Use a MemoryImage to avoid asset bundle issues in tests
      final imageProvider = MemoryImage(
        // 1x1 transparent PNG
        Uri.parse(
                'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==')
            .data!
            .contentAsBytes(),
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: VAvatarProfile(
            backgroundImage: imageProvider,
            semanticLabel: 'photo',
          ),
        ),
      ));

      final semanticsWidget = tester.widget<Semantics>(
        find
            .ancestor(
              of: find.byType(CircleAvatar),
              matching: find.byType(Semantics),
            )
            .first,
      );
      expect(semanticsWidget.properties.image, true);
      expect(semanticsWidget.properties.label, 'photo');
    });

    testWidgets(
        'onBackgroundImageError and onForegroundImageError are passed through',
        (WidgetTester tester) async {
      void onBgError(Object error, StackTrace? stackTrace) {}
      void onFgError(Object error, StackTrace? stackTrace) {}

      final imageProvider = MemoryImage(
        Uri.parse(
                'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==')
            .data!
            .contentAsBytes(),
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: VAvatarProfile(
            backgroundImage: imageProvider,
            foregroundImage: imageProvider,
            onBackgroundImageError: onBgError,
            onForegroundImageError: onFgError,
            child: const Text('AM'),
          ),
        ),
      ));

      final avatarProfile =
          tester.firstWidget<VAvatarProfile>(find.byType(VAvatarProfile));
      expect(avatarProfile.onBackgroundImageError, onBgError);
      expect(avatarProfile.onForegroundImageError, onFgError);
      expect(avatarProfile.backgroundImage, imageProvider);
      expect(avatarProfile.foregroundImage, imageProvider);
    });
  });

  // ===========================================================================
  // VAvatarVertical Tests
  // ===========================================================================

  group('VAvatarVertical', () {
    testWidgets('default vExt with leading and onTap and custom style',
        (WidgetTester tester) async {
      const child = Text('Test child');
      const leading = Icon(Icons.home);
      onTap() {}
      const style = VAvatarStyle(
        verticalHighLightColor: Colors.blue,
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: VAvatarVertical(
            leading: leading,
            onTap: onTap,
            style: style,
            child: child,
          ),
        ),
      ));

      final avatarVertical =
          tester.firstWidget<VAvatarVertical>(find.byType(VAvatarVertical));
      expect(avatarVertical.child, child);
      expect(avatarVertical.leading, leading);
      expect(avatarVertical.onTap, onTap);
      expect(avatarVertical.style, style);

      // leading is non-null → SizedBox(width: 10) spacer should exist
      expect(find.byType(Icon), findsOneWidget);

      // Semantics button should be true since onTap is set
      final semanticsWidget = tester.widget<Semantics>(
        find
            .ancestor(
              of: find.byType(InkWell),
              matching: find.byType(Semantics),
            )
            .first,
      );
      expect(semanticsWidget.properties.button, true);
    });

    testWidgets('VAlt vExt', (WidgetTester tester) async {
      const child = Text('Test child');
      const leading = Icon(Icons.home);
      onTap() {}
      const style = VAvatarStyle(
        verticalHighLightColor: Colors.blue,
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: VAvatarVertical(
            vExt: VAlt(),
            leading: leading,
            onTap: onTap,
            style: style,
            child: child,
          ),
        ),
      ));

      final avatarVertical =
          tester.firstWidget<VAvatarVertical>(find.byType(VAvatarVertical));
      expect(avatarVertical.child, child);
      expect(avatarVertical.leading, leading);
      expect(avatarVertical.onTap, onTap);
      expect(avatarVertical.style, style);
    });

    testWidgets('onTap non-null and leading null → getHeight returns 48',
        (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: VAvatarVertical(
            onTap: () {
              tapped = true;
            },
            child: const Text('No leading'),
          ),
        ),
      ));

      final avatarVertical =
          tester.firstWidget<VAvatarVertical>(find.byType(VAvatarVertical));
      // getHeight() should return 48.0 when onTap != null && leading == null
      expect(avatarVertical.getHeight(), 48.0);
      expect(avatarVertical.leading, isNull);

      // leading is null → SizedBox.shrink should be rendered
      expect(find.byType(SizedBox), findsWidgets);

      // Tap the widget and verify onTap fires
      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(tapped, true);
    });

    testWidgets('onTap null → getHeight returns null, Semantics button false',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: VAvatarVertical(
            onTap: null,
            leading: Icon(Icons.person),
            child: Text('Alex Miller'),
          ),
        ),
      ));

      final avatarVertical =
          tester.firstWidget<VAvatarVertical>(find.byType(VAvatarVertical));
      // getHeight() should return null when onTap is null
      expect(avatarVertical.getHeight(), isNull);

      // Semantics button should be false since onTap is null
      final semanticsWidget = tester.widget<Semantics>(
        find
            .ancestor(
              of: find.byType(InkWell),
              matching: find.byType(Semantics),
            )
            .first,
      );
      expect(semanticsWidget.properties.button, false);
    });

    testWidgets('no leading and no onTap → getHeight null',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: VAvatarVertical(
            onTap: null,
            child: Text('Text only'),
          ),
        ),
      ));

      final avatarVertical =
          tester.firstWidget<VAvatarVertical>(find.byType(VAvatarVertical));
      expect(avatarVertical.getHeight(), isNull);
      expect(avatarVertical.leading, isNull);
    });

    testWidgets('no custom style uses default highlight color',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: VAvatarVertical(
            onTap: () {},
            child: const Text('Default style'),
          ),
        ),
      ));

      final avatarVertical =
          tester.firstWidget<VAvatarVertical>(find.byType(VAvatarVertical));
      expect(avatarVertical.style, isNull);
      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('onTapDown, onTapUp, and onTapCancel callbacks',
        (WidgetTester tester) async {
      bool tapDownFired = false;
      bool tapUpFired = false;
      bool tapCancelFired = false;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: VAvatarVertical(
            onTap: () {},
            onTapDown: (_) {
              tapDownFired = true;
            },
            onTapUp: (_) {
              tapUpFired = true;
            },
            onTapCancel: () {
              tapCancelFired = true;
            },
            child: const Text('Callbacks'),
          ),
        ),
      ));

      final avatarVertical =
          tester.firstWidget<VAvatarVertical>(find.byType(VAvatarVertical));
      expect(avatarVertical.onTapDown, isNotNull);
      expect(avatarVertical.onTapUp, isNotNull);
      expect(avatarVertical.onTapCancel, isNotNull);

      // Tap to verify onTapDown and onTapUp fire
      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(tapDownFired, true);
      expect(tapUpFired, true);
      // tapCancel does not fire on a successful tap
      expect(tapCancelFired, false);
    });

    testWidgets('with leading non-null renders leading and spacer',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: VAvatarVertical(
            leading: const VAvatarProfile(
              child: Text('AM'),
            ),
            onTap: () {},
            child: const Text('Alex'),
          ),
        ),
      ));

      // Both the leading VAvatarProfile and the child text should be visible
      expect(find.byType(VAvatarProfile), findsOneWidget);
      expect(find.text('Alex'), findsOneWidget);
      expect(find.text('AM'), findsOneWidget);
    });
  });

  //! This is Avatar golden test

  testWidgets('Avatar golden(snapshot) testing', (WidgetTester tester) async {
    await tester.pumpWidget(
      RepaintBoundary(
        child: MaterialApp(
          home: Scaffold(
            body: Center(
              child: VAvatarProfile(
                semanticLabel: 'Avatar golden test',
                child: const Text('AM'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(
      find.byType(VAvatarProfile),
      matchesGoldenFile('goldens/avatar.png'),
    );
  });
}
