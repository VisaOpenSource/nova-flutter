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
class Property {
  String name;
  String type;
  String? description;
  bool? isRequired;

  Property({
    required this.name,
    required this.type,
    this.description,
    this.isRequired,
  });

  static Map<String, dynamic> toMap(Property prop) => {
        'name': prop.name,
        'type': prop.type,
        'description': prop.description,
        'required': prop.isRequired,
      };
}

class Variant {
  String? name;
  String? description;
  String? path;
  String? snippet;

  Variant({
    required this.name,
    this.description,
    required this.path,
    required this.snippet,
  });

  static Map<String, dynamic> toMap(Variant variant) => {
        'name': variant.name,
        'description': variant.description,
        'path': variant.path,
        'snippet': variant.snippet,
      };
}

class VPDSComponent {
  String? name;
  String? description;
  String? library = 'flutter';
  List<Property> properties = [];
  List<Variant> variants = [];

  VPDSComponent({
    required this.name,
  });

  static Map<String, dynamic> toMap(VPDSComponent component) => {
        'name': component.name,
        'description': component.description,
        'library': component.library,
        'properties':
            component.properties.map((e) => Property.toMap(e)).toList(),
        'variants': component.variants.map((e) => Variant.toMap(e)).toList(),
      };

  static String encode(VPDSComponent component) =>
      json.encode(VPDSComponent.toMap(component));
}