import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heyflutter_test_task/features/auth/controllers/sign_up_controller.dart';

import '../../../common_widgets/widgets.dart';
import '../../../constants/palette.dart';
import '../../../services/auth_service.dart';
import '../../auth/model/user.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  final user = FirebaseAuth.instance.currentUser;
  AuthService authService = AuthService();

  getUserData() {
    final email = user?.email;
    print(email);
    return authService.getUserDetails(email!);
  }

  void signOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            UserModel userData = snapshot.data as UserModel;
            return Column(
              children: [
                const ProfilePicture(),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      'Name: ',
                      style: bodyText1.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          userData.name,
                          style: bodyText1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Email: ',
                      style: bodyText1.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Center(
                          child: Text(
                        userData.email,
                        style: bodyText1,
                      )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                MyButton(
                  onTap: () {
                    signOut(context);
                  },
                  text: 'Sign Out',
                  color: hPrimaryColor,
                  textColor: hWhite,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
