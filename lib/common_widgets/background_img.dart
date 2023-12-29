import 'package:flutter/material.dart';

import '../constants/image_strings.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backImg),
            fit: BoxFit.cover,
          )
      ),
    );
  }
}