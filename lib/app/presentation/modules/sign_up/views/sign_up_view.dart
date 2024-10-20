import 'package:flutter/widgets.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../global/widgets/inputs/input_text_field_gw.dart';

class SignUpView extends StatelessWidget {
  final AdaptativeScreen adaptativeScreen;
  const SignUpView({
    super.key,
    required this.adaptativeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputTextFieldGW(
          labelTxt: 'Correo',
          backgroundLabel: 'Escriba su correo',
          onChanged: (value) {},
        ),
      ],
    );
  }
}
