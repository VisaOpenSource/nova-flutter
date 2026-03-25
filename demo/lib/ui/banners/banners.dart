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
// Visa Nova Flutter Demo Banner Page
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

enum BannerType {
  none,
  infoDefault,
  warningDefault,
  errorDefault,
  successDefault,
  infoWithTitle,
  warningWithTitle,
  errorWithTitle,
  successWithTitle,
  infoWithButton,
  warningWithButton,
  errorWithButton,
  successWithButton,
  infoPersistent,
  warningPersistent,
  errorPersistent,
  successPersistent,
  infoWithCloseIcon,
  warningWithCloseIcon,
  errorWithCloseIcon,
  successWithCloseIcon,
  custom,
}

// ignore: must_be_immutable
class Banners extends StatefulWidget {
  Banners({
    Key? key,
    this.infoBannerDefault = false,
    this.warningBannerDefault = false,
    this.errorBannerDefault = false,
    this.successBannerDefault = false,
    this.infoBannerWithTitle = false,
    this.warningBannerWithTitle = false,
    this.errorBannerWithTitle = false,
    this.successBannerWithTitle = false,
    this.infoBannerWithButton = false,
    this.warningBannerWithButton = false,
    this.errorBannerWithButton = false,
    this.successBannerWithButton = false,
    this.infoBannerPersistent = false,
    this.warningBannerPersistent = false,
    this.errorBannerPersistent = false,
    this.successBannerPersistent = false,
    this.infoBannerWithCloseIcon = false,
    this.warningBannerWithCloseIcon = false,
    this.errorBannerWithCloseIcon = false,
    this.successBannerWithCloseIcon = false,
    this.customBanner = false,
  }) : super(key: key);

  @override
  State<Banners> createState() => _BannersState();

  bool infoBannerDefault,
      warningBannerDefault,
      errorBannerDefault,
      successBannerDefault,
      infoBannerWithTitle,
      warningBannerWithTitle,
      errorBannerWithTitle,
      successBannerWithTitle,
      infoBannerWithButton,
      warningBannerWithButton,
      errorBannerWithButton,
      successBannerWithButton,
      infoBannerPersistent,
      warningBannerPersistent,
      errorBannerPersistent,
      successBannerPersistent,
      infoBannerWithCloseIcon,
      warningBannerWithCloseIcon,
      errorBannerWithCloseIcon,
      successBannerWithCloseIcon,
      customBanner;
}

