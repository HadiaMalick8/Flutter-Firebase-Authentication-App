import 'package:flutter/material.dart';

import 'features/auth/screens/login/login.dart';
import 'features/auth/screens/signUp/sign_up.dart';
import 'features/auth/screens/welcome/welcome_screen.dart';
import 'features/profile/profile.dart';

final Map<String, WidgetBuilder> routes = {
  '/welcome': (context) => const WelcomeScreen(),
  '/sign_up': (context) => const SignUp(),
  '/login': (context) => const Login(),
  '/profile': (context) => const ProfileScreen(),
};