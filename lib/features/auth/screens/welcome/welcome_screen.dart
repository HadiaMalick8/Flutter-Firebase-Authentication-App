import 'package:flutter/material.dart';

import '../../../../common_widgets/background.dart';
import '../../../../common_widgets/widgets.dart';
import '../../../../constants/palette.dart';
import '../../../../constants/text_strings.dart';
import 'widgets/welcome_body.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Background(
      body: WelcomeBody(),
      headerText: welcomeText,
    );
  }
}
