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
// Visa Nova Flutter Demo TabBar Page
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';

// BEGIN VTabBar
class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  int _selectedIndex = 0;
  bool _useAlternateStyle = false;

  Widget _buildTabBarExamples() {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Default tab bar",
            style: defaultVTheme.textStyles.headline2
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16.0),
          VButton(
            onPressed: _useAlternateStyle
                ? () {
                    setState(() {
                      _useAlternateStyle = false;
                    });
                  }
                : null,
            child: Text(
              "View example",
              style: defaultVTheme.textStyles.buttonMedium.copyWith(
                color: VColors.defaultSurface1,
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          Text(
            "Alternate tab bar",
            style: defaultVTheme.textStyles.headline2
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16.0),
          VButton(
            onPressed: !_useAlternateStyle
                ? () {
                    setState(() {
                      _useAlternateStyle = true;
                    });
                  }
                : null,
            child: Text(
              "View example",
              style: defaultVTheme.textStyles.buttonMedium.copyWith(
                color: VColors.defaultSurface1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const ShowCodeAccordion(
      copyLabel: "Tab bar",
      codeSegment: CodeSegments.VTabBar,
      componentName: 'Tab_Bar',
      exampleName: 'Default_Tab_Bar',
    ),
    Text(
      ' ',
      style: defaultVTheme.textStyles.headline2,
    ),
    Text(
      ' ',
      style: defaultVTheme.textStyles.headline2,
    ),
    Text(
      ' ',
      style: defaultVTheme.textStyles.headline2,
    ),
  ];

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      debugPrint(
          "Tab $index tapped. Updated _selectedIndex to $_selectedIndex");
    });
  }

  @override
  Widget build(BuildContext context) {
    setPageTitle('Tab bar', context);
    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Tab bar"),
        drawer: const MyDrawer(pageTitle: "Tab bar"),
        body: SingleChildScrollView(
          child: _selectedIndex == 0
              ? _buildTabBarExamples()
              : _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: VBottomNavBar(
          style: _useAlternateStyle
              ? VBottomNavBarStyle(
                  backgroundColor: VColors.defaultActive,
                  unselectedItemColor: VColors.defaultActiveSubtleDark,
                  unselectedTextColor: VColors.defaultTextSubtleDark,
                  selectedItemColor: VColors.defaultSurface1,
                  selectedTextColor: VColors.defaultSurface1,
                  indicatorColor: VColors.alternateActive,
                  borderColor: VColors.defaultBorder,
                )
              : null,
          visaBottomNavBarItems: [
            VBottomBarItems(
              icon:
                  _useAlternateStyle ? VIcons.homeLowAlternate : VIcons.homeLow,
              label: 'Label 1',
              preserveIconColors: _useAlternateStyle && _selectedIndex == 0,
            ),
            VBottomBarItems(
              icon: _useAlternateStyle
                  ? VIcons.historyLowAlternate
                  : VIcons.historyLow,
              label: 'Label 2',
              preserveIconColors: _useAlternateStyle && _selectedIndex == 1,
            ),
            VBottomBarItems(
              icon: _useAlternateStyle
                  ? VIcons.settingsLowAlternate
                  : VIcons.settingsLow,
              label: 'Label 3',
              preserveIconColors: _useAlternateStyle && _selectedIndex == 2,
            ),
            VBottomBarItems(
              icon: _useAlternateStyle
                  ? VIcons.reportLowAlternate
                  : VIcons.reportLow,
              label: 'Label 4',
              preserveIconColors: _useAlternateStyle && _selectedIndex == 3,
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
// END
