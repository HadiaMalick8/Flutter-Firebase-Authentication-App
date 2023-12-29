import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../common_widgets/widgets.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/palette.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../../services/auth_service.dart';
import '../../../controllers/sign_up_controller.dart';
import 'footer.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({
    super.key,
  });

  void checkEmail(BuildContext context, String email) async {
    AuthService userService = AuthService();
    bool emailExists = await userService.isEmailAlreadyInUse(email);
    if(!emailExists){
      Navigator.pushNamed(context, '/sign_up');
    }
    else{
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {

    SignupController signupController = Provider.of<SignupController>(context,listen: false);

    return Column(
      children: [
        MyTextField(
          controller: signupController.emailController,
          hintText: email,
          inputType: TextInputType.emailAddress,
          isPassword: false,
        ),
        const SizedBox(
          height: 10,
        ),
        MyButton(
          text: continueText,
          onTap: () {
            String email = signupController.emailController.text.trim();
            checkEmail(context, email);
          },
          color: hPrimaryColor,
          textColor: hWhite,
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: Text(
            or,
            style: bodyText1,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        MyButton(
          onTap: () {},
          text: contWithFb,
          color: hWhite,
          textColor: hSecondaryColor,
          icon: fbIcon,
        ),
        const SizedBox(
          height: 10,
        ),
        MyButton(
          onTap: () {},
          text: contWithGoogle,
          color: hWhite,
          textColor: hSecondaryColor,
          icon: googleIcon,
        ),
        const SizedBox(
          height: 10,
        ),
        MyButton(
          onTap: () {},
          text: contWithApple,
          color: hWhite,
          textColor: hSecondaryColor,
          icon: appleIcon,
        ),
        const SizedBox(
          height: 20,
        ),
        const Footer(),
      ],
    );
  }
}
