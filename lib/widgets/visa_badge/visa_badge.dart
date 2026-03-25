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
// VPDS Flutter Badge
import 'package:flutter/material.dart';
// import 'package:flutter/semantics.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

// VBadgeStyle using ThemeExtension
class VBadgeStyle extends ThemeExtension<VBadgeStyle> {
  const VBadgeStyle({
    this.criticalBGColor,
    this.neutralBGColor,
    this.stableBGColor,
    this.subtleBGColor,
    this.warningBGColor,
    this.criticalIconColor,
    this.neutralIconColor,
    this.stableIconColor,
    this.subtleIconColor,
    this.warningIconColor,
    this.numberColor,
  });

  final Color? criticalBGColor,
      neutralBGColor,
      stableBGColor,
      subtleBGColor,
      warningBGColor,
      criticalIconColor,
      neutralIconColor,
      stableIconColor,
      subtleIconColor,
      warningIconColor,
      numberColor;

  @override
  VBadgeStyle copyWith({
    Color? criticalBGColor,
    neutralBGColor,
    stableBGColor,
    subtleBGColor,
    warningBGColor,
    criticalIconColor,
    neutralIconColor,
    stableIconColor,
    subtleIconColor,
    warningIconColor,
    numberColor,
  }) =>
      VBadgeStyle(
        criticalBGColor: criticalBGColor ?? this.criticalBGColor,
        neutralBGColor: neutralBGColor ?? this.neutralBGColor,
        stableBGColor: stableBGColor ?? this.stableBGColor,
        subtleBGColor: subtleBGColor ?? this.subtleBGColor,
        warningBGColor: warningBGColor ?? this.warningBGColor,
        criticalIconColor: criticalIconColor ?? this.criticalIconColor,
        neutralIconColor: neutralIconColor ?? this.neutralIconColor,
        stableIconColor: stableIconColor ?? this.stableIconColor,
        subtleIconColor: subtleIconColor ?? this.subtleIconColor,
        warningIconColor: warningIconColor ?? this.warningIconColor,
        numberColor: numberColor ?? this.numberColor,
      );

  @override
  VBadgeStyle lerp(ThemeExtension<VBadgeStyle>? other, double t) {
    if (other is! VBadgeStyle) {
      return this;
    }

    return VBadgeStyle(
      criticalBGColor: Color.lerp(criticalBGColor, other.criticalBGColor, t),
      neutralBGColor: Color.lerp(neutralBGColor, other.neutralBGColor, t),
      stableBGColor: Color.lerp(stableBGColor, other.stableBGColor, t),
      subtleBGColor: Color.lerp(subtleBGColor, other.subtleBGColor, t),
      warningBGColor: Color.lerp(warningBGColor, other.warningBGColor, t),
      criticalIconColor:
          Color.lerp(criticalIconColor, other.criticalIconColor, t),
      neutralIconColor: Color.lerp(neutralIconColor, other.neutralIconColor, t),
      stableIconColor: Color.lerp(stableIconColor, other.stableIconColor, t),
      subtleIconColor: Color.lerp(subtleIconColor, other.subtleIconColor, t),
      warningIconColor: Color.lerp(warningIconColor, other.warningIconColor, t),
      numberColor: Color.lerp(numberColor, other.numberColor, t),
    );
  }
}

enum BadgeState { critical, neutral, stable, subtle, warning, number }

// ignore: must_be_immutable
class VBadge extends StatelessWidget {
  VBadge({
    Key? key,
    this.badgeState = BadgeState.subtle,
    this.label = "Label",
    this.style,
    this.hasBG = true,
    this.hasIcon = true,
    this.hasLabel = true,
    this.hasEllipse = false,
    this.backgroundColor,
    this.badgeIcon,
    this.badgeEllipse,
    this.child,
    this.offset,
  }) : super(key: key);

  final BadgeState badgeState;
  final String label;
  final VBadgeStyle? style;
  final bool hasBG, hasIcon, hasLabel, hasEllipse;
  Color? backgroundColor;
  Widget? badgeIcon, badgeEllipse;
  final Widget? child;
  final Offset? offset;

