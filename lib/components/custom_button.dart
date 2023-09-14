import 'package:flutter/material.dart';

Widget defaultButton({
  double width = 350.0,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      decoration: BoxDecoration(
        color: Color(0xff502054),
        borderRadius: BorderRadius.circular(20.0),
      ),
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          '$text',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
