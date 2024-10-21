import 'package:flutter/material.dart';

import 'error_gw.dart';
import 'internet_gw.dart';
import 'shimmer_gw.dart';
import 'timeout_gw.dart';

class StateBodyGW extends StatelessWidget {
  final bool internet;
  final bool timeout;
  final bool error;
  final bool loading;
  final void Function()? onPressedRetry;

  final Widget child;

  const StateBodyGW({
    super.key,
    this.internet = false,
    this.timeout = false,
    this.error = false,
    this.loading = false,
    required this.child,
    this.onPressedRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (internet) {
      return InternetGW(
        onPressed: onPressedRetry,
      );
    } else if (timeout) {
      return TimeoutGW(
        onPressed: onPressedRetry,
      );
    } else if (error) {
      return ErrorGW(
        onPressed: () {},
      );
    } else if (loading) {
      return const CardShimmer();
    } else {
      return child;
    }
  }
}