  @override
  Widget build(BuildContext context) {
    final messageStyle = getMessageColorScheme()!;
    final criticalBGColor =
        style?.criticalBGColor ?? messageStyle.negativeSurface;
    final neutralBGColor = style?.neutralBGColor ?? messageStyle.infoSurface;
    final stableBGColor = style?.stableBGColor ?? messageStyle.positiveSurface;
    final subtleBGColor = style?.subtleBGColor ??
        messageStyle.defaultText?.withValues(alpha: 0.1);
    final warningBGColor = style?.warningBGColor ?? messageStyle.warningSurface;
    final criticalIconColor =
        style?.criticalIconColor ?? messageStyle.negativeText;
    final neutralIconColor = style?.neutralIconColor ?? messageStyle.infoText;
    final stableIconColor = style?.stableIconColor ?? messageStyle.positiveText;
    final subtleIconColor = style?.subtleIconColor ?? messageStyle.subtleText;
    final warningIconColor =
        style?.warningIconColor ?? messageStyle.warningText;
    final numberColor = style?.numberColor ?? messageStyle.negativeText;

    switch (badgeState) {
      case BadgeState.critical:
        backgroundColor = hasLabel ? criticalBGColor : Colors.transparent;
        badgeIcon = hasLabel
            ? VIcon(
                svgIcon: VIcons.errorTiny,
                iconHeight: 18,
                iconWidth: 18,
                iconColor: criticalIconColor,
              )
            : Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: hasBG ? criticalIconColor : Colors.transparent,
                  border: hasBG
                      ? null
                      : Border.all(color: criticalIconColor!, width: 1),
                ),
                child: Center(
                  child: VIcon(
                    svgIcon: VIcons.errorAltTiny,
                    iconHeight: 10,
                    iconWidth: 10,
                    iconColor:
                        hasBG ? VColors.defaultSurface1 : criticalIconColor,
                  ),
                ),
              );
        badgeEllipse = Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: criticalIconColor),
        );
        break;
      case BadgeState.neutral:
        backgroundColor = hasLabel ? neutralBGColor : Colors.transparent;
        badgeIcon = Container(
          height: 16,
          width: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: hasBG ? neutralIconColor : Colors.transparent,
            border:
                hasBG ? null : Border.all(color: neutralIconColor!, width: 1),
          ),
          child: Center(
            child: VIcon(
              svgIcon: VIcons.informationAltTiny,
              iconHeight: 10,
              iconWidth: 10,
              iconColor: hasBG ? VColors.defaultSurface1 : neutralIconColor,
            ),
          ),
        );
        badgeEllipse = Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: neutralIconColor),
        );
        break;
      case BadgeState.number:
        backgroundColor = numberColor;
        break;
      case BadgeState.stable:
        backgroundColor = hasLabel ? stableBGColor : Colors.transparent;
        badgeIcon = Container(
          height: 16,
          width: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: hasBG ? stableIconColor : Colors.transparent,
            border:
                hasBG ? null : Border.all(color: stableIconColor!, width: 1),
          ),
          child: Center(
            child: VIcon(
              svgIcon: VIcons.checkmarkTiny,
              iconHeight: 10,
              iconWidth: 10,
              iconColor: hasBG ? VColors.defaultSurface1 : stableIconColor,
            ),
          ),
        );
        badgeEllipse = Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: stableIconColor),
        );
        break;
      case BadgeState.subtle:
        backgroundColor = subtleBGColor;
        badgeIcon = VIcon(
          svgIcon: VIcons.historyTiny,
          iconHeight: 18,
          iconWidth: 18,
          iconColor: subtleIconColor,
        );
        badgeEllipse = Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: subtleIconColor),
        );
        break;
      case BadgeState.warning:
        backgroundColor = hasLabel ? warningBGColor : Colors.transparent;
        badgeIcon = hasLabel
            ? VIcon(
                svgIcon: VIcons.warningTiny,
                iconHeight: 18,
                iconWidth: 18,
                iconColor: warningIconColor,
              )
            : Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: hasBG ? warningIconColor : Colors.transparent,
                  border: hasBG
                      ? null
                      : Border.all(color: warningIconColor!, width: 1),
                ),
                child: Center(
                  child: VIcon(
                    svgIcon: VIcons.warningTiny,
                    iconHeight: 10,
                    iconWidth: 10,
                    iconColor:
                        hasBG ? VColors.defaultSurface1 : warningIconColor,
                  ),
                ),
              );
        badgeEllipse = Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: warningIconColor),
        );
        break;
    }

    return badgeState == BadgeState.number
        ? VBadgeNumber(
            numberColor: numberColor,
            hasLabel: hasLabel,
            label: label,
            offset: offset,
            child: child,
          )
        : VBadgeLabel(
            badgeEllipse: badgeEllipse,
            hasEllipse: hasEllipse,
            hasBG: hasBG,
            backgroundColor: backgroundColor,
            hasIcon: hasIcon,
            hasLabel: hasLabel,
            badgeIcon: badgeIcon,
            label: label,
          );
  }
}

class VBadgeLabel extends StatelessWidget {
  const VBadgeLabel({
    super.key,
    required this.hasBG,
    required this.backgroundColor,
    required this.hasIcon,
    required this.hasEllipse,
    required this.hasLabel,
    required this.badgeIcon,
    required this.badgeEllipse,
    required this.label,
  });

  final bool hasBG, hasIcon, hasEllipse, hasLabel;
  final String label;
  final Color? backgroundColor;
  final Widget? badgeIcon, badgeEllipse;

  @override
  Widget build(BuildContext context) {
    var badgeRow = [
      if (hasIcon)
        Row(
          children: [
            badgeIcon!,
            if (hasLabel)
              const SizedBox(
                width: 2.5,
              ),
          ],
        ),
      if (hasEllipse)
        Row(
          children: [
            badgeEllipse!,
            if (hasLabel)
              const SizedBox(
                width: 2.5,
              ),
          ],
        ),
      if (hasLabel)
        Text(
          label,
          style: defaultVTheme.textStyles.uiLabelSmall,
        ),
    ];
    return Container(
      height: 28,
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: hasBG ? badgeBG() : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: badgeRow,
      ),
    );
  }

  BoxDecoration badgeBG() {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(6),
    );
  }
}

class VBadgeNumber extends StatelessWidget {
  const VBadgeNumber({
    super.key,
    required this.numberColor,
    required this.hasLabel,
    required this.label,
    this.child,
    this.offset,
  });

  final bool hasLabel;
  final String label;
  final Color? numberColor;
  final Widget? child;
  final Offset? offset;

  @override
  Widget build(BuildContext context) {
    return Badge(
      backgroundColor: Colors.transparent,
      label: hasLabel
          ? Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: numberColor,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Center(
                child: Text(
                  label,
                  style: defaultVTheme.textStyles.uiLabelActive.copyWith(
                    color: VColors.defaultSurface1,
                    height: 1.0,
                  ),
                ),
              ),
            )
          : Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: numberColor,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
      smallSize: 10,
      child: child,
    );
  }
}
