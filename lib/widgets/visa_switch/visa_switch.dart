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
// Visa switch constructor
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

// VSwitchStyle using ThemeExtension
class VSwitchStyle extends ThemeExtension<VSwitchStyle> {
  const VSwitchStyle({
    this.switchColor,
    this.tagColor,
    this.tagBorderColor,
    this.borderColor,
    this.trackDisabledOff,
    this.trackDisabledOn,
    this.thumbDisabled,
    this.borderDisabledOff,
    this.borderDisabledOn,
    this.thumbBorderDisabled,
  });

  final Color? switchColor, tagColor, tagBorderColor, borderColor;
  final Color? trackDisabledOff; // Track color when disabled and off
  final Color? trackDisabledOn; // Track color when disabled and on
  final Color? thumbDisabled; // Thumb color when disabled
  final Color? borderDisabledOff; // Border color when disabled and off
  final Color? borderDisabledOn; // Border color when disabled and on
  final Color? thumbBorderDisabled; // Thumb border color when disabled

  @override
  VSwitchStyle copyWith({
    Color? switchColor,
    tagColor,
    tagBorderColor,
    borderColor,
    trackDisabledOff,
    trackDisabledOn,
    thumbDisabled,
    borderDisabledOff,
    borderDisabledOn,
    thumbBorderDisabled,
  }) =>
      VSwitchStyle(
        switchColor: switchColor ?? this.switchColor,
        tagColor: tagColor ?? this.tagColor,
        tagBorderColor: tagBorderColor ?? this.tagBorderColor,
        borderColor: borderColor ?? this.borderColor,
        trackDisabledOff: trackDisabledOff ?? this.trackDisabledOff,
        trackDisabledOn: trackDisabledOn ?? this.trackDisabledOn,
        thumbDisabled: thumbDisabled ?? this.thumbDisabled,
        borderDisabledOff: borderDisabledOff ?? this.borderDisabledOff,
        borderDisabledOn: borderDisabledOn ?? this.borderDisabledOn,
        thumbBorderDisabled: thumbBorderDisabled ?? this.thumbBorderDisabled,
      );

  @override
  VSwitchStyle lerp(ThemeExtension<VSwitchStyle>? other, double t) {
    if (other is! VSwitchStyle) {
      return this;
    }

    return VSwitchStyle(
      switchColor: Color.lerp(switchColor, other.switchColor, t),
      tagColor: Color.lerp(tagColor, other.tagColor, t),
      tagBorderColor: Color.lerp(tagBorderColor, other.tagBorderColor, t),
      borderColor: Color.lerp(borderColor, other.borderColor, t),
      trackDisabledOff: Color.lerp(trackDisabledOff, other.trackDisabledOff, t),
      trackDisabledOn: Color.lerp(trackDisabledOn, other.trackDisabledOn, t),
      thumbDisabled: Color.lerp(thumbDisabled, other.thumbDisabled, t),
      borderDisabledOff:
          Color.lerp(borderDisabledOff, other.borderDisabledOff, t),
      borderDisabledOn: Color.lerp(borderDisabledOn, other.borderDisabledOn, t),
      thumbBorderDisabled:
          Color.lerp(thumbBorderDisabled, other.thumbBorderDisabled, t),
    );
  }
}

class VSwitch extends StatefulWidget {
  const VSwitch({
    Key? key,
    required this.switchValue,
    this.isDisabled = false,
    required this.onPressed,
    this.style,
    this.vExt,
  }) : super(key: key);

  // BEGIN Properties
  final bool switchValue;
  final bool isDisabled;
  final VSwitchStyle? style;
  final VExt? vExt;
  // button on pressed
  final Function()? onPressed;
  // END

  @override
  State<VSwitch> createState() => _VSwitchState();
}

