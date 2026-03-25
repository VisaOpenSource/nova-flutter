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
// Visa Nova Flutter Demo Radio Page
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

enum Group1 { g1l1, g1l2, g1l3 }

enum Group2 { g2l1, g2l2, g2l3 }

String errorMessage =
    "This is required text that describes the error in more detail.";

class Radios extends StatefulWidget {
  const Radios({Key? key}) : super(key: key);

  @override
  State<Radios> createState() => _RadiosState();
}

class _RadiosState extends State<Radios> {
  Group1? _group1;
  Group2? _group2;
  bool displayError = false;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    setPageTitle('Radio', context);
    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Radio"),
        drawer: const MyDrawer(pageTitle: "Radio"),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// Default radio buttons
                SemanticHeader(
                    title: "Default radio buttons",
                    style: defaultVTheme.textStyles.headline2.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? VColors.defaultTextDark
                            : VColors.defaultText)),
                smallHeight(),
                Semantics(
                  header: true,
                  child: Text(
                    "Radio button with label",
                    style: defaultVTheme.textStyles.headline3,
                    textAlign: TextAlign.start,
                  ),
                ),
                const VisaRadioButtonWithLabel(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VisaRadioButtonWithLabel,
                  componentName: 'Radio',
                  exampleName: 'Radio_Button_With_Label',
                  copyLabel: "Radio button with label",
                ),
                smallHeight(),
                Semantics(
                  header: true,
                  child: Text(
                    "Radio button without visible label",
                    style: defaultVTheme.textStyles.headline3,
                    textAlign: TextAlign.start,
                  ),
                ),
                const VisaRadioButtonWithoutVisibleLabel(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VisaRadioButtonWithoutVisibleLabel,
                  componentName: 'Radio',
                  exampleName: 'Radio_Button_Without_Visible_Label',
                  copyLabel: "Radio button without visible label",
                ),
                smallHeight(),
                Semantics(
                  header: true,
                  child: Text(
                    "Radio button with description",
                    style: defaultVTheme.textStyles.headline3,
                    textAlign: TextAlign.start,
                  ),
                ),
                const VisaRadioButtonWithDescription(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VisaRadioButtonWithDescription,
                  componentName: 'Radio',
                  exampleName: 'Radio_Button_With_Description',
                  copyLabel: "Radio button with description",
                ),
                smallHeight(),
                Semantics(
                  header: true,
                  child: Text(
                    "Selected radio button",
                    style: defaultVTheme.textStyles.headline3,
                    textAlign: TextAlign.start,
                  ),
                ),
                const VisaSelectedRadioButton(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VisaSelectedRadioButton,
                  componentName: 'Radio',
                  exampleName: 'Selected_Radio_Button',
                  copyLabel: "Selected radio button",
                ),
                smallHeight(),
                Semantics(
                  header: true,
                  child: Text(
                    "Radio button with error",
                    style: defaultVTheme.textStyles.headline3,
                    textAlign: TextAlign.start,
                  ),
                ),
                const VisaRadioButtonWithError(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VisaRadioButtonWithError,
                  componentName: 'Radio',
                  exampleName: 'Radio_Button_With_Error',
                  copyLabel: "Radio button with error",
                ),
                smallHeight(),
                Semantics(
                  header: true,
                  child: Text(
                    "Disabled radio button",
                    style: defaultVTheme.textStyles.headline3,
                    textAlign: TextAlign.start,
                  ),
                ),
                const VisaDisabledRadioButton(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VisaDisabledRadioButton,
                  componentName: 'Radio',
                  exampleName: 'Disabled_Radio_Button',
                  copyLabel: "Disabled radio button",
                ),
                smallHeight(),
                Semantics(
                  header: true,
                  child: Text(
                    "Disabled and selected radio button",
                    style: defaultVTheme.textStyles.headline3,
                    textAlign: TextAlign.start,
                  ),
                ),
                const VisaDisabledAndSelectedRadioButton(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VisaDisabledAndSelectedRadioButton,
                  componentName: 'Radio',
                  exampleName: 'Disabled_And_Selected_Radio_Button',
                  copyLabel: "Disabled and selected radio button",
                ),
                smallHeight(),

                /// Primary Radios
                SemanticHeader(
                    title: "Radio button groups",
                    style: defaultVTheme.textStyles.headline2.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? VColors.defaultTextDark
                            : VColors.defaultText)),
                smallHeight(),
                Semantics(
                  header: true,
                  child: Text(
                    "Radio button group",
                    style: defaultVTheme.textStyles.headline3,
                    textAlign: TextAlign.start,
                  ),
                ),
                visaRadioGroup(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.visaRadioGroup,
                  componentName: 'Radio',
                  exampleName: 'Radio_Group',
                  copyLabel: "Default radio group",
                ),
                const Divider(),
                Semantics(
                  header: true,
                  child: Text(
                    "Radio button group with error",
                    style: defaultVTheme.textStyles.headline3,
                    textAlign: TextAlign.start,
                  ),
                ),
                visaRadioGroupValidation(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.visaRadioGroupValidation,
                  componentName: 'Radio',
                  exampleName: 'Radio_Group_With_Validation',
                  copyLabel: "Radio group with validation",
                ),
                smallHeight(),
                Semantics(
                  header: true,
                  child: Text(
                    "Horizontal radio button group",
                    style: defaultVTheme.textStyles.headline3,
                    textAlign: TextAlign.start,
                  ),
                ),
                visaHorizontalRadioGroup(),
                smallHeight(),
                Semantics(
                  header: true,
                  child: Text(
                    "Radio button panel",
                    style: defaultVTheme.textStyles.headline3,
                    textAlign: TextAlign.start,
                  ),
                ),
                const VisaRadioButtonPanel(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VisaRadioButtonPanel,
                  componentName: 'Radio',
                  exampleName: 'Radio_Button_Panel',
                  copyLabel: "Radio button panel",
                ),
                smallHeight(),
                Semantics(
                  header: true,
                  child: Text(
                    "Radio button panel without description",
                    style: defaultVTheme.textStyles.headline3,
                    textAlign: TextAlign.start,
                  ),
                ),
                const VisaRadioButtonPanelWithoutDescription(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment:
                      CodeSegments.VisaRadioButtonPanelWithoutDescription,
                  componentName: 'Radio',
                  exampleName: 'Radio_Button_Panel_Without_Description',
                  copyLabel: "Radio button panel without description",
                ),
                smallHeight(),
                Semantics(
                  header: true,
                  child: Text(
                    "Disabled radio button panel",
                    style: defaultVTheme.textStyles.headline3,
                    textAlign: TextAlign.start,
                  ),
                ),
                const VisaDisabledRadioButtonPanel(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VisaDisabledRadioButtonPanel,
                  componentName: 'Radio',
                  exampleName: 'Disabled_Radio_Button_Panel',
                  copyLabel: "Disabled radio button panel",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

// BEGIN visaRadioGroupValidation
  Column visaRadioGroupValidation() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 5),
            child: Text(
              '* indicates a required field',
              style: defaultVTheme.textStyles.uiLabel,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Text(
              '* Group label',
              style: defaultVTheme.textStyles.uiLabel
                  .copyWith(color: displayError ? VColors.negativeText : null),
            ),
          ),
          VRadio<Group2>(
              style: VRadioStyle(
                  fillColor: displayError
                      ? VColors.negativeGraphics
                      : VColors.defaultActive),
              title: "Label 1",
              value: Group2.g2l1,
              groupValue: _group2,
              onChanged: (Group2? value) {
                setState(() {
                  _group2 = value;
                });
              }),
          VRadio<Group2>(
              style: VRadioStyle(
                  fillColor: displayError
                      ? VColors.negativeGraphics
                      : VColors.defaultActive),
              title: "Label 2",
              value: Group2.g2l2,
              groupValue: _group2,
              onChanged: (Group2? value) {
                setState(() {
                  _group2 = value;
                });
              }),
          VRadio<Group2>(
              style: VRadioStyle(
                  fillColor: displayError
                      ? VColors.negativeGraphics
                      : VColors.defaultActive),
              title: "Label 3",
              value: Group2.g2l3,
              groupValue: _group2,
              onChanged: (Group2? value) {
                setState(() {
                  _group2 = value;
                });
              }),
          const SizedBox(
            height: 5,
          ),
          ExcludeSemantics(
            child: Visibility(
              visible: displayError,
              child: Text.rich(
                  TextSpan(style: defaultVTheme.textStyles.uiLabel, children: [
                const WidgetSpan(
                    child: VIcon(
                  svgIcon: VIcons.errorTiny,
                  iconWidth: 18,
                  iconHeight: 18,
                  iconColor: VColors.negativeGraphics,
                )),
                const WidgetSpan(
                    child: Padding(padding: EdgeInsets.only(left: 5))),
                TextSpan(
                    text: errorMessage,
                    style: const TextStyle(color: VColors.negativeText))
              ])),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          VButton(
            onPressed: () async {
              if (_group2 != null) {
                setState(() {
                  displayError = false;
                });
              } else {
                setState(() {
                  displayError = true;
                });
                SemanticsService.announce(errorMessage, TextDirection.ltr);
              }
            },
            child: const Text("Submit"),
          )
        ]);
  }
