import 'package:flutter/material.dart';

import '../constants/image_strings.dart';
import '../constants/palette.dart';
import '../constants/text_strings.dart';

class MyButton extends StatelessWidget {
  MyButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.color,
    required this.textColor,
    this.icon,
  });

  final void Function()? onTap;
  final String text;
  final Color color;
  final Color textColor;
  String? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: icon == null ?
        Center(
          child: Text(
            text,
            style: bodyText1.copyWith(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ) :
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20,child: Image.asset(icon!),),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