class _VSwitchState extends State<VSwitch> {
  bool isPressed = false;
  double switchTagWidth() {
    if (widget.isDisabled && widget.switchValue ||
        widget.isDisabled && !widget.switchValue) {
      return 1;
    }
    if (isPressed || widget.isDisabled || widget.switchValue) {
      return 2;
    }
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    if (widget.vExt == null || widget.vExt is VDef) {
      defaultStyle =
          isDark ? getDefaultColorSchemeDark()! : getDefaultColorScheme()!;
    } else {
      defaultStyle = isDark ? getAltColorSchemeDark()! : getAltColorScheme()!;
    }

    // Get theme-aware toggle colors
    final toggleTrackDisabledOff = isDark
        ? VColors.toggleTrackDisabledOffDark
        : VColors.toggleTrackDisabledOff;
    final toggleTrackDisabledOn = isDark
        ? VColors.toggleTrackDisabledOnDark
        : VColors.toggleTrackDisabledOn;
    final toggleThumbDisabled =
        isDark ? VColors.toggleThumbDisabledDark : VColors.toggleThumbDisabled;

    final tagColor = widget.isDisabled
        ? (widget.style?.thumbDisabled ?? toggleThumbDisabled)
        : (widget.style?.tagColor ?? defaultStyle.surface1);

    Color? switchStateColor() {
      if (isPressed && !widget.switchValue) {
        return widget.style?.switchColor ?? defaultStyle.surfaceLowlight;
      }
      if (isPressed && widget.switchValue) {
        return widget.style?.switchColor ?? defaultStyle.activePressed;
      }
      if (widget.isDisabled && widget.switchValue) {
        return widget.style?.trackDisabledOn ?? toggleTrackDisabledOn;
      }
      if (widget.isDisabled && !widget.switchValue) {
        return widget.style?.trackDisabledOff ?? toggleTrackDisabledOff;
      }
      if (widget.isDisabled) {
        return widget.style?.trackDisabledOff ?? toggleTrackDisabledOff;
      }
      if (widget.switchValue) {
        return widget.style?.switchColor ?? defaultStyle.active;
      }
      if (!widget.switchValue) {
        return widget.style?.switchColor ?? defaultStyle.surface3;
      }
      return widget.style?.switchColor ?? defaultStyle.surface3;
    }

    Color switchBorderStateColor() {
      if (isPressed && !widget.switchValue) {
        return widget.style?.borderColor ?? defaultStyle.active;
      }
      if (widget.isDisabled && !widget.switchValue) {
        return widget.style?.borderDisabledOff ?? toggleTrackDisabledOff;
      }
      if (widget.isDisabled && widget.switchValue) {
        return widget.style?.borderDisabledOn ?? toggleTrackDisabledOn;
      }
      if (widget.isDisabled) {
        return widget.style?.borderDisabledOff ?? toggleTrackDisabledOff;
      }
      if (widget.switchValue) {
        return widget.style?.borderColor ?? defaultStyle.active;
      }
      if (!widget.switchValue) {
        return widget.style?.borderColor ?? defaultStyle.subtle;
      }
      return widget.style?.borderColor ?? defaultStyle.surface3;
    }

    Color switchTagStateColor() {
      if (isPressed && !widget.switchValue) {
        return widget.style?.tagBorderColor ?? defaultStyle.active;
      }
      if (widget.isDisabled && !widget.switchValue) {
        return widget.style?.thumbBorderDisabled ?? toggleThumbDisabled;
      }
      if (widget.isDisabled && widget.switchValue) {
        return widget.style?.thumbBorderDisabled ?? toggleThumbDisabled;
      }
      if (widget.isDisabled) {
        return widget.style?.thumbBorderDisabled ?? toggleThumbDisabled;
      }
      if (!widget.switchValue) {
        return widget.style?.tagBorderColor ?? defaultStyle.subtle;
      }
      if (widget.switchValue) {
        return widget.style?.tagBorderColor ?? defaultStyle.surface1;
      }
      return widget.style?.tagBorderColor ?? defaultStyle.surface3;
    }

    return Semantics(
      container: true,
      toggled: widget.switchValue,
      enabled: widget.onPressed != null,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: widget.onPressed == null || widget.isDisabled == true
              ? null
              : widget.onPressed,
          onTapDown: widget.onPressed == null || widget.isDisabled == true
              ? null
              : ((_) {
                  setState(() {
                    isPressed = !isPressed;
                  });
                }),
          onTapUp: widget.onPressed == null || widget.isDisabled == true
              ? null
              : (_) {
                  setState(() {
                    isPressed = !isPressed;
                  });
                },
          onTapCancel: (() {
            setState(() {
              isPressed = !isPressed;
            });
          }),
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 300,
            ),
            curve: Curves.decelerate,
            width: 55,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: switchStateColor(),
              border: Border.all(
                color: switchBorderStateColor(),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: AnimatedAlign(
                duration: const Duration(
                  milliseconds: 300,
                ),
                alignment: widget.switchValue
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: tagColor,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: switchTagStateColor(),
                      width: switchTagWidth(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
