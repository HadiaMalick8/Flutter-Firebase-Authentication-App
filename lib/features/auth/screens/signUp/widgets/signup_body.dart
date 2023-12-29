import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:heyflutter_test_task/features/auth/model/user.dart';
import 'package:provider/provider.dart';

import '../../../../../common_widgets/widgets.dart';
import '../../../../../constants/palette.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../../services/auth_service.dart';
import '../../../controllers/sign_up_controller.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  void registerUser(BuildContext context, String name, String email, String password) {
    AuthService authService = AuthService();

    UserModel user = UserModel(
      email: email,
      name: name,
      password: password,
    );

    authService.createUser(user, context);
  }

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Provider.of<SignupController>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$signUpStarting\n${signupController.emailController.text.trim()}",
          style: bodyTextMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        MyTextField(
          controller: signupController.nameController,
          hintText: name,
          inputType: TextInputType.text,
          isPassword: false,
        ),
        const SizedBox(
          height: 10,
        ),
        MyTextField(
          controller: signupController.passwordController,
          hintText: password,
          inputType: TextInputType.text,
          isPassword: true,
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: termText,
                style: bodyTextMedium,
              ),
              TextSpan(
                text: termsPolicy,
                style: bodyTextMedium.copyWith(color: hPrimaryColor, height: 2),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        MyButton(
          onTap: () {
            registerUser(
              context,
              signupController.nameController.text.trim(),
              signupController.passwordController.text.trim(),
              signupController.emailController.text.trim(),
            );
          },
          text: agreeAndContinue,
          color: hPrimaryColor,
          textColor: hWhite,
        ),
      ],
    );
  }
}