class _BannersState extends State<Banners> {
  // Helper method to show only one banner at a time
  void showOnlyBanner(void Function() bannerSetter) {
    setState(() {
      // Reset all banners to false
      widget.infoBannerDefault = false;
      widget.warningBannerDefault = false;
      widget.errorBannerDefault = false;
      widget.successBannerDefault = false;
      widget.infoBannerWithTitle = false;
      widget.warningBannerWithTitle = false;
      widget.errorBannerWithTitle = false;
      widget.successBannerWithTitle = false;
      widget.infoBannerWithButton = false;
      widget.warningBannerWithButton = false;
      widget.errorBannerWithButton = false;
      widget.successBannerWithButton = false;
      widget.infoBannerPersistent = false;
      widget.warningBannerPersistent = false;
      widget.errorBannerPersistent = false;
      widget.successBannerPersistent = false;
      widget.infoBannerWithCloseIcon = false;
      widget.warningBannerWithCloseIcon = false;
      widget.errorBannerWithCloseIcon = false;
      widget.successBannerWithCloseIcon = false;
      widget.customBanner = false;

      // Then set the specific banner to true
      bannerSetter();
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    setPageTitle('Banner', context);
    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Banner"),
        drawer: const MyDrawer(pageTitle: "Banner"),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // ! Default Banners
              VBannerInfoDefault(
                visible: widget.infoBannerDefault,
                onLinkPressed: () {
                  setState(() {
                    widget.infoBannerDefault = false;
                  });
                },
              ),
              VBannerWarningDefault(
                visible: widget.warningBannerDefault,
                onLinkPressed: () {
                  setState(() {
                    widget.warningBannerDefault = false;
                  });
                },
              ),
              VBannerErrorDefault(
                visible: widget.errorBannerDefault,
                onLinkPressed: () {
                  setState(() {
                    widget.errorBannerDefault = false;
                  });
                },
              ),
              VBannerSuccessDefault(
                visible: widget.successBannerDefault,
                onLinkPressed: () {
                  setState(() {
                    widget.successBannerDefault = false;
                  });
                },
              ),
              // ! Banners with title
              VBannerInfoWithTitle(
                visible: widget.infoBannerWithTitle,
                onLinkPressed: () {
                  setState(() {
                    widget.infoBannerWithTitle = false;
                  });
                },
              ),
              VBannerWarningWithTitle(
                visible: widget.warningBannerWithTitle,
                onLinkPressed: () {
                  setState(() {
                    widget.warningBannerWithTitle = false;
                  });
                },
              ),
              VBannerErrorWithTitle(
                visible: widget.errorBannerWithTitle,
                onLinkPressed: () {
                  setState(() {
                    widget.errorBannerWithTitle = false;
                  });
                },
              ),
              VBannerSuccessWithTitle(
                visible: widget.successBannerWithTitle,
                onLinkPressed: () {
                  setState(() {
                    widget.successBannerWithTitle = false;
                  });
                },
              ),
              // ! Banners with Button
              VBannerInfoWithButton(
                visible: widget.infoBannerWithButton,
                onLinkPressed: () {
                  setState(() {
                    widget.infoBannerWithButton = false;
                  });
                },
                onActionPressed: () {},
              ),
              VBannerWarningWithButton(
                visible: widget.warningBannerWithButton,
                onLinkPressed: () {
                  setState(() {
                    widget.warningBannerWithButton = false;
                  });
                },
                onActionPressed: () {},
              ),
              VBannerErrorWithButton(
                visible: widget.errorBannerWithButton,
                onLinkPressed: () {
                  setState(() {
                    widget.errorBannerWithButton = false;
                  });
                },
                onActionPressed: () {},
              ),
              VBannerSuccessWithButton(
                visible: widget.successBannerWithButton,
                onLinkPressed: () {
                  setState(() {
                    widget.successBannerWithButton = false;
                  });
                },
                onActionPressed: () {},
              ),
              // ! Persistent Banners
              VBannerInfoPersistent(
                visible: widget.infoBannerPersistent,
              ),
              VBannerWarningPersistent(
                visible: widget.warningBannerPersistent,
              ),
              VBannerErrorPersistent(
                visible: widget.errorBannerPersistent,
              ),
              VBannerSuccessPersistent(
                visible: widget.successBannerPersistent,
              ),
              // ! Close Icon Banners
              VBannerInfoWithCloseIcon(
                visible: widget.infoBannerWithCloseIcon,
                onClosePressed: () {
                  setState(() {
                    widget.infoBannerWithCloseIcon = false;
                  });
                },
              ),
              VBannerWarningWithCloseIcon(
                visible: widget.warningBannerWithCloseIcon,
                onClosePressed: () {
                  setState(() {
                    widget.warningBannerWithCloseIcon = false;
                  });
                },
              ),
              VBannerErrorWithCloseIcon(
                visible: widget.errorBannerWithCloseIcon,
                onClosePressed: () {
                  setState(() {
                    widget.errorBannerWithCloseIcon = false;
                  });
                },
              ),
              VBannerSuccessWithCloseIcon(
                visible: widget.successBannerWithCloseIcon,
                onClosePressed: () {
                  setState(() {
                    widget.successBannerWithCloseIcon = false;
                  });
                },
              ),
              // ! Custom Banners
              VBannerCustom(
                visible: widget.customBanner,
                onClosePressed: () {
                  setState(() {
                    widget.customBanner = false;
                  });
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ! Informational Banner examples
                            SemanticHeader(
                              title: "Informational banners",
                              style: defaultVTheme.textStyles.headline2
                                  .copyWith(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? VColors.defaultTextDark
                                          : VColors.defaultText),
                            ),
                            smallHeight(),
                            const SemanticHeader(
                                title: "Default informational banner"),
                            smallHeight(),
                            VButton(
                              style: VButtonStyle(
                                backgroundColorActive: VColors.transparent,
                                backgroundColorDisabled: VColors.transparent,
                                foregroundColorActive: VColors.defaultActive,
                                foregroundColorDisabled: VColors.disabled,
                                overlayColorFocused:
                                    VColors.defaultSurfaceLowlight,
                                overlayColorPressed:
                                    VColors.defaultSurfaceLowlight,
                                borderSideActive: const BorderSide(
                                  color: VColors.defaultActive,
                                  style: BorderStyle.solid,
                                ),
                                borderSideDisabled: BorderSide(
                                  color: VColors.defaultDisabled,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Text(
                                  style: defaultVTheme.textStyles.buttonMedium
                                      .copyWith(
                                    color: VColors.defaultActive,
                                  ),
                                  "Show default informational banner"),
                              onPressed: () {
                                showOnlyBanner(
                                    () => widget.infoBannerDefault = true);
                              },
                            ),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment: CodeSegments.VBannerInfoDefault,
                              componentName: 'Banner',
                              exampleName: 'Informational_Banner',
                              copyLabel: "Default banners",
                            ),
                            smallHeight(),
                            const SemanticHeader(
                                title: "Informational banner with title"),
                            smallHeight(),
                            VButton(
                              style: VButtonStyle(
                                backgroundColorActive: VColors.transparent,
                                backgroundColorDisabled: VColors.transparent,
                                foregroundColorActive: VColors.defaultActive,
                                foregroundColorDisabled: VColors.disabled,
                                overlayColorFocused:
                                    VColors.defaultSurfaceLowlight,
                                overlayColorPressed:
                                    VColors.defaultSurfaceLowlight,
                                borderSideActive: const BorderSide(
                                  color: VColors.defaultActive,
                                  style: BorderStyle.solid,
                                ),
                                borderSideDisabled: BorderSide(
                                  color: VColors.defaultDisabled,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Text(
                                  style: defaultVTheme.textStyles.buttonMedium
                                      .copyWith(
                                    color: VColors.defaultActive,
                                  ),
                                  "Show informational banner with title"),
                              onPressed: () {
                                showOnlyBanner(
                                    () => widget.infoBannerWithTitle = true);
                              },
                            ),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment: CodeSegments.VBannerInfoWithTitle,
                              componentName: 'Banner',
                              exampleName: 'Informational_Banner_With_Title',
                              copyLabel: "Banners with title",
                            ),
                            smallHeight(),
                            const SemanticHeader(
                                title: "Informational banner with button"),
                            smallHeight(),
                            VButton(
                              style: VButtonStyle(
                                backgroundColorActive: VColors.transparent,
                                backgroundColorDisabled: VColors.transparent,
                                foregroundColorActive: VColors.defaultActive,
                                foregroundColorDisabled: VColors.disabled,
                                overlayColorFocused:
                                    VColors.defaultSurfaceLowlight,
                                overlayColorPressed:
                                    VColors.defaultSurfaceLowlight,
                                borderSideActive: const BorderSide(
                                  color: VColors.defaultActive,
                                  style: BorderStyle.solid,
                                ),
                                borderSideDisabled: BorderSide(
                                  color: VColors.defaultDisabled,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Text(
                                  style: defaultVTheme.textStyles.buttonMedium
                                      .copyWith(
                                    color: VColors.defaultActive,
                                  ),
                                  "Show informational banner with button"),
                              onPressed: () {
                                showOnlyBanner(
                                    () => widget.infoBannerWithButton = true);
                              },
                            ),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment: CodeSegments.VBannerInfoWithButton,
                              componentName: 'Banner',
                              exampleName: 'Informational_Banner_With_Button',
                              copyLabel: "Banners with button",
                            ),
                            smallHeight(),
                            const SemanticHeader(
                                title:
                                    "Informational banner with close icon button"),
                            smallHeight(),
                            VButton(
                                style: VButtonStyle(
                                  backgroundColorActive: VColors.transparent,
                                  backgroundColorDisabled: VColors.transparent,
                                  foregroundColorActive: VColors.defaultActive,
                                  foregroundColorDisabled: VColors.disabled,
                                  overlayColorFocused:
                                      VColors.defaultSurfaceLowlight,
                                  overlayColorPressed:
                                      VColors.defaultSurfaceLowlight,
                                  borderSideActive: const BorderSide(
                                    color: VColors.defaultActive,
                                    style: BorderStyle.solid,
                                  ),
                                  borderSideDisabled: BorderSide(
                                    color: VColors.defaultDisabled,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Text(
                                    style: defaultVTheme.textStyles.buttonMedium
                                        .copyWith(
                                      color: VColors.defaultActive,
                                    ),
                                    "Show informational banner with close icon"),
                                onPressed: () {
                                  showOnlyBanner(() =>
                                      widget.infoBannerWithCloseIcon = true);
                                }),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment:
                                  CodeSegments.VBannerInfoWithCloseIcon,
                              componentName: 'Banner',
                              exampleName:
                                  'Informational_Banner_With_Close_Icon',
                              copyLabel: "Banners with close icon",
                            ),
                            smallHeight(),
                            const SemanticHeader(
                                title:
                                    "Informational banner without close link"),
                            smallHeight(),
                            VButton(
                              style: VButtonStyle(
                                backgroundColorActive: VColors.transparent,
                                backgroundColorDisabled: VColors.transparent,
                                foregroundColorActive: VColors.defaultActive,
                                foregroundColorDisabled: VColors.disabled,
                                overlayColorFocused:
                                    VColors.defaultSurfaceLowlight,
                                overlayColorPressed:
                                    VColors.defaultSurfaceLowlight,
                                borderSideActive: const BorderSide(
                                  color: VColors.defaultActive,
                                  style: BorderStyle.solid,
                                ),
                                borderSideDisabled: BorderSide(
                                  color: VColors.defaultDisabled,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Text(
                                  style: defaultVTheme.textStyles.buttonMedium
                                      .copyWith(
                                    color: VColors.defaultActive,
                                  ),
                                  "Show informational banner without close link"),
                              onPressed: () {
                                showOnlyBanner(
                                    () => widget.infoBannerPersistent = true);
                              },
                            ),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment: CodeSegments.VBannerInfoWithButton,
                              componentName: 'Banner',
                              exampleName: 'Informational_Banner_With_Button',
                              copyLabel: "Persistent banners",
                            ),
                            smallHeight(),
                            // ! Success Banner examples
                            SemanticHeader(
                              title: "Success banners",
                              style: defaultVTheme.textStyles.headline2
                                  .copyWith(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? VColors.defaultTextDark
                                          : VColors.defaultText),
                            ),
                            smallHeight(),
                            const SemanticHeader(
                                title: "Default success banner"),
                            smallHeight(),
                            VButton(
                                style: VButtonStyle(
                                  backgroundColorActive: VColors.transparent,
                                  backgroundColorDisabled: VColors.transparent,
                                  foregroundColorActive: VColors.defaultActive,
                                  foregroundColorDisabled: VColors.disabled,
                                  overlayColorFocused:
                                      VColors.defaultSurfaceLowlight,
                                  overlayColorPressed:
                                      VColors.defaultSurfaceLowlight,
                                  borderSideActive: const BorderSide(
                                    color: VColors.defaultActive,
                                    style: BorderStyle.solid,
                                  ),
                                  borderSideDisabled: BorderSide(
                                    color: VColors.defaultDisabled,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Text(
                                    style: defaultVTheme.textStyles.buttonMedium
                                        .copyWith(
                                      color: VColors.defaultActive,
                                    ),
                                    "Show default success banner"),
                                onPressed: () {
                                  showOnlyBanner(
                                      () => widget.successBannerDefault = true);
                                }),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment: CodeSegments.VBannerSuccessDefault,
                              componentName: 'Banner',
                              exampleName: 'Success_Banner',
                              copyLabel: "Default banners",
                            ),
                            smallHeight(),

                            const SemanticHeader(
                                title: "Success banner with title"),
                            smallHeight(),
                            VButton(
                                style: VButtonStyle(
                                  backgroundColorActive: VColors.transparent,
                                  backgroundColorDisabled: VColors.transparent,
                                  foregroundColorActive: VColors.defaultActive,
                                  foregroundColorDisabled: VColors.disabled,
                                  overlayColorFocused:
                                      VColors.defaultSurfaceLowlight,
                                  overlayColorPressed:
                                      VColors.defaultSurfaceLowlight,
                                  borderSideActive: const BorderSide(
                                    color: VColors.defaultActive,
                                    style: BorderStyle.solid,
                                  ),
                                  borderSideDisabled: BorderSide(
                                    color: VColors.defaultDisabled,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Text(
                                    style: defaultVTheme.textStyles.buttonMedium
                                        .copyWith(
                                      color: VColors.defaultActive,
                                    ),
                                    "Show success banner with title"),
                                onPressed: () {
                                  showOnlyBanner(() =>
                                      widget.successBannerWithTitle = true);
                                }),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment: CodeSegments.VBannerSuccessWithTitle,
                              componentName: 'Banner',
                              exampleName: 'Success_Banner_With_Title',
                              copyLabel: "Banners with title",
                            ),
                            smallHeight(),
                            const SemanticHeader(
                                title: "Success banner with button"),
                            smallHeight(),
                            VButton(
                                style: VButtonStyle(
                                  backgroundColorActive: VColors.transparent,
                                  backgroundColorDisabled: VColors.transparent,
                                  foregroundColorActive: VColors.defaultActive,
                                  foregroundColorDisabled: VColors.disabled,
                                  overlayColorFocused:
                                      VColors.defaultSurfaceLowlight,
                                  overlayColorPressed:
                                      VColors.defaultSurfaceLowlight,
                                  borderSideActive: const BorderSide(
                                    color: VColors.defaultActive,
                                    style: BorderStyle.solid,
                                  ),
                                  borderSideDisabled: BorderSide(
                                    color: VColors.defaultDisabled,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Text(
                                    style: defaultVTheme.textStyles.buttonMedium
                                        .copyWith(
                                      color: VColors.defaultActive,
                                    ),
                                    "Show success banner with button"),
                                onPressed: () {
                                  showOnlyBanner(() =>
                                      widget.successBannerWithButton = true);
                                }),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment:
                                  CodeSegments.VBannerSuccessWithButton,
                              componentName: 'Banner',
                              exampleName: 'Success_Banner_With_Button',
                              copyLabel: "Banners with button",
                            ),
                            smallHeight(),
                            const SemanticHeader(
                                title: "Success banner with close icon button"),
                            smallHeight(),
                            VButton(
                                style: VButtonStyle(
                                  backgroundColorActive: VColors.transparent,
                                  backgroundColorDisabled: VColors.transparent,
                                  foregroundColorActive: VColors.defaultActive,
                                  foregroundColorDisabled: VColors.disabled,
                                  overlayColorFocused:
                                      VColors.defaultSurfaceLowlight,
                                  overlayColorPressed:
                                      VColors.defaultSurfaceLowlight,
                                  borderSideActive: const BorderSide(
                                    color: VColors.defaultActive,
                                    style: BorderStyle.solid,
                                  ),
                                  borderSideDisabled: BorderSide(
                                    color: VColors.defaultDisabled,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Text(
                                    style: defaultVTheme.textStyles.buttonMedium
                                        .copyWith(
                                      color: VColors.defaultActive,
                                    ),
                                    "Show success banner with close icon"),
                                onPressed: () {
                                  showOnlyBanner(() =>
                                      widget.successBannerWithCloseIcon = true);
                                }),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment:
                                  CodeSegments.VBannerSuccessWithCloseIcon,
                              componentName: 'Banner',
                              exampleName: 'Success_Banner_With_Close_Icon',
                              copyLabel: "Banners with close icon",
                            ),
                            smallHeight(),
                            const SemanticHeader(
                                title: "Success banner without close link"),
                            smallHeight(),
                            VButton(
                                style: VButtonStyle(
                                  backgroundColorActive: VColors.transparent,
                                  backgroundColorDisabled: VColors.transparent,
                                  foregroundColorActive: VColors.defaultActive,
                                  foregroundColorDisabled: VColors.disabled,
                                  overlayColorFocused:
                                      VColors.defaultSurfaceLowlight,
                                  overlayColorPressed:
                                      VColors.defaultSurfaceLowlight,
                                  borderSideActive: const BorderSide(
                                    color: VColors.defaultActive,
                                    style: BorderStyle.solid,
                                  ),
                                  borderSideDisabled: BorderSide(
                                    color: VColors.defaultDisabled,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Text(
                                    style: defaultVTheme.textStyles.buttonMedium
                                        .copyWith(
                                      color: VColors.defaultActive,
                                    ),
                                    "Show success banner without close link"),
                                onPressed: () {
                                  showOnlyBanner(() =>
                                      widget.successBannerPersistent = true);
                                }),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment:
                                  CodeSegments.VBannerSuccessWithButton,
                              componentName: 'Banner',
                              exampleName: 'Success_Banner_With_Button',
                              copyLabel: "Persistent banners",
                            ),
                            smallHeight(),
                            // ! Warning Banner examples
                            SemanticHeader(
                              title: "Warning banners",
                              style: defaultVTheme.textStyles.headline2
                                  .copyWith(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? VColors.defaultTextDark
                                          : VColors.defaultText),
                            ),
                            smallHeight(),
                            const SemanticHeader(
                                title: "Default warning banner"),
                            smallHeight(),
                            VButton(
                                style: VButtonStyle(
                                  backgroundColorActive: VColors.transparent,
                                  backgroundColorDisabled: VColors.transparent,
                                  foregroundColorActive: VColors.defaultActive,
                                  foregroundColorDisabled: VColors.disabled,
                                  overlayColorFocused:
                                      VColors.defaultSurfaceLowlight,
                                  overlayColorPressed:
                                      VColors.defaultSurfaceLowlight,
                                  borderSideActive: const BorderSide(
                                    color: VColors.defaultActive,
                                    style: BorderStyle.solid,
                                  ),
                                  borderSideDisabled: BorderSide(
                                    color: VColors.defaultDisabled,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Text(
                                    style: defaultVTheme.textStyles.buttonMedium
                                        .copyWith(
                                      color: VColors.defaultActive,
                                    ),
                                    "Show default warning banner"),
                                onPressed: () {
                                  showOnlyBanner(
                                      () => widget.warningBannerDefault = true);
                                }),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment: CodeSegments.VBannerWarningDefault,
                              componentName: 'Banner',
                              exampleName: 'Warning_Banner',
                              copyLabel: "Default banners",
                            ),
                            smallHeight(),
                            const SemanticHeader(
                                title: "Warning banner with title"),
                            smallHeight(),
                            VButton(
                                style: VButtonStyle(
                                  backgroundColorActive: VColors.transparent,
                                  backgroundColorDisabled: VColors.transparent,
                                  foregroundColorActive: VColors.defaultActive,
                                  foregroundColorDisabled: VColors.disabled,
                                  overlayColorFocused:
                                      VColors.defaultSurfaceLowlight,
                                  overlayColorPressed:
                                      VColors.defaultSurfaceLowlight,
                                  borderSideActive: const BorderSide(
                                    color: VColors.defaultActive,
                                    style: BorderStyle.solid,
                                  ),
                                  borderSideDisabled: BorderSide(
                                    color: VColors.defaultDisabled,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Text(
                                    style: defaultVTheme.textStyles.buttonMedium
                                        .copyWith(
                                      color: VColors.defaultActive,
                                    ),
                                    "Show warning banner with title"),
                                onPressed: () {
                                  showOnlyBanner(() =>
                                      widget.warningBannerWithTitle = true);
                                }),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment: CodeSegments.VBannerWarningWithTitle,
                              componentName: 'Banner',
                              exampleName: 'Warning_Banner_With_Title',
                              copyLabel: "Banners with title",
                            ),
                            smallHeight(),

                            const SemanticHeader(
                                title: "Warning banner with button"),
                            smallHeight(),
                            VButton(
                                style: VButtonStyle(
                                  backgroundColorActive: VColors.transparent,
                                  backgroundColorDisabled: VColors.transparent,
                                  foregroundColorActive: VColors.defaultActive,
                                  foregroundColorDisabled: VColors.disabled,
                                  overlayColorFocused:
                                      VColors.defaultSurfaceLowlight,
                                  overlayColorPressed:
                                      VColors.defaultSurfaceLowlight,
                                  borderSideActive: const BorderSide(
                                    color: VColors.defaultActive,
                                    style: BorderStyle.solid,
                                  ),
                                  borderSideDisabled: BorderSide(
                                    color: VColors.defaultDisabled,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Text(
                                    style: defaultVTheme.textStyles.buttonMedium
                                        .copyWith(
                                      color: VColors.defaultActive,
                                    ),
                                    "Show warning banner with button"),
                                onPressed: () {
                                  showOnlyBanner(() =>
                                      widget.warningBannerWithButton = true);
                                }),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment:
                                  CodeSegments.VBannerWarningWithButton,
                              componentName: 'Banner',
                              exampleName: 'Warning_Banner_With_Button',
                              copyLabel: "Banners with button",
                            ),
                            smallHeight(),
                            const SemanticHeader(
                                title: "Warning banner with close icon button"),
                            smallHeight(),
                            VButton(
                                style: VButtonStyle(
                                  backgroundColorActive: VColors.transparent,
                                  backgroundColorDisabled: VColors.transparent,
                                  foregroundColorActive: VColors.defaultActive,
                                  foregroundColorDisabled: VColors.disabled,
                                  overlayColorFocused:
                                      VColors.defaultSurfaceLowlight,
                                  overlayColorPressed:
                                      VColors.defaultSurfaceLowlight,
                                  borderSideActive: const BorderSide(
                                    color: VColors.defaultActive,
                                    style: BorderStyle.solid,
                                  ),
                                  borderSideDisabled: BorderSide(
                                    color: VColors.defaultDisabled,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Text(
                                    style: defaultVTheme.textStyles.buttonMedium
                                        .copyWith(
                                      color: VColors.defaultActive,
                                    ),
                                    "Show warning banner with close icon"),
                                onPressed: () {
                                  showOnlyBanner(() =>
                                      widget.warningBannerWithCloseIcon = true);
                                }),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment:
                                  CodeSegments.VBannerWarningWithCloseIcon,
                              componentName: 'Banner',
                              exampleName: 'Warning_Banner_With_Close_Icon',
                              copyLabel: "Banners with close icon",
                            ),
                            smallHeight(),
                            const SemanticHeader(
                                title: "Warning banner without close link"),
                            smallHeight(),
                            VButton(
                                style: VButtonStyle(
                                  backgroundColorActive: VColors.transparent,
                                  backgroundColorDisabled: VColors.transparent,
                                  foregroundColorActive: VColors.defaultActive,
                                  foregroundColorDisabled: VColors.disabled,
                                  overlayColorFocused:
                                      VColors.defaultSurfaceLowlight,
                                  overlayColorPressed:
                                      VColors.defaultSurfaceLowlight,
                                  borderSideActive: const BorderSide(
                                    color: VColors.defaultActive,
                                    style: BorderStyle.solid,
                                  ),
                                  borderSideDisabled: BorderSide(
                                    color: VColors.defaultDisabled,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Text(
                                    style: defaultVTheme.textStyles.buttonMedium
                                        .copyWith(
                                      color: VColors.defaultActive,
                                    ),
                                    "Show warning banner without close link"),
                                onPressed: () {
                                  showOnlyBanner(() =>
                                      widget.warningBannerPersistent = true);
                                }),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment:
                                  CodeSegments.VBannerWarningWithButton,
                              componentName: 'Banner',
                              exampleName: 'Warning_Banner_With_Button',
                              copyLabel: "Persistent banners",
                            ),
                            smallHeight(),
                            // ! Error Banner examples
                            SemanticHeader(
                              title: "Error banners",
                              style: defaultVTheme.textStyles.headline2
                                  .copyWith(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? VColors.defaultTextDark
                                          : VColors.defaultText),
                            ),
                            smallHeight(),
                            const SemanticHeader(title: "Default error banner"),
                            smallHeight(),
                            VButton(
                                style: VButtonStyle(
                                  backgroundColorActive: VColors.transparent,
                                  backgroundColorDisabled: VColors.transparent,
                                  foregroundColorActive: VColors.defaultActive,
                                  foregroundColorDisabled: VColors.disabled,
                                  overlayColorFocused:
                                      VColors.defaultSurfaceLowlight,
                                  overlayColorPressed:
                                      VColors.defaultSurfaceLowlight,
                                  borderSideActive: const BorderSide(
                                    color: VColors.defaultActive,
                                    style: BorderStyle.solid,
                                  ),
                                  borderSideDisabled: BorderSide(
                                    color: VColors.defaultDisabled,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Text(
                                    style: defaultVTheme.textStyles.buttonMedium
                                        .copyWith(
                                      color: VColors.defaultActive,
                                    ),
                                    "Show default error banner"),
                                onPressed: () {
                                  showOnlyBanner(
                                      () => widget.errorBannerDefault = true);
                                }),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment: CodeSegments.VBannerErrorDefault,
                              componentName: 'Banner',
                              exampleName: 'Error_Banner',
                              copyLabel: "Default banners",
                            ),
                            smallHeight(),
                            const SemanticHeader(
                                title: "Error banner with title"),
                            smallHeight(),
                            VButton(
                                style: VButtonStyle(
                                  backgroundColorActive: VColors.transparent,
                                  backgroundColorDisabled: VColors.transparent,
                                  foregroundColorActive: VColors.defaultActive,
                                  foregroundColorDisabled: VColors.disabled,
                                  overlayColorFocused:
                                      VColors.defaultSurfaceLowlight,
                                  overlayColorPressed:
                                      VColors.defaultSurfaceLowlight,
                                  borderSideActive: const BorderSide(
                                    color: VColors.defaultActive,
                                    style: BorderStyle.solid,
                                  ),
                                  borderSideDisabled: BorderSide(
                                    color: VColors.defaultDisabled,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Text(
                                    style: defaultVTheme.textStyles.buttonMedium
                                        .copyWith(
                                      color: VColors.defaultActive,
                                    ),
                                    "Show error banner with title"),
                                onPressed: () {
                                  showOnlyBanner(
                                      () => widget.errorBannerWithTitle = true);
                                }),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment: CodeSegments.VBannerErrorWithTitle,
                              componentName: 'Banner',
                              exampleName: 'Error_Banner_With_Title',
                              copyLabel: "Banners with title",
                            ),
                            smallHeight(),
                            const SemanticHeader(
                                title: "Error banner with button"),
                            smallHeight(),
                            VButton(
                                style: VButtonStyle(
                                  backgroundColorActive: VColors.transparent,
                                  backgroundColorDisabled: VColors.transparent,
                                  foregroundColorActive: VColors.defaultActive,
                                  foregroundColorDisabled: VColors.disabled,
                                  overlayColorFocused:
                                      VColors.defaultSurfaceLowlight,
                                  overlayColorPressed:
                                      VColors.defaultSurfaceLowlight,
                                  borderSideActive: const BorderSide(
                                    color: VColors.defaultActive,
                                    style: BorderStyle.solid,
                                  ),
                                  borderSideDisabled: BorderSide(
                                    color: VColors.defaultDisabled,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Text(
                                    style: defaultVTheme.textStyles.buttonMedium
                                        .copyWith(
                                      color: VColors.defaultActive,
                                    ),
                                    "Show error banner with button"),
                                onPressed: () {
                                  showOnlyBanner(() =>
                                      widget.errorBannerWithButton = true);
                                }),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment: CodeSegments.VBannerErrorWithButton,
                              componentName: 'Banner',
                              exampleName: 'Error_Banner_With_Button',
                              copyLabel: "Banners with button",
                            ),
                            smallHeight(),
                            const SemanticHeader(
                                title: "Error banner with close icon button"),
                            smallHeight(),
                            // ! Error banner with close icon example
                            if (widget.errorBannerWithCloseIcon) ...[
                              VBannerErrorWithCloseIcon(
                                onClosePressed: () {
                                  setState(() {
                                    widget.errorBannerWithCloseIcon = false;
                                  });
                                },
                              ),
                              smallHeight(),
                            ],
                            VButton(
                                style: VButtonStyle(
                                  backgroundColorActive: VColors.transparent,
                                  backgroundColorDisabled: VColors.transparent,
                                  foregroundColorActive: VColors.defaultActive,
                                  foregroundColorDisabled: VColors.disabled,
                                  overlayColorFocused:
                                      VColors.defaultSurfaceLowlight,
                                  overlayColorPressed:
                                      VColors.defaultSurfaceLowlight,
                                  borderSideActive: const BorderSide(
                                    color: VColors.defaultActive,
                                    style: BorderStyle.solid,
                                  ),
                                  borderSideDisabled: BorderSide(
                                    color: VColors.defaultDisabled,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Text(
                                    style: defaultVTheme.textStyles.buttonMedium
                                        .copyWith(
                                      color: VColors.defaultActive,
                                    ),
                                    "Show error banner with close icon"),
                                onPressed: () {
                                  showOnlyBanner(() =>
                                      widget.errorBannerWithCloseIcon = true);
                                }),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment:
                                  CodeSegments.VBannerErrorWithCloseIcon,
                              componentName: 'Banner',
                              exampleName: 'Error_Banner_With_Close_Icon',
                              copyLabel: "Banners with close icon",
                            ),
                            smallHeight(),

                            const SemanticHeader(
                                title: "Error banner without close link"),
                            smallHeight(),
                            VButton(
                                style: VButtonStyle(
                                  backgroundColorActive: VColors.transparent,
                                  backgroundColorDisabled: VColors.transparent,
                                  foregroundColorActive: VColors.defaultActive,
                                  foregroundColorDisabled: VColors.disabled,
                                  overlayColorFocused:
                                      VColors.defaultSurfaceLowlight,
                                  overlayColorPressed:
                                      VColors.defaultSurfaceLowlight,
                                  borderSideActive: const BorderSide(
                                    color: VColors.defaultActive,
                                    style: BorderStyle.solid,
                                  ),
                                  borderSideDisabled: BorderSide(
                                    color: VColors.defaultDisabled,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Text(
                                    style: defaultVTheme.textStyles.buttonMedium
                                        .copyWith(
                                      color: VColors.defaultActive,
                                    ),
                                    "Show error banner without close link"),
                                onPressed: () {
                                  showOnlyBanner(() =>
                                      widget.errorBannerPersistent = true);
                                }),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment: CodeSegments.VBannerErrorWithButton,
                              componentName: 'Banner',
                              exampleName: 'Error_Banner_With_Button',
                              copyLabel: "Persistent banners",
                            ),
                            smallHeight(),
                            // ! Custom Banner examples
                            SemanticHeader(
                              title: "Custom banner",
                              style: defaultVTheme.textStyles.headline2
                                  .copyWith(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? VColors.defaultTextDark
                                          : VColors.defaultText),
                            ),
                            smallHeight(),
                            const SemanticHeader(
                                title:
                                    "Banner with custom border, margin and padding"),
                            smallHeight(),
                            VButton(
                                style: VButtonStyle(
                                  backgroundColorActive: VColors.transparent,
                                  backgroundColorDisabled: VColors.transparent,
                                  foregroundColorActive: VColors.defaultActive,
                                  foregroundColorDisabled: VColors.disabled,
                                  overlayColorFocused:
                                      VColors.defaultSurfaceLowlight,
                                  overlayColorPressed:
                                      VColors.defaultSurfaceLowlight,
                                  borderSideActive: const BorderSide(
                                    color: VColors.defaultActive,
                                    style: BorderStyle.solid,
                                  ),
                                  borderSideDisabled: BorderSide(
                                    color: VColors.defaultDisabled,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Text(
                                    style: defaultVTheme.textStyles.buttonMedium
                                        .copyWith(
                                      color: VColors.defaultActive,
                                    ),
                                    "Show custom banner"),
                                onPressed: () {
                                  showOnlyBanner(
                                      () => widget.customBanner = true);
                                }),
                            smallHeight(),
                            const ShowCodeAccordion(
                              codeSegment: CodeSegments.VBannerCustom,
                              componentName: 'Banner',
                              exampleName: 'Custom_Banner',
                              copyLabel: "Custom Banner",
                            ),
                          ]),
                    ),
                  ]),
                ),
              )
            ]),
      ),
    );
  }
}

// BEGIN VBannerCustom
class VBannerCustom extends StatelessWidget {
  const VBannerCustom({
    Key? key,
    required this.visible,
    this.onClosePressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.success,
      description:
          "This is required text that describes the banner in more detail.",
      onClosePressed: onClosePressed,
      visible: visible,
      hasClose: true,
      style: const VBannerStyle(
        margin: EdgeInsets.symmetric(horizontal: 15),
        borderRadius: 10,
        boxShadowBlurRadius: 2,
        boxShadowSpreadRadius: 2,
        boxShadowOffset: Offset(0, 3),
      ),
    );
  }
}
// END

// BEGIN VBannerSuccessPersistent
class VBannerSuccessPersistent extends StatelessWidget {
  const VBannerSuccessPersistent({
    Key? key,
    required this.visible,
    this.onClosePressed,
    this.onLinkPressed,
    this.onActionPressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed, onLinkPressed, onActionPressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.success,
      description:
          "This is required text that describes the banner in more detail.",
      visible: visible,
    );
  }
}
// END

// BEGIN VBannerErrorPersistent
class VBannerErrorPersistent extends StatelessWidget {
  const VBannerErrorPersistent({
    Key? key,
    required this.visible,
    this.onClosePressed,
    this.onLinkPressed,
    this.onActionPressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed, onLinkPressed, onActionPressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.error,
      description:
          "This is required text that describes the banner in more detail.",
      visible: visible,
    );
  }
}
// END

// BEGIN VBannerWarningPersistent
class VBannerWarningPersistent extends StatelessWidget {
  const VBannerWarningPersistent({
    Key? key,
    required this.visible,
    this.onClosePressed,
    this.onLinkPressed,
    this.onActionPressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed, onLinkPressed, onActionPressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.warning,
      description:
          "This is required text that describes the banner in more detail.",
      visible: visible,
    );
  }
}
// END

// BEGIN VBannerInfoPersistent
class VBannerInfoPersistent extends StatelessWidget {
  const VBannerInfoPersistent({
    Key? key,
    required this.visible,
    this.onClosePressed,
    this.onLinkPressed,
    this.onActionPressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed, onLinkPressed, onActionPressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.informational,
      description:
          "This is required text that describes the banner in more detail.",
      visible: visible,
    );
  }
}
// END

// BEGIN VBannerSuccessWithButton
class VBannerSuccessWithButton extends StatelessWidget {
  const VBannerSuccessWithButton({
    Key? key,
    required this.visible,
    this.onClosePressed,
    this.onLinkPressed,
    this.onActionPressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed, onLinkPressed, onActionPressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.success,
      description:
          "This is required text that describes the banner in more detail.",
      hasAction: true,
      action: "Primary action",
      onClosePressed: onClosePressed,
      hasLink: true,
      link: "Close",
      onLinkPressed: onLinkPressed,
      visible: visible,
      onActionPressed: onActionPressed,
    );
  }
}
// END

// BEGIN VBannerErrorWithButton
class VBannerErrorWithButton extends StatelessWidget {
  const VBannerErrorWithButton({
    Key? key,
    required this.visible,
    this.onClosePressed,
    this.onLinkPressed,
    this.onActionPressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed, onLinkPressed, onActionPressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.error,
      description:
          "This is required text that describes the banner in more detail.",
      hasAction: true,
      action: "Primary action",
      onClosePressed: onClosePressed,
      hasLink: true,
      link: "Close",
      onLinkPressed: onLinkPressed,
      visible: visible,
      onActionPressed: onActionPressed,
    );
  }
}
// END

// BEGIN VBannerWarningWithButton
class VBannerWarningWithButton extends StatelessWidget {
  const VBannerWarningWithButton({
    Key? key,
    required this.visible,
    this.onClosePressed,
    this.onLinkPressed,
    this.onActionPressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed, onLinkPressed, onActionPressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.warning,
      description:
          "This is required text that describes the banner in more detail.",
      hasAction: true,
      action: "Primary action",
      onClosePressed: onClosePressed,
      hasLink: true,
      link: "Close",
      onLinkPressed: onLinkPressed,
      visible: visible,
      onActionPressed: onActionPressed,
    );
  }
}
// END

// BEGIN VBannerInfoWithButton
class VBannerInfoWithButton extends StatelessWidget {
  const VBannerInfoWithButton({
    Key? key,
    required this.visible,
    this.onClosePressed,
    this.onLinkPressed,
    this.onActionPressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed, onLinkPressed, onActionPressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.informational,
      description:
          "This is required text that describes the banner in more detail.",
      hasAction: true,
      action: "Primary action",
      onClosePressed: onClosePressed,
      hasLink: true,
      link: "Close",
      onLinkPressed: onLinkPressed,
      visible: visible,
      onActionPressed: onActionPressed,
    );
  }
}
// END

// BEGIN VBannerSuccessWithTitle
class VBannerSuccessWithTitle extends StatelessWidget {
  const VBannerSuccessWithTitle({
    Key? key,
    required this.visible,
    this.onClosePressed,
    this.onLinkPressed,
    this.onActionPressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed, onLinkPressed, onActionPressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.success,
      hasTitle: true,
      title: "Success title",
      description:
          "This is required text that describes the banner in more detail.",
      hasLink: true,
      link: "Close",
      onLinkPressed: onLinkPressed,
      visible: visible,
    );
  }
}
// END

// BEGIN VBannerErrorWithTitle
class VBannerErrorWithTitle extends StatelessWidget {
  const VBannerErrorWithTitle({
    Key? key,
    required this.visible,
    this.onClosePressed,
    this.onLinkPressed,
    this.onActionPressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed, onLinkPressed, onActionPressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.error,
      hasTitle: true,
      title: "Error title",
      description:
          "This is required text that describes the banner in more detail.",
      hasLink: true,
      link: "Close",
      onLinkPressed: onLinkPressed,
      visible: visible,
    );
  }
}
// END

// BEGIN VBannerWarningWithTitle
class VBannerWarningWithTitle extends StatelessWidget {
  const VBannerWarningWithTitle({
    Key? key,
    required this.visible,
    this.onClosePressed,
    this.onLinkPressed,
    this.onActionPressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed, onLinkPressed, onActionPressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.warning,
      hasTitle: true,
      title: "Warning title",
      description:
          "This is required text that describes the banner in more detail.",
      hasLink: true,
      link: "Close",
      onLinkPressed: onLinkPressed,
      visible: visible,
    );
  }
}
// END

// BEGIN VBannerInfoWithTitle
class VBannerInfoWithTitle extends StatelessWidget {
  const VBannerInfoWithTitle({
    Key? key,
    required this.visible,
    this.onClosePressed,
    this.onLinkPressed,
    this.onActionPressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed, onLinkPressed, onActionPressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.informational,
      hasTitle: true,
      title: "Informational title",
      description:
          "This is required text that describes the banner in more detail.",
      hasLink: true,
      link: "Close",
      onLinkPressed: onLinkPressed,
      visible: visible,
    );
  }
}
// END

// BEGIN VBannerSuccessDefault
class VBannerSuccessDefault extends StatelessWidget {
  const VBannerSuccessDefault({
    Key? key,
    required this.visible,
    this.onClosePressed,
    this.onLinkPressed,
    this.onActionPressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed, onLinkPressed, onActionPressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.success,
      description:
          "This is required text that describes the banner in more detail.",
      hasLink: true,
      link: "Close",
      onLinkPressed: onLinkPressed,
      visible: visible,
    );
  }
}
// END

// BEGIN VBannerErrorDefault
class VBannerErrorDefault extends StatelessWidget {
  const VBannerErrorDefault({
    Key? key,
    required this.visible,
    this.onClosePressed,
    this.onLinkPressed,
    this.onActionPressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed, onLinkPressed, onActionPressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.error,
      description:
          "This is required text that describes the banner in more detail.",
      hasLink: true,
      link: "Close",
      onLinkPressed: onLinkPressed,
      visible: visible,
    );
  }
}
// END

// BEGIN VBannerWarningDefault
class VBannerWarningDefault extends StatelessWidget {
  const VBannerWarningDefault({
    Key? key,
    required this.visible,
    this.onClosePressed,
    this.onLinkPressed,
    this.onActionPressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed, onLinkPressed, onActionPressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.warning,
      description:
          "This is required text that describes the banner in more detail.",
      hasLink: true,
      link: "Close",
      onLinkPressed: onLinkPressed,
      visible: visible,
    );
  }
}
// END

// BEGIN VBannerInfoDefault
class VBannerInfoDefault extends StatelessWidget {
  const VBannerInfoDefault({
    Key? key,
    required this.visible,
    this.onClosePressed,
    this.onLinkPressed,
    this.onActionPressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed, onLinkPressed, onActionPressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.informational,
      description:
          "This is required text that describes the banner in more detail.",
      hasLink: true,
      link: "Close",
      onLinkPressed: onLinkPressed,
      visible: visible,
    );
  }
}
// END

// ! Banner widgets with close icon
// BEGIN VBannerInfoWithCloseIcon
class VBannerInfoWithCloseIcon extends StatelessWidget {
  const VBannerInfoWithCloseIcon({
    Key? key,
    this.visible = true,
    this.onClosePressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.informational,
      description:
          "This is required text that describes the banner in more detail.",
      hasClose: true,
      onClosePressed: onClosePressed,
      visible: visible,
    );
  }
}
// END

// BEGIN VBannerSuccessWithCloseIcon
class VBannerSuccessWithCloseIcon extends StatelessWidget {
  const VBannerSuccessWithCloseIcon({
    Key? key,
    this.visible = true,
    this.onClosePressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.success,
      description:
          "This is required text that describes the banner in more detail.",
      hasClose: true,
      onClosePressed: onClosePressed,
      visible: visible,
    );
  }
}
// END

// BEGIN VBannerWarningWithCloseIcon
class VBannerWarningWithCloseIcon extends StatelessWidget {
  const VBannerWarningWithCloseIcon({
    Key? key,
    this.visible = true,
    this.onClosePressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.warning,
      description:
          "This is required text that describes the banner in more detail.",
      hasClose: true,
      onClosePressed: onClosePressed,
      visible: visible,
    );
  }
}
// END

// BEGIN VBannerErrorWithCloseIcon
class VBannerErrorWithCloseIcon extends StatelessWidget {
  const VBannerErrorWithCloseIcon({
    Key? key,
    this.visible = true,
    this.onClosePressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.error,
      description:
          "This is required text that describes the banner in more detail.",
      hasClose: true,
      onClosePressed: onClosePressed,
      visible: visible,
    );
  }
}
// END