// END

// BEGIN visaRadioGroup
  Column visaRadioGroup() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 5),
          child: Text('Group label', style: defaultVTheme.textStyles.uiLabel),
        ),
        VRadio<Group1>(
            title: "Label 1",
            subtitle:
                "This is optional text that describes the label in more detail",
            value: Group1.g1l1,
            groupValue: _group1,
            onChanged: (Group1? value) {
              setState(() {
                _group1 = value;
              });
            }),
        VRadio<Group1>(
            title: "Label 2",
            subtitle:
                "This is optional text that describes the label in more detail",
            value: Group1.g1l2,
            groupValue: _group1,
            onChanged: (Group1? value) {
              setState(() {
                _group1 = value;
              });
            }),
        VRadio<Group1>(
            title: "Label 3",
            subtitle:
                "This is optional text that describes the label in more detail",
            value: Group1.g1l3,
            groupValue: _group1,
            onChanged: (Group1? value) {
              setState(() {
                _group1 = value;
              });
            }),
      ],
    );
  }
// END

// BEGIN visaHorizontalRadioGroup
  Column visaHorizontalRadioGroup() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 5),
          child: Text('Group label', style: defaultVTheme.textStyles.uiLabel),
        ),
        Row(
          children: [
            Expanded(
              child: VRadio<Group1>(
                  title: "Label 1",
                  value: Group1.g1l1,
                  groupValue: _group1,
                  onChanged: (Group1? value) {
                    setState(() {
                      _group1 = value;
                    });
                  }),
            ),
            Expanded(
              child: VRadio<Group1>(
                  title: "Label 2",
                  value: Group1.g1l2,
                  groupValue: _group1,
                  onChanged: (Group1? value) {
                    setState(() {
                      _group1 = value;
                    });
                  }),
            ),
            Expanded(
              child: VRadio<Group1>(
                  title: "Label 3",
                  value: Group1.g1l3,
                  groupValue: _group1,
                  onChanged: (Group1? value) {
                    setState(() {
                      _group1 = value;
                    });
                  }),
            ),
          ],
        ),
      ],
    );
  }
