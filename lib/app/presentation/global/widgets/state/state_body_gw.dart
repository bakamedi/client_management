import 'package:flutter/material.dart';

import '../../utils/state_gu.dart';
import 'error_gw.dart';
import 'internet_gw.dart';
import 'shimmer_gw.dart';
import 'timeout_gw.dart';

class StateBodyGW extends StatelessWidget {
  final StateGU stateGU;
  final void Function()? onPressedRetry;

  final Widget child;

  const StateBodyGW({
    super.key,
    required this.child,
    this.onPressedRetry,
    this.stateGU = StateGU.fetching,
  });

  @override
  Widget build(BuildContext context) {
    switch (stateGU) {
      case StateGU.fetching:
        return const CardShimmer();
      case StateGU.error:
        return ErrorGW(
          onPressed: () {},
        );
      case StateGU.internet:
        return InternetGW(
          onPressed: onPressedRetry,
        );
      case StateGU.timeout:
        return TimeoutGW(
          onPressed: onPressedRetry,
        );
      case StateGU.success:
        return child;

      default:
        return const CardShimmer();
    }
  }
}
