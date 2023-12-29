import 'package:flutter/material.dart';

import '../../../../common_widgets/widgets.dart';
import '../../../../constants/text_strings.dart';
import 'widgets/login_body.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(headerText: login, body: LoginBody(),);
  }
}
