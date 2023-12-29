import 'package:flutter/material.dart';

import '../constants/palette.dart';
import '../constants/text_strings.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    required this.hintText,
    required this.inputType,
    required this.isPassword,
    required this.controller,
  });

  final String hintText;
  final TextInputType inputType;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {

  var isObsecured ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isObsecured = false;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: bodyText1.copyWith(color: Colors.grey),
            suffixIcon: widget.isPassword ? InkWell(
              onTap: (){
                setState(() {
                  isObsecured =! isObsecured;
                });
              },
              child: Text(isObsecured ? view : hide, style: bodyText1.copyWith(color: hSecondaryColor),),
            ) : null ,
          ),
          style: bodyText1.copyWith(color: hSecondaryColor),
          keyboardType: widget.inputType,
          obscureText: isObsecured,
        ),
      ),
    );
  }
}