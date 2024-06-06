import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:yaml/yaml.dart';

Future<List<dynamic>> loadYamlFile(String path) async {
  final yamlString = await rootBundle.loadString(path);
  final dynamic yamlMap = loadYaml(yamlString);
  return jsonDecode(jsonEncode(yamlMap['doctors']));
}
