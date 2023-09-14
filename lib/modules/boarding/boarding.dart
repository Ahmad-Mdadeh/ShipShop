import 'package:flutter/material.dart';
import 'package:shipshop/constant.dart';

class Boarding extends StatelessWidget {
  const Boarding({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstBackColor,
      ),
      body: Column(
        children: const [
          Image(image: AssetImage('assets/images/IMG_1.jpg'),),
          SizedBox(
            height: 30.0,
          ),
          Text('title',style: TextStyle(
              fontSize: 60.0
          ),),
          SizedBox(
            height: 5.0,
          ),
          Text('desiccation'),
        ],
      ),
    );
  }
}