// END
}

// BEGIN VisaDisabledAndSelectedRadioButton
class VisaDisabledAndSelectedRadioButton extends StatelessWidget {
  const VisaDisabledAndSelectedRadioButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const VRadio<bool>(
      title: "Label",
      value: true,
      groupValue: true,
      onChanged: null,
    );
  }
}
// END

// BEGIN VisaDisabledRadioButton
class VisaDisabledRadioButton extends StatelessWidget {
  const VisaDisabledRadioButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const VRadio<bool>(
      title: "Label",
      value: false,
      groupValue: true,
      onChanged: null,
    );
  }
}
// END

// BEGIN VisaRadioButtonWithError
class VisaRadioButtonWithError extends StatelessWidget {
  const VisaRadioButtonWithError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VRadio(
      title: "Label",
      value: false,
      groupValue: true,
      style: const VRadioStyle(fillColor: VColors.negativeGraphics),
      onChanged: (bool? value) {},
    );
  }
}
// END

// BEGIN VisaSelectedRadioButton
class VisaSelectedRadioButton extends StatelessWidget {
  const VisaSelectedRadioButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VRadio(
      title: "Label",
      value: true,
      groupValue: true,
      onChanged: (bool? value) {},
    );
  }
}
// END

// BEGIN VisaRadioButtonWithDescription
class VisaRadioButtonWithDescription extends StatelessWidget {
  const VisaRadioButtonWithDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VRadio(
      title: "Label",
      subtitle: "This is optional text that describes the label in more detail",
      value: false,
      groupValue: true,
      onChanged: (bool? value) {},
    );
  }
}
// END

