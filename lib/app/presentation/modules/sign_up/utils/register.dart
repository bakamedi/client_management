import 'package:flutter/material.dart';

import '../../../global/controllers/loader/loader_gc.dart';
import '../controller/sign_up_controller.dart';

void register(BuildContext context) async {
  final LoaderGC loaderGC = loaderGlobalProvider.read();
  final SignUpController signUpController = signUpProvider.read();

  loaderGC.showLoader(
    loading: true,
  );

  loaderGC.showLoader(
    loading: false,
  );
}
