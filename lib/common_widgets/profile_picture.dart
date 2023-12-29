import 'package:flutter/material.dart';

import '../constants/image_strings.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .sizeOf(context)
          .width * 0.2,
      decoration: BoxDecoration(
        color: Colors.grey.shade700,
        borderRadius: BorderRadius.circular(60),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Image.asset(profileImg, fit: BoxFit.cover),
        ),
      ),
    );
  }
}