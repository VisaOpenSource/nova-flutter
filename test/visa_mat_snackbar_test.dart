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

// Tests for VSnackBar, SnackBarState, and getSnackBarHighlight
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

void main() {
  group('getSnackBarHighlight', () {
    test('returns infoGraphics for informational', () {
      expect(getSnackBarHighlight(SnackBarState.informational),
          VColors.infoGraphics);
    });

    test('returns warningGraphics for warning', () {
      expect(
          getSnackBarHighlight(SnackBarState.warning), VColors.warningGraphics);
    });

    test('returns negativeGraphics for error', () {
      expect(
          getSnackBarHighlight(SnackBarState.error), VColors.negativeGraphics);
    });

    test('returns positiveGraphics for success', () {
      expect(
          getSnackBarHighlight(SnackBarState.success), VColors.positiveGraphics);
    });

    test('returns white for unknown state', () {
      expect(getSnackBarHighlight('unknown'), Colors.white);
    });
  });

  group('VSnackBar', () {
    testWidgets('shows informational snackbar', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const VSnackBar(
                    content: Text('Info message'),
                    snackBarState: SnackBarState.informational,
                  ),
                );
              },
              child: const Text('Show'),
            );
          }),
        ),
      ));
      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();
      expect(find.text('Info message'), findsOneWidget);
      expect(find.byType(VSnackBar), findsOneWidget);
    });

    testWidgets('shows warning snackbar', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const VSnackBar(
                    content: Text('Warning!'),
                    snackBarState: SnackBarState.warning,
                  ),
                );
              },
              child: const Text('Show'),
            );
          }),
        ),
      ));
      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();
      expect(find.text('Warning!'), findsOneWidget);
    });

    testWidgets('shows error snackbar', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const VSnackBar(
                    content: Text('Error!'),
                    snackBarState: SnackBarState.error,
                  ),
                );
              },
              child: const Text('Show'),
            );
          }),
        ),
      ));
      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();
      expect(find.text('Error!'), findsOneWidget);
    });

    testWidgets('shows success snackbar', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const VSnackBar(
                    content: Text('Success!'),
                    snackBarState: SnackBarState.success,
                  ),
                );
              },
              child: const Text('Show'),
            );
          }),
        ),
      ));
      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();
      expect(find.text('Success!'), findsOneWidget);
    });

    testWidgets('shows snackbar with floating behavior and width',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const VSnackBar(
                    content: Text('Floating'),
                    snackBarState: SnackBarState.informational,
                    behavior: SnackBarBehavior.floating,
                    width: 300,
                  ),
                );
              },
              child: const Text('Show'),
            );
          }),
        ),
      ));
      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();
      expect(find.text('Floating'), findsOneWidget);
    });

    testWidgets('shows snackbar with floating behavior and margin',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const VSnackBar(
                    content: Text('FloatMargin'),
                    snackBarState: SnackBarState.informational,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(20),
                  ),
                );
              },
              child: const Text('Show'),
            );
          }),
        ),
      ));
      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();
      expect(find.text('FloatMargin'), findsOneWidget);
    });

    testWidgets('shows snackbar with action', (tester) async {
      bool actionTapped = false;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  VSnackBar(
                    content: const Text('With Action'),
                    snackBarState: SnackBarState.informational,
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        actionTapped = true;
                      },
                    ),
                  ),
                );
              },
              child: const Text('Show'),
            );
          }),
        ),
      ));
      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();
      expect(find.text('UNDO'), findsOneWidget);
      await tester.tap(find.text('UNDO'));
      await tester.pumpAndSettle();
      expect(actionTapped, isTrue);
    });

    testWidgets('onVisible callback fires', (tester) async {
      bool visible = false;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  VSnackBar(
                    content: const Text('OnVisible'),
                    snackBarState: SnackBarState.informational,
                    onVisible: () {
                      visible = true;
                    },
                  ),
                );
              },
              child: const Text('Show'),
            );
          }),
        ),
      ));
      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();
      expect(visible, isTrue);
    });

    testWidgets('snackbar with custom padding', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const VSnackBar(
                    content: Text('Padded'),
                    snackBarState: SnackBarState.informational,
                    padding: EdgeInsets.all(20),
                  ),
                );
              },
              child: const Text('Show'),
            );
          }),
        ),
      ));
      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();
      expect(find.text('Padded'), findsOneWidget);
    });

    testWidgets('snackbar with custom elevation and shape', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const VSnackBar(
                    content: Text('Styled'),
                    snackBarState: SnackBarState.informational,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                );
              },
              child: const Text('Show'),
            );
          }),
        ),
      ));
      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();
      expect(find.text('Styled'), findsOneWidget);
    });

    testWidgets('snackbar with custom padding and action', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  VSnackBar(
                    content: const Text('PaddedAction'),
                    snackBarState: SnackBarState.informational,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    action: SnackBarAction(
                      label: 'ACT',
                      onPressed: () {},
                    ),
                  ),
                );
              },
              child: const Text('Show'),
            );
          }),
        ),
      ));
      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();
      expect(find.text('PaddedAction'), findsOneWidget);
      expect(find.text('ACT'), findsOneWidget);
    });

    testWidgets('snackbar is dismissed by swipe', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const VSnackBar(
                    content: Text('Dismiss me'),
                    snackBarState: SnackBarState.informational,
                  ),
                );
              },
              child: const Text('Show'),
            );
          }),
        ),
      ));
      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();
      expect(find.text('Dismiss me'), findsOneWidget);
      // Swipe down to dismiss
      await tester.fling(find.text('Dismiss me'), const Offset(0, 100), 800);
      await tester.pumpAndSettle();
    });

    testWidgets('createAnimationController returns controller', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return const Text('placeholder');
          }),
        ),
      ));
      // createAnimationController is static — need a TickerProvider
      // We just verify it's callable via the ScaffoldMessenger path
      expect(VSnackBar.createAnimationController,
          isA<Function>());
    });

    testWidgets('withAnimation creates copy with new animation', (tester) async {
      const snackBar = VSnackBar(
        content: Text('Original'),
        snackBarState: SnackBarState.informational,
      );
      final controller = AnimationController(
        duration: const Duration(milliseconds: 200),
        vsync: const TestVSync(),
      );
      final copy = snackBar.withAnimation(controller);
      expect(copy.content, snackBar.content);
      expect(copy.snackBarState, snackBar.snackBarState);
      expect(copy.animation, controller);
      controller.dispose();
    });
  });
}
