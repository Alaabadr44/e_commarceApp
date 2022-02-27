import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../loginScreen/login_screen.dart';
import 'body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = '/SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 500),
      () => Get.offNamed(
        LoginScreen.routeName,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenBackground(
        body: Container(),
      ),
    );
  }
}








/*
Stack(
    children: <Widget>[
      SizedBox(
        width: 20.0,
        height: 10.0,
        child: SvgPicture.string(
          '<svg viewBox="0.0 3.0 20.0 10.0" ><path transform="matrix(0.0, -1.0, 1.0, 0.0, 0.0, 13.0)" d="M 10 20 L 0 10 L 10 0" fill="#000000" fill-opacity="0.0" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>',
          allowDrawingOutsideViewBox: true,
        ),
      ),
    ],
  )

 */


        // body: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     SizedBox(
        //       width: 200.0.w,
        //       height: 100.0.h,
        //       child: Transform.rotate(
        //         // angle: 2.32,
        //         angle: 1,
        //         child: SvgPicture.string(
        //           '<svg viewBox="0.0 3.0 20.0 10.0" ><path transform="matrix(0.0, -1.0, 1.0, 0.0, 0.0, 13.0)" d="M 10 20 L 0 10 L 10 0" fill="#000000" fill-opacity="0.0" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>',
        //           allowDrawingOutsideViewBox: true,
        //           color: Colors.white,
        //           fit: BoxFit.fill,
        //         ),
        //       ),
        //     )
        //   ],
        // ),