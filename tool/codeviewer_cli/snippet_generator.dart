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
// ignore_for_file: avoid_print
// START GENAI
import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('Usage: dart all_snippets_to_json.dart <input_file>');
    exit(1);
  }

  final inputFile = args[0];
  final lines = File(inputFile).readAsLinesSync();

  final Map<String, StringBuffer> segments = {};
  String? currentSegment;

  for (final line in lines) {
    final beginMatch = RegExp(r'^//\s*BEGIN\s+(\w+)').firstMatch(line);
    if (beginMatch != null) {
      currentSegment = beginMatch.group(1);
      segments[currentSegment!] = StringBuffer();
      continue;
    }
    if (line.trim().startsWith('// END')) {
      currentSegment = null;
      continue;
    }
    if (currentSegment != null) {
      segments[currentSegment]!.writeln(line);
    }
  }

  // build JSON map
  final Map<String, String> jsonMap = {};
  for (final entry in segments.entries) {
    jsonMap[entry.key] = entry.value.toString();
  }

  print(const JsonEncoder.withIndent('  ').convert(jsonMap));
}
// END GENAI
