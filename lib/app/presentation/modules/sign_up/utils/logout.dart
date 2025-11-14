import 'package:client_management/app/domain/either.dart';
import 'package:client_management/app/presentation/global/controllers/loader/loader_gc.dart';
import 'package:client_management/app/presentation/modules/sign_up/controller/sign_up_controller.dart';
import 'package:client_management/app/presentation/router/app_routes/sign_in_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void logout(BuildContext context) async {
  final LoaderGC loaderGC = loaderGlobalProvider.read();
  final SignUpController signUpController = signUpProvider.read();
  loaderGC.showLoader(loading: true);
  final result = await signUpController.logOut();
  result.when(
    left: (failure) {
      loaderGC.showLoader(loading: false);
    },
    right: (success) {
      loaderGC.showLoader(loading: false);
      context.pushReplacementNamed(SignInRoute.path);
    },
  );
}
