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

// Tests for VMatTabBar, VMatTab, VMatTabBarView, VMatTabPageSelector
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

void main() {
  Widget buildApp(Widget child) {
    return MaterialApp(home: child);
  }

  // Use simple Text widgets as tab labels to avoid VMatTab's Flexible issue
  Widget makeTab(String label) => Tab(child: Text(label));
  Widget makeIconTab() => const Tab(icon: Icon(Icons.home));
  Widget makeIconTextTab(String label) =>
      Tab(icon: const Icon(Icons.home), child: Text(label));

  group('VMatTab', () {
    testWidgets('preferredSize with text only', (tester) async {
      const tab = VMatTab(text: 'Hello');
      expect(tab.preferredSize.height, 46.0);
    });

    testWidgets('preferredSize with icon only', (tester) async {
      const tab = VMatTab(icon: Icon(Icons.home));
      expect(tab.preferredSize.height, 46.0);
    });

    testWidgets('preferredSize with icon and text', (tester) async {
      const tab = VMatTab(text: 'Home', icon: Icon(Icons.home));
      expect(tab.preferredSize.height, 72.0);
    });

    testWidgets('preferredSize with custom height', (tester) async {
      const tab = VMatTab(text: 'Tall', height: 80);
      expect(tab.preferredSize.height, 80.0);
    });
  });

  group('VMatTabBar', () {
    testWidgets('renders multiple tabs', (tester) async {
      await tester.pumpWidget(buildApp(
        DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: VMatTabBar(
                vTabs: [makeTab('Tab 1'), makeTab('Tab 2'), makeTab('Tab 3')],
              ),
            ),
            body: const VMatTabBarView(
              children: [Text('C1'), Text('C2'), Text('C3')],
            ),
          ),
        ),
      ));
      await tester.pump();
      expect(find.text('Tab 1'), findsOneWidget);
      expect(find.text('Tab 2'), findsOneWidget);
      expect(find.text('Tab 3'), findsOneWidget);
    });

    testWidgets('tap switches tab', (tester) async {
      await tester.pumpWidget(buildApp(
        DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: VMatTabBar(
                vTabs: [makeTab('Tab 1'), makeTab('Tab 2'), makeTab('Tab 3')],
              ),
            ),
            body: const VMatTabBarView(
              children: [Text('C1'), Text('C2'), Text('C3')],
            ),
          ),
        ),
      ));
      await tester.pump();

      // Tap second tab
      await tester.tap(find.text('Tab 2'));
      await tester.pumpAndSettle();
      expect(find.text('C2'), findsOneWidget);
    });

    testWidgets('onTap callback fires', (tester) async {
      int tappedIndex = -1;
      await tester.pumpWidget(buildApp(
        DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: VMatTabBar(
                onTap: (index) => tappedIndex = index,
                vTabs: [makeTab('Tab 1'), makeTab('Tab 2'), makeTab('Tab 3')],
              ),
            ),
            body: const VMatTabBarView(
              children: [Text('C1'), Text('C2'), Text('C3')],
            ),
          ),
        ),
      ));
      await tester.tap(find.text('Tab 2'));
      await tester.pumpAndSettle();
      expect(tappedIndex, 1);
    });

    testWidgets('scrollable tab bar', (tester) async {
      await tester.pumpWidget(buildApp(
        DefaultTabController(
          length: 10,
          child: Scaffold(
            appBar: AppBar(
              bottom: VMatTabBar(
                isScrollable: true,
                vTabs: List.generate(10, (i) => makeTab('Tab $i')),
              ),
            ),
            body: VMatTabBarView(
              children: List.generate(10, (i) => Text('C$i')),
            ),
          ),
        ),
      ));
      await tester.pump();
      expect(find.text('Tab 0'), findsOneWidget);
      // Tap a distant tab to trigger scroll
      await tester.tap(find.text('Tab 3'));
      await tester.pumpAndSettle();
    });

    testWidgets('label indicator size', (tester) async {
      await tester.pumpWidget(buildApp(
        DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: VMatTabBar(
                indicatorSize: VMatTabBarIndicatorSize.label,
                vTabs: [makeTab('Tab 1'), makeTab('Tab 2'), makeTab('Tab 3')],
              ),
            ),
            body: const VMatTabBarView(
              children: [Text('C1'), Text('C2'), Text('C3')],
            ),
          ),
        ),
      ));
      await tester.pump();
      expect(find.text('Tab 1'), findsOneWidget);
    });

    testWidgets('renders with custom indicator', (tester) async {
      await tester.pumpWidget(buildApp(
        DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: VMatTabBar(
                indicator: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.red, width: 3),
                  ),
                ),
                vTabs: [makeTab('A'), makeTab('B')],
              ),
            ),
            body: const VMatTabBarView(
              children: [Text('CA'), Text('CB')],
            ),
          ),
        ),
      ));
      await tester.pump();
    });

    testWidgets('renders with label colors and styles', (tester) async {
      await tester.pumpWidget(buildApp(
        DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: VMatTabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.normal),
                vTabs: [makeTab('Bold'), makeTab('Normal')],
              ),
            ),
            body: const VMatTabBarView(
              children: [Text('C1'), Text('C2')],
            ),
          ),
        ),
      ));
      await tester.pump();
    });

    testWidgets('renders with background colors', (tester) async {
      await tester.pumpWidget(buildApp(
        DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: VMatTabBar(
                selectedBackgroundColor: Colors.blue.withAlpha(30),
                unselectedBackgroundColor: Colors.transparent,
                vTabs: [makeTab('A'), makeTab('B')],
              ),
            ),
            body: const VMatTabBarView(
              children: [Text('CA'), Text('CB')],
            ),
          ),
        ),
      ));
      await tester.pump();
    });

    testWidgets('TabController programmatic switch', (tester) async {
      await tester.pumpWidget(buildApp(
        DefaultTabController(
          length: 3,
          child: Builder(builder: (context) {
            return Scaffold(
              appBar: AppBar(
                bottom: VMatTabBar(
                  vTabs: [makeTab('A'), makeTab('B'), makeTab('C')],
                ),
              ),
              body: Column(children: [
                const Expanded(
                  child: VMatTabBarView(
                    children: [Text('CA'), Text('CB'), Text('CC')],
                  ),
                ),
                ElevatedButton(
                  onPressed: () =>
                      DefaultTabController.of(context).animateTo(2),
                  child: const Text('Go to C'),
                ),
              ]),
            );
          }),
        ),
      ));
      await tester.tap(find.text('Go to C'));
      await tester.pumpAndSettle();
      expect(find.text('CC'), findsOneWidget);
    });

    testWidgets('swipe between tabs in TabBarView', (tester) async {
      await tester.pumpWidget(buildApp(
        DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: VMatTabBar(
                vTabs: [makeTab('A'), makeTab('B'), makeTab('C')],
              ),
            ),
            body: const VMatTabBarView(
              children: [Text('CA'), Text('CB'), Text('CC')],
            ),
          ),
        ),
      ));
      await tester.pump();
      // Swipe left to go to tab 2
      await tester.fling(find.text('CA'), const Offset(-300, 0), 800);
      await tester.pumpAndSettle();
      expect(find.text('CB'), findsOneWidget);
    });

    testWidgets('indicator padding', (tester) async {
      await tester.pumpWidget(buildApp(
        DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: VMatTabBar(
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
                indicatorWeight: 4.0,
                vTabs: [makeTab('X'), makeTab('Y')],
              ),
            ),
            body: const VMatTabBarView(
              children: [Text('CX'), Text('CY')],
            ),
          ),
        ),
      ));
      await tester.pump();
    });

    testWidgets('tab with icon and text has mixed height', (tester) async {
      await tester.pumpWidget(buildApp(
        DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: VMatTabBar(
                vTabs: [makeIconTextTab('Home'), makeTab('Plain')],
              ),
            ),
            body: const VMatTabBarView(
              children: [Text('C1'), Text('C2')],
            ),
          ),
        ),
      ));
      await tester.pump();
      expect(find.text('Home'), findsOneWidget);
    });

    testWidgets('tab with icon only', (tester) async {
      await tester.pumpWidget(buildApp(
        DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: VMatTabBar(
                vTabs: [makeIconTab(), makeTab('Text')],
              ),
            ),
            body: const VMatTabBarView(
              children: [Text('C1'), Text('C2')],
            ),
          ),
        ),
      ));
      await tester.pump();
      expect(find.byIcon(Icons.home), findsOneWidget);
    });
  });

  group('VMatTabPageSelector', () {
    testWidgets('renders tab page selector', (tester) async {
      await tester.pumpWidget(buildApp(
        const DefaultTabController(
          length: 3,
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: VMatTabBarView(
                    children: [Text('P1'), Text('P2'), Text('P3')],
                  ),
                ),
                VMatTabPageSelector(),
              ],
            ),
          ),
        ),
      ));
      await tester.pump();
      expect(find.byType(VMatTabPageSelector), findsOneWidget);
    });
  });
}
