import 'package:flutter/material.dart';

import '../../../../../utils/images.dart';

class SplashScreenBackground extends StatelessWidget {
  const SplashScreenBackground({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Container(
          height: h,
          width: w,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  splashScreenImg,
                ),
                fit: BoxFit.cover),
          ),
        ),
        body
      ],
    );
  }
}
