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
// Visa Nova Flutter Demo Badge Page
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

class BadgePage extends StatelessWidget {
  const BadgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    setPageTitle('Badge', context);
    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Badge"),
        drawer: const MyDrawer(pageTitle: "Badge"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //! Subtle
              smallHeight(),
              SemanticHeader(
                  title: "Subtle badges",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? VColors.defaultTextDark
                          : VColors.defaultText)),
              smallHeight(),
              const SemanticHeader(title: "Default subtle badge"),
              smallHeight(),
              const VBadgeSubtleWithIcon(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeSubtleWithIcon,
                componentName: 'Badge',
                exampleName: 'Subtle_Badge_With_Icon',
                copyLabel: "Subtle badge",
              ),
              smallHeight(),
              const SemanticHeader(title: "Subtle badge without icon"),
              smallHeight(),
              const VBadgeSubtleNoIcon(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeSubtleNoIcon,
                componentName: 'Badge',
                exampleName: 'Subtle_Badge',
                copyLabel: "Subtle badge",
              ),
              smallHeight(),
              const SemanticHeader(title: "Subtle badge with indicator"),
              smallHeight(),
              const VBadgeSubtleEllipse(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeSubtleEllipse,
                componentName: 'Badge',
                exampleName: 'Subtle_Badge_With_Ellipse',
                copyLabel: "Subtle badge",
              ),
              smallHeight(),
              const SemanticHeader(title: "Subtle badge without background"),
              smallHeight(),
              const VBadgeSubtleNoBG(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeSubtleNoBG,
                componentName: 'Badge',
                exampleName: 'Subtle_Badge_Without_Background',
                copyLabel: "Subtle badge",
              ),
              //! Neutral
              smallHeight(),
              SemanticHeader(
                  title: "Neutral badges",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? VColors.defaultTextDark
                          : VColors.defaultText)),
              smallHeight(),
              const SemanticHeader(title: "Default neutral badge"),
              smallHeight(),
              const VBadgeNeutralWithIcon(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeNeutralWithIcon,
                componentName: 'Badge',
                exampleName: 'Subtle_Badge_With_Icon',
                copyLabel: "Neutral badge",
              ),
              smallHeight(),
              const SemanticHeader(title: "Neutral badge without icon"),
              smallHeight(),
              const VBadgeNeutralNoIcon(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeNeutralNoIcon,
                componentName: 'Badge',
                exampleName: 'Subtle_Badge_Without_Icon',
                copyLabel: "Neutral badge",
              ),
              smallHeight(),
              const SemanticHeader(title: "Neutral badge with indicator"),
              smallHeight(),
              const VBadgeNeutralEllipse(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeNeutralEllipse,
                componentName: 'Badge',
                exampleName: 'Neutral_Badge_With_Ellipse',
                copyLabel: "Neutral badge",
              ),
              smallHeight(),
              const SemanticHeader(title: "Neutral badge without background"),
              smallHeight(),
              const VBadgeNeutralNoBG(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeNeutralNoBG,
                componentName: 'Badge',
                exampleName: 'Neutral_Badge_Without_Background',
                copyLabel: "Neutral badge",
              ),
              const SemanticHeader(title: "Neutral icon badge with background"),
              smallHeight(),
              const VIconBadgeNeutral(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VIconBadgeNeutral,
                componentName: 'Badge',
                exampleName: 'Neutral_Icon_Badge_With_Background',
                copyLabel: "Neutral icon badge",
              ),
              const SemanticHeader(
                  title: "Neutral icon badge without background"),
              smallHeight(),
              const VIconBadgeNeutralNoBG(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VIconBadgeNeutralNoBG,
                componentName: 'Badge',
                exampleName: 'Neutral_Icon_Badge_Without_Background',
                copyLabel: "Neutral icon badge",
              ),
              //! Stable
              smallHeight(),
              SemanticHeader(
                  title: "Positive badges",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? VColors.defaultTextDark
                          : VColors.defaultText)),
              smallHeight(),
              const SemanticHeader(title: "Default positive badge"),
              smallHeight(),
              const VBadgeStableWithIcon(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeStableWithIcon,
                componentName: 'Badge',
                exampleName: 'Stable_Badge_With_Icon',
                copyLabel: "Stable badge",
              ),
              smallHeight(),
              const SemanticHeader(title: "Positive badge without icon"),
              smallHeight(),
              const VBadgeStableNoIcon(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeStableNoIcon,
                componentName: 'Badge',
                exampleName: 'Stable_Badge_Without_Icon',
                copyLabel: "Stable badge",
              ),
              smallHeight(),
              const SemanticHeader(title: "Positive badge with indicator"),
              smallHeight(),
              const VBadgeStableEllipse(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeStableEllipse,
                componentName: 'Badge',
                exampleName: 'Stable_Badge_With_Ellipse',
                copyLabel: "Stable badge",
              ),
              smallHeight(),
              const SemanticHeader(title: "Positive badge without background"),
              smallHeight(),
              const VBadgeStableNoBG(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeStableNoBG,
                componentName: 'Badge',
                exampleName: 'Stable_Badge_Without_Background',
                copyLabel: "Stable badge",
              ),
              const SemanticHeader(
                  title: "Positive icon badge with background"),
              smallHeight(),
              const VIconBadgeStable(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VIconBadgeStable,
                componentName: 'Badge',
                exampleName: 'Positive_Icon_Badge_With_Background',
                copyLabel: "Positive icon badge",
              ),
              const SemanticHeader(
                  title: "Positive icon badge without background"),
              smallHeight(),
              const VIconBadgeStableNoBG(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VIconBadgeStableNoBG,
                componentName: 'Badge',
                exampleName: 'Positive_Icon_Badge_Without_Background',
                copyLabel: "Positive icon badge",
              ),
              //! Warning
              smallHeight(),
              SemanticHeader(
                  title: "Warning badges",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? VColors.defaultTextDark
                          : VColors.defaultText)),
              smallHeight(),
              const SemanticHeader(title: "Default warning badge"),
              smallHeight(),
              const VBadgeWarningWithIcon(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeWarningWithIcon,
                componentName: 'Badge',
                exampleName: 'Warning_Badge_With_Icon',
                copyLabel: "Warning badge",
              ),
              smallHeight(),
              const SemanticHeader(title: "Warning badge without icon"),
              smallHeight(),
              const VBadgeWarningNoIcon(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeWarningNoIcon,
                componentName: 'Badge',
                exampleName: 'Warning_Badge_Without_Icon',
                copyLabel: "Warning badge",
              ),
              smallHeight(),
              const SemanticHeader(title: "Warning badge with indicator"),
              smallHeight(),
              const VBadgeWarningEllipse(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeWarningEllipse,
                componentName: 'Badge',
                exampleName: 'Warning_Badge_With_Ellipse',
                copyLabel: "Warning badge",
              ),
              smallHeight(),
              const SemanticHeader(title: "Warning badge without background"),
              smallHeight(),
              const VBadgeWarningNoBG(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeWarningNoBG,
                componentName: 'Badge',
                exampleName: 'Warning_Badge_Without_Background',
                copyLabel: "Warning badge",
              ),
              const SemanticHeader(title: "Warning icon badge with background"),
              smallHeight(),
              const VIconBadgeWarning(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VIconBadgeWarning,
                componentName: 'Badge',
                exampleName: 'Warning_Icon_Badge_With_Background',
                copyLabel: "Warning icon badge",
              ),
              const SemanticHeader(
                  title: "Warning icon badge without background"),
              smallHeight(),
              const VIconBadgeWarningNoBG(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VIconBadgeWarningNoBG,
                componentName: 'Badge',
                exampleName: 'Warning_Icon_Badge_Without_Background',
                copyLabel: "Warning icon badge",
              ),
              //! Critical
              smallHeight(),
              SemanticHeader(
                  title: "Negative badges",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? VColors.defaultTextDark
                          : VColors.defaultText)),
              smallHeight(),
              const SemanticHeader(title: "Default negative badge"),
              smallHeight(),
              const VBadgeCritWithIcon(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeCritWithIcon,
                componentName: 'Badge',
                exampleName: 'Critical_Badge_With_Icon',
                copyLabel: "Critical badge",
              ),
              smallHeight(),
              const SemanticHeader(title: "Negative badge without icon"),
              smallHeight(),
              const VBadgeCritNoIcon(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeCritNoIcon,
                componentName: 'Badge',
                exampleName: 'Critical_Badge_Without_Icon',
                copyLabel: "Critical badge",
              ),
              smallHeight(),
              const SemanticHeader(title: "Negative badge with indicator"),
              smallHeight(),
              const VBadgeCriticalEllipse(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeCriticalEllipse,
                componentName: 'Badge',
                exampleName: 'Critical_Badge_With_Ellipse',
                copyLabel: "Critical badge",
              ),
              smallHeight(),
              const SemanticHeader(title: "Negative badge without background"),
              smallHeight(),
              const VBadgeCritNoBG(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeCritNoBG,
                componentName: 'Badge',
                exampleName: 'Critical_Badge_Without_Background',
                copyLabel: "Critical badge",
              ),
              const SemanticHeader(
                  title: "Negative icon badge with background"),
              smallHeight(),
              const VIconBadgeCritical(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VIconBadgeCritical,
                componentName: 'Badge',
                exampleName: 'Negative_Icon_Badge_With_Background',
                copyLabel: "Negative icon badge",
              ),
              const SemanticHeader(
                  title: "Negative icon badge without background"),
              smallHeight(),
              const VIconBadgeCriticalNoBG(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VIconBadgeCriticalNoBG,
                componentName: 'Badge',
                exampleName: 'Negative_Icon_Badge_Without_Background',
                copyLabel: "Negative icon badge",
              ),
              //! Number
              smallHeight(),
              SemanticHeader(
                  title: "Number badges",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? VColors.defaultTextDark
                          : VColors.defaultText)),
              smallHeight(),
              const SemanticHeader(title: "Short number badge with background"),
              smallHeight(),
              const VBadgeNumberDefault(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeNumberDefault,
                componentName: 'Badge',
                exampleName: 'Number_Badge',
                copyLabel: "Number badge",
              ),
              const SemanticHeader(
                  title: "Short number badge without background"),
              smallHeight(),
              const VBadgeNumberNoBG(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeNumberNoBG,
                componentName: 'Badge',
                exampleName: 'Number_Badge_Without_Background',
                copyLabel: "Number badge",
              ),
              const SemanticHeader(title: "Small indicator badge"),
              smallHeight(),
              const VBadgeNumberEllipse(),
              smallHeight(),
              const ShowCodeAccordion(
                codeSegment: CodeSegments.VBadgeNumberEllipse,
                componentName: 'Badge',
                exampleName: 'Number_Badge_With_Ellipse',
                copyLabel: "Number badge",
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

// BEGIN VIconBadgeNeutral
class VIconBadgeNeutral extends StatelessWidget {
  const VIconBadgeNeutral({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.neutral,
      hasIcon: true,
      hasLabel: false,
    );
  }
}
// END

// BEGIN VIconBadgeNeutralNoBG
class VIconBadgeNeutralNoBG extends StatelessWidget {
  const VIconBadgeNeutralNoBG({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.neutral,
      hasIcon: true,
      hasLabel: false,
      hasBG: false,
    );
  }
}
// END

// BEGIN VIconBadgeStable
class VIconBadgeStable extends StatelessWidget {
  const VIconBadgeStable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.stable,
      hasIcon: true,
      hasLabel: false,
    );
  }
}
// END

