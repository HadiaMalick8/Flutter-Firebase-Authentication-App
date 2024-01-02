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

    void loginUser(){
      authService.signIn(
        context,
        signupController.emailController.text.trim(),
        signupController.passwordController.text.trim(),
      );
    }

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
                FutureBuilder<String>(
                  future: authService.getUserNameByEmail(signupController.emailController.text.trim()),
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      return Text(
                        snapshot.data!,
                        style: bodyText1.copyWith(fontWeight: FontWeight.bold),
                      );
                    } else {
                      return const Text('User not found.');
                    }
                  },
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
          onTap: loginUser,
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
