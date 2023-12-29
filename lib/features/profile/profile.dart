import 'package:flutter/material.dart';

import '../../common_widgets/widgets.dart';
import 'widgets/profile_body.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Background(headerText: 'Your Profile', body: ProfileBody());
  }
}