// BEGIN VIconBadgeStableNoBG
class VIconBadgeStableNoBG extends StatelessWidget {
  const VIconBadgeStableNoBG({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.stable,
      hasIcon: true,
      hasLabel: false,
      hasBG: false,
    );
  }
}
// END

// BEGIN VIconBadgeWarning
class VIconBadgeWarning extends StatelessWidget {
  const VIconBadgeWarning({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.warning,
      hasIcon: true,
      hasLabel: false,
    );
  }
}
// END

// BEGIN VIconBadgeWarningNoBG
class VIconBadgeWarningNoBG extends StatelessWidget {
  const VIconBadgeWarningNoBG({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.warning,
      hasIcon: true,
      hasLabel: false,
      hasBG: false,
    );
  }
}
// END

// BEGIN VIconBadgeCritical
class VIconBadgeCritical extends StatelessWidget {
  const VIconBadgeCritical({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.critical,
      hasIcon: true,
      hasLabel: false,
    );
  }
}
// END

// BEGIN VIconBadgeCriticalNoBG
class VIconBadgeCriticalNoBG extends StatelessWidget {
  const VIconBadgeCriticalNoBG({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.critical,
      hasIcon: true,
      hasLabel: false,
      hasBG: false,
    );
  }
}
// END

// BEGIN VBadgeSubtleNoIcon
class VBadgeSubtleNoIcon extends StatelessWidget {
  const VBadgeSubtleNoIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.subtle,
      hasIcon: false,
    );
  }
}
// END

