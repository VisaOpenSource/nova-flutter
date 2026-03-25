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
import 'dart:convert';
import 'vpds_component.dart';

class VPDSLibrary {
  String? name;
  String? version;
  String datetime = DateTime.now().toString();
  Map<String, VPDSComponent> entries = {};

  VPDSLibrary({
    required String? name,
    required String? version,
  }) {
    this.name = name ?? 'vpds-flutter';
    this.version = version ?? '';
  }

  static Map<String, dynamic> toMap(VPDSLibrary library) {
    return {
      'name': library.name,
      'version': library.version,
      'datetime': library.datetime,
      'entries':
          library.entries.values.map((e) => VPDSComponent.toMap(e)).toList(),
    };
  }

  static String encode(VPDSLibrary library) =>
      json.encode(VPDSLibrary.toMap(library));
}