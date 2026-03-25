<!--
 *
 *              © 2025-2026 Visa
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 *
 -->

# Changelog

## 8.3.1 (2026-02-24)

### Fixed

- **Accessibility**: Improved `VComboboxScreen` component accessibility (#TLDESDE-246)
  - Added screen reader announcements for search result count changes
  - Added "No results found" and "{count} results found" announcements during search filtering
  - Enhanced clear button with proper semantics (`label`, `hint`, `button` role) and "Search field cleared" announcement
  - Improved close button semantics with descriptive label and hint
  - Added `liveRegion` semantics for empty results state
  - Enhanced list item accessibility with `selected` state, proper labels, and selection announcements
  - Wrapped list items with `Semantics` widget for better VoiceOver/TalkBack support

## 8.3.0 (2025-11-19)

### Added

- **Accessibility**: New `errorBorderColor` token in `VMessageColorSet` for WCAG-compliant form validation borders
- **Accessibility**: New `disabledIcon` token in `VDefaultThemeProps` and `VAltThemeProps` for disabled icon states
- **Accessibility**: Six new toggle switch color tokens for disabled states:
  - `toggleTrackDisabledOff` / `toggleTrackDisabledOffDark`
  - `toggleTrackDisabledOn` / `toggleTrackDisabledOnDark`
  - `toggleThumbDisabled` / `toggleThumbDisabledDark`
- **VSwitchStyle**: New properties for disabled state customization:
  - `trackDisabledOff`, `trackDisabledOn`, `thumbDisabled`
  - `borderDisabledOff`, `borderDisabledOn`, `thumbBorderDisabled`
- **Demo**: Added missing code examples for Accordion, Badge, Banner, Button, Radio, Link, and Tab Bar components
- **Demo**: Added alternate Tab Bar example
- **Demo**: Added close icon button examples for Banner
- **Patterns**: Updated content for Chat, File Upload, and Wizard patterns

### Changed

- **WCAG Compliance**: Form validation error borders now use dedicated `errorBorderColor` token in dark mode
- **WCAG Compliance**: Toggle switch disabled states now use full opacity colors (#757575 light / #7A7A7A dark) instead of forced opacity
- **WCAG Compliance**: Disabled icons in VDropdownMenu, VInput, and VSelect now use `disabledIcon` token with full opacity colors
- Improved contrast ratios across all disabled states to meet WCAG 2.1 Level AA standards
- **Toggle**: Fixed label alignment, padding, and active font styling
- **Toggle**: Fixed multiselect behavior
- **Icon**: Fixed alternate color rendering

### Migration

No breaking changes. All new tokens have sensible defaults. Downstream apps can optionally override the new theme tokens.

```dart
VDefaultThemeProps(
  errorBorderColor: yourColor,    // Optional: customize error borders
  disabledIcon: yourColor,         // Optional: customize disabled icons
)

VSwitchStyle(
  trackDisabledOff: yourColor,    // Optional: customize toggle disabled states
  // ... other new properties
)
```

### Fixed

- VPA Accessibility Gaps: Form field error/validation text contrast in dark mode
- VPA Accessibility Gaps: Toggle switch "Off" state contrast in light and dark modes
- VPA Accessibility Gaps: Disabled icon color contrast (Face ID, empty states, dropdowns, inputs)
- Regression fixes across Badge, Banner, Button, Toggle, Checkbox, Chips, Tab Bar, Top App Bar, and Radio components
- Resolved all Dart analyzer warnings and info-level issues across the SDK codebase
- Removed license headers from generated API documentation

### Testing

- Added 6 new test files for material widget forks: VCircularProgressIndicator, VSnackBar, VMatRadio, VMatCheckbox, VMatTabBar, and VRawChip
- Added golden snapshot tests for all 28 components (previously only 13 had golden coverage)
- Expanded test suite to 740+ tests with 100% pass rate
- Regenerated all golden test images

## 8.2.0 (2025-09-26)

### Feature 8.2.0

- Added a colletion of patterns.
  - Application layout
  - Chat
  - File Upload
  - Wizard

- Added a new property enableInteractiveSelection to VInput.

## 8.1.2 (2025-04-10)

### Feature 8.1.2

- Updated license in all files and pubspec.yaml

## 8.1.1 (2025-03-26)

### Feature 8.1.1

- Updated pubspec.yaml

## 8.1.0 (2025-02-12)

### Added 8.1.0

- Initial release of the component library.
- Added a collection of components.
  - Accordion
  - App Bar
  - Avatar
  - Badge
  - Banner
  - Bottom Navigation Bar
  - Button
  - Checkbox
  - Chip
  - Combobox
  - Content Card
  - Dialog
  - Divider
  - Dropdown Menu
  - Flag
  - Icon
  - Input
  - Link
  - List Item
  - Navigation Drawer
  - Panel
  - Progress
  - Radio
  - Section Message
  - Select
  - Switch
  - Tab
  - Toggle
  - Wizard