// BEGIN VisaRadioButtonWithoutVisibleLabel
class VisaRadioButtonWithoutVisibleLabel extends StatelessWidget {
  const VisaRadioButtonWithoutVisibleLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VRadio(
      title: "",
      value: false,
      groupValue: true,
      onChanged: (bool? value) {},
    );
  }
}
// END

// BEGIN VisaRadioButtonWithLabel
class VisaRadioButtonWithLabel extends StatelessWidget {
  const VisaRadioButtonWithLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VRadio(
      title: "Label",
      value: false,
      groupValue: true,
      onChanged: (bool? value) {},
    );
  }
}
// END

// BEGIN VisaRadioButtonPanel
class VisaRadioButtonPanel extends StatefulWidget {
  const VisaRadioButtonPanel({
    super.key,
  });

  @override
  State<VisaRadioButtonPanel> createState() => _VisaRadioButtonPanelState();
}

class _VisaRadioButtonPanelState extends State<VisaRadioButtonPanel> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: VColors.defaultBorder),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Panel Title",
            style: defaultVTheme.textStyles.headline4,
          ),
          const SizedBox(height: 8),
          Text(
            "Select one option from the panel below:",
            style: defaultVTheme.textStyles.uiLabel,
          ),
          const SizedBox(height: 16),
          VRadio<String>(
            title: "Option 1",
            subtitle: "Description for option 1",
            value: "option1",
            groupValue: _selectedOption,
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          VRadio<String>(
            title: "Option 2",
            subtitle: "Description for option 2",
            value: "option2",
            groupValue: _selectedOption,
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          VRadio<String>(
            title: "Option 3",
            subtitle: "Description for option 3",
            value: "option3",
            groupValue: _selectedOption,
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
// END

// BEGIN VisaRadioButtonPanelWithoutDescription
class VisaRadioButtonPanelWithoutDescription extends StatefulWidget {
  const VisaRadioButtonPanelWithoutDescription({
    super.key,
  });

  @override
  State<VisaRadioButtonPanelWithoutDescription> createState() =>
      _VisaRadioButtonPanelWithoutDescriptionState();
}

class _VisaRadioButtonPanelWithoutDescriptionState
    extends State<VisaRadioButtonPanelWithoutDescription> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: VColors.defaultBorder),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Panel Title",
            style: defaultVTheme.textStyles.headline4,
          ),
          const SizedBox(height: 16),
          VRadio<String>(
            title: "Option 1",
            value: "option1",
            groupValue: _selectedOption,
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          VRadio<String>(
            title: "Option 2",
            value: "option2",
            groupValue: _selectedOption,
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          VRadio<String>(
            title: "Option 3",
            value: "option3",
            groupValue: _selectedOption,
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
// END

// BEGIN VisaDisabledRadioButtonPanel
class VisaDisabledRadioButtonPanel extends StatelessWidget {
  const VisaDisabledRadioButtonPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: VColors.defaultBorder),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Panel Title",
            style: defaultVTheme.textStyles.headline4,
          ),
          const SizedBox(height: 8),
          Text(
            "This panel is disabled and options cannot be selected:",
            style: defaultVTheme.textStyles.uiLabel,
          ),
          const SizedBox(height: 16),
          const VRadio<String>(
            title: "Option 1",
            subtitle: "Description for option 1",
            value: "option1",
            groupValue: "option2", // Option 2 is pre-selected
            onChanged: null, // Disabled
          ),
          const VRadio<String>(
            title: "Option 2",
            subtitle: "Description for option 2",
            value: "option2",
            groupValue: "option2", // This option is selected
            onChanged: null, // Disabled
          ),
          const VRadio<String>(
            title: "Option 3",
            subtitle: "Description for option 3",
            value: "option3",
            groupValue: "option2", // Option 2 is pre-selected
            onChanged: null, // Disabled
          ),
        ],
      ),
    );
  }
}
// END
