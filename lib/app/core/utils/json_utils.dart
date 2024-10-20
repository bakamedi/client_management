import 'package:flutter/services.dart';

abstract class JsonUtils {
  JsonUtils._();

  static Future<String> loadJsonFromAsset({required String path}) async {
    return await rootBundle.loadString(
      path,
    );
  }
}
