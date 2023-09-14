import 'package:flutter/material.dart';

import '../../constant.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: gradientBackColor,
        child: Image(
          image: AssetImage('assets/images/shopping.png'),
        ),
      ),
    );
  }
}
