import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../extensions/widgets_ext.dart';

class ScaffoldBodyGW extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  const ScaffoldBodyGW({
    super.key,
    required this.body,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body.center,
      backgroundColor: AppColors.white,
    );
  }
}
