import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<Directory> getDirectory() async {
  return Platform.isAndroid
      ? await getTemporaryDirectory()
      : await getApplicationDocumentsDirectory();
}
