import 'package:flutter/material.dart';

import '../../../../../constants/palette.dart';
import '../../../../../constants/text_strings.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              noAccount,
              style: bodyText1.copyWith(fontWeight: FontWeight.w100),
            ),
            const SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/sign_up');
              },
              child: Text(
                signUp,
                style: bodyText1.copyWith(color: hPrimaryColor, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: (){},
          child: Text(
            forgetPassword,
            style: bodyText1.copyWith(color: hPrimaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
