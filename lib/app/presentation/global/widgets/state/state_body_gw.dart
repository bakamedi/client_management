import 'package:flutter/material.dart';

import '../../utils/state_gu.dart';
import 'error_gw.dart';
import 'shimmer_gw.dart';
import 'timeout_gw.dart';

class StateBodyGW extends StatelessWidget {
  const StateBodyGW({
    super.key,
    required this.child,
    this.onPressedRetry,
    this.stateGU = StateGU.fetching,
  });
  final StateGU stateGU;
  final void Function()? onPressedRetry;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    switch (stateGU) {
      case StateGU.fetching:
        return const CardShimmer();
      case StateGU.error:
        return ErrorGW(onPressed: () {});
      case StateGU.internet:
        return child;

      case StateGU.timeout:
        return TimeoutGW(onPressed: onPressedRetry);
      case StateGU.success:
        return child;
    }
  }
}
