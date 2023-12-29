import 'package:flutter/material.dart';

import '../constants/palette.dart';
import 'widgets.dart';

class Background extends StatelessWidget {
  const Background({
    super.key,
    required this.body,
    required this.headerText,
  });

  final Widget body;
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const BackgroundImage(),
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 40),
                    height: MediaQuery.sizeOf(context).height * 0.2,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      headerText,
                      style: heading.copyWith(color: hSecondaryColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black12,
                            Colors.grey.shade700,
                            Colors.grey.shade700,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: body,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