// BEGIN VBadgeSubtleWithIcon
class VBadgeSubtleWithIcon extends StatelessWidget {
  const VBadgeSubtleWithIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.subtle,
    );
  }
}
// END

// BEGIN VBadgeSubtleNoBG
class VBadgeSubtleNoBG extends StatelessWidget {
  const VBadgeSubtleNoBG({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.subtle,
      hasEllipse: true,
      hasIcon: false,
      hasBG: false,
    );
  }
}
// END

// BEGIN VBadgeNeutralNoIcon
class VBadgeNeutralNoIcon extends StatelessWidget {
  const VBadgeNeutralNoIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.neutral,
      hasIcon: false,
    );
  }
}
// END

// BEGIN VBadgeNeutralWithIcon
class VBadgeNeutralWithIcon extends StatelessWidget {
  const VBadgeNeutralWithIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.neutral,
    );
  }
}
// END

// BEGIN VBadgeNeutralNoBG
class VBadgeNeutralNoBG extends StatelessWidget {
  const VBadgeNeutralNoBG({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.neutral,
      hasBG: false,
      hasIcon: false,
      hasEllipse: true,
    );
  }
}
// END

// BEGIN VBadgeStableNoIcon
class VBadgeStableNoIcon extends StatelessWidget {
  const VBadgeStableNoIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.stable,
      hasIcon: false,
    );
  }
}
// END

