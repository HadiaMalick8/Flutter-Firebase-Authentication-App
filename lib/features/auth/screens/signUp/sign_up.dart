import 'package:flutter/material.dart';

import '../../../../common_widgets/widgets.dart';
import '../../../../constants/text_strings.dart';
import 'widgets/signup_body.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(headerText: signUp, body: SignUpBody(),);
  }
}
