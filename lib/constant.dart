import 'package:flutter/material.dart';

const Color firstBackColor = Color(0xff3D2C8D);
  const Color secondBackColor = Color(0xff916BBF);
const Color thirdBackColor = Color(0xffC996CC);
const Color white = Color(0xffffffff);
const Color black = Color(0xff000000);

const BoxDecoration gradientBackColor = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      firstBackColor,
      secondBackColor,
      thirdBackColor,
    ],
  ),
);