// BEGIN VBadgeStableWithIcon
class VBadgeStableWithIcon extends StatelessWidget {
  const VBadgeStableWithIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.stable,
    );
  }
}
// END

// BEGIN VBadgeStableNoBG
class VBadgeStableNoBG extends StatelessWidget {
  const VBadgeStableNoBG({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.stable,
      hasBG: false,
      hasIcon: false,
      hasEllipse: true,
    );
  }
}
// END

// BEGIN VBadgeWarningNoIcon
class VBadgeWarningNoIcon extends StatelessWidget {
  const VBadgeWarningNoIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.warning,
      hasIcon: false,
    );
  }
}
// END

// BEGIN VBadgeWarningWithIcon
class VBadgeWarningWithIcon extends StatelessWidget {
  const VBadgeWarningWithIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.warning,
    );
  }
}
// END

// BEGIN VBadgeWarningNoBG
class VBadgeWarningNoBG extends StatelessWidget {
  const VBadgeWarningNoBG({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.warning,
      hasBG: false,
      hasIcon: false,
      hasEllipse: true,
    );
  }
}
// END

// BEGIN VBadgeCritNoIcon
class VBadgeCritNoIcon extends StatelessWidget {
  const VBadgeCritNoIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.critical,
      hasIcon: false,
    );
  }
}
// END

