import 'package:flutter/material.dart';

import '../../../../common_widgets/widgets.dart';
import '../../../../constants/text_strings.dart';
import 'widgets/signup_body.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return const Background(headerText: signUp, body: SignUpBody(),);
  }
}
