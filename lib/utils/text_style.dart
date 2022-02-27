/*
 //30 bold
    headline1: GoogleFonts.sourceSansPro().copyWith(
      fontSize: 30.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),

    //18 bold
    headline2: GoogleFonts.sourceSansPro().copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),

    //14 bold
    headline3: GoogleFonts.sourceSansPro().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),

    //16 Medium black
    bodyMedium: GoogleFonts.sourceSansPro().copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),

    //14  Medium
    subtitle1: GoogleFonts.sourceSansPro().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),

    //26 Normal / regular / plain black
    titleMedium: GoogleFonts.sourceSansPro().copyWith(
      fontSize: 26.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),

    //18 Normal / regular / plain
    bodyText2: GoogleFonts.sourceSansPro().copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),

    //16 Normal / regular / plain
    bodyLarge: GoogleFonts.sourceSansPro().copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),

    //14 Normal / regular / plain
    bodyText1: GoogleFonts.sourceSansPro().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),

    //12 Normal / regular / plain
    subtitle2: GoogleFonts.sourceSansPro().copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),


 */

import 'package:e_commerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

//headline1
class TextBold30 extends StatelessWidget {
  const TextBold30(
    this.text, {
    Key? key,
    this.color = black,
  }) : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sourceSansPro().copyWith(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

//headline2

class TextBold18 extends StatelessWidget {
  const TextBold18(
    this.text, {
    Key? key,
    this.color = black,
  }) : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sourceSansPro().copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class TextBold26 extends StatelessWidget {
  const TextBold26(
    this.text, {
    Key? key,
    this.color = black,
  }) : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sourceSansPro().copyWith(
        fontSize: 26.sp,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

// headline3
class TextBold14 extends StatelessWidget {
  const TextBold14(
    this.text, {
    Key? key,
    this.color = black,
  }) : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sourceSansPro().copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

//bodyMedium
class TextMedium16 extends StatelessWidget {
  const TextMedium16(
    this.text, {
    Key? key,
    this.color = black,
  }) : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sourceSansPro().copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}

//subtitle1

class TextMedium14 extends StatelessWidget {
  const TextMedium14(
    this.text, {
    Key? key,
    this.color = black,
  }) : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sourceSansPro().copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}

//titleMedium

class TextNormal26 extends StatelessWidget {
  const TextNormal26(
    this.text, {
    Key? key,
    this.color = black,
  }) : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sourceSansPro().copyWith(
        fontSize: 26.sp,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}

class TextNormal20 extends StatelessWidget {
  const TextNormal20(
    this.text, {
    Key? key,
    this.color = black,
  }) : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sourceSansPro().copyWith(
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}

//bodyText2
class TextNormal18 extends StatelessWidget {
  const TextNormal18(
    this.text, {
    Key? key,
    this.color = black,
  }) : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sourceSansPro().copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}

//bodyLarge
class TextNormal16 extends StatelessWidget {
  const TextNormal16(
    this.text, {
    Key? key,
    this.color = black,
  }) : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sourceSansPro().copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}

//bodyText1

class TextNormal14 extends StatelessWidget {
  const TextNormal14(
    this.text, {
    Key? key,
    this.color = black,
  }) : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sourceSansPro().copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}

// subtitle2
class TextNormal12 extends StatelessWidget {
  const TextNormal12(
    this.text, {
    Key? key,
    this.color = black,
  }) : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sourceSansPro().copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}
class TextNormal10 extends StatelessWidget {
  const TextNormal10(
    this.text, {
    Key? key,
    this.color = black,
  }) : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.sourceSansPro().copyWith(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}