// BEGIN VBadgeCritWithIcon
class VBadgeCritWithIcon extends StatelessWidget {
  const VBadgeCritWithIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.critical,
    );
  }
}
// END

// BEGIN VBadgeCritNoBG
class VBadgeCritNoBG extends StatelessWidget {
  const VBadgeCritNoBG({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.critical,
      hasBG: false,
      hasIcon: false,
      hasEllipse: true,
    );
  }
}
// END

// BEGIN VBadgeNumberDefault
class VBadgeNumberDefault extends StatelessWidget {
  const VBadgeNumberDefault({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: VBadge(
        badgeState: BadgeState.number,
        label: "9",
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
          child: Semantics(
            label: "notifications",
            child: const VIcon(
              svgIcon: VIcons.notificationsLow,
              iconColor: VColors.defaultActive,
              iconWidth: 24,
              iconHeight: 24,
            ),
          ),
        ),
      ),
    );
  }
}
// END

// BEGIN VBadgeNumberEllipse
class VBadgeNumberEllipse extends StatelessWidget {
  const VBadgeNumberEllipse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "attention needed",
      child: VBadge(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
          child: Semantics(
            label: 'notifications',
            child: const VIcon(
              svgIcon: VIcons.notificationsLow,
              iconColor: VColors.defaultActive,
            ),
          ),
        ),
        badgeState: BadgeState.number,
        hasLabel: false,
      ),
    );
  }
}
// END

// BEGIN VBadgeSubtleEllipse
class VBadgeSubtleEllipse extends StatelessWidget {
  const VBadgeSubtleEllipse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.subtle,
      hasIcon: false,
      hasEllipse: true,
    );
  }
}
// END

// BEGIN VBadgeNeutralEllipse
class VBadgeNeutralEllipse extends StatelessWidget {
  const VBadgeNeutralEllipse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.neutral,
      hasIcon: false,
      hasEllipse: true,
    );
  }
}
// END

// BEGIN VBadgeStableEllipse
class VBadgeStableEllipse extends StatelessWidget {
  const VBadgeStableEllipse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.stable,
      hasIcon: false,
      hasEllipse: true,
    );
  }
}
// END

// BEGIN VBadgeWarningEllipse
class VBadgeWarningEllipse extends StatelessWidget {
  const VBadgeWarningEllipse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.warning,
      hasIcon: false,
      hasEllipse: true,
    );
  }
}
// END

// BEGIN VBadgeCriticalEllipse
class VBadgeCriticalEllipse extends StatelessWidget {
  const VBadgeCriticalEllipse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VBadge(
      badgeState: BadgeState.critical,
      hasIcon: false,
      hasEllipse: true,
    );
  }
}
// END

// BEGIN VBadgeNumberNoBG
class VBadgeNumberNoBG extends StatelessWidget {
  const VBadgeNumberNoBG({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Badge(
        backgroundColor: Colors.transparent,
        label: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: VColors.negativeText, width: 1),
            borderRadius: BorderRadius.circular(
                9), // Half of width/height for perfect circle
          ),
          child: Center(
            child: Text(
              "9",
              style: defaultVTheme.textStyles.uiLabelActive.copyWith(
                color: VColors.negativeText,
                height: 1.0,
              ),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
          child: Semantics(
            label: "notifications",
            child: const VIcon(
              svgIcon: VIcons.notificationsLow,
              iconColor: VColors.defaultActive,
              iconWidth: 24,
              iconHeight: 24,
            ),
          ),
        ),
      ),
    );
  }
}
// END
