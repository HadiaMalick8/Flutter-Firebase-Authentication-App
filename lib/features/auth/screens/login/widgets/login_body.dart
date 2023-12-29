import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heyflutter_test_task/services/auth_service.dart';
import 'package:provider/provider.dart';

import '../../../../../common_widgets/widgets.dart';
import '../../../../../constants/palette.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/sign_up_controller.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Provider.of<SignupController>(context, listen: false);
    AuthService authService = AuthService();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const ProfilePicture(),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  signupController.nameController.text.trim(),
                  style: bodyText1.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  signupController.emailController.text.trim(),
                  style: bodyTextMedium,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        MyTextField(
            controller: signupController.passwordController,
            hintText: password,
            inputType: TextInputType.text,
            isPassword: true),
        const SizedBox(
          height: 10,
        ),
        MyButton(
          text: login,
          onTap: () {
            authService.signIn(
              context,
              signupController.emailController.text.trim(),
              signupController.passwordController.text.trim(),
            );
          },
          color: hPrimaryColor,
          textColor: hWhite,
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            forgetPassword,
            style: bodyText1.copyWith(
                color: hPrimaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
