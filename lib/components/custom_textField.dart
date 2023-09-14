import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultField({
  required String labelText,
  Icon? prefix,
  IconButton? suffix,
  required TextInputType type,
  bool isPassword = false,
  ValueChanged? function,
  ValueChanged? functionSup,
  GestureTapCallback? functionTap,
  String msg = '',
  TextStyle? labelStyle,
  TextStyle? style,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter the info';
          }
          return null;
        },
        cursorColor: Colors.blueAccent,
        style: style,
        onChanged: function,
        onTap: functionTap,
        onFieldSubmitted: functionSup,
        obscureText: isPassword,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: labelStyle,
          prefixIcon: prefix,
          suffixIcon: suffix,
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff370665),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26),
          ),
          filled: true,
          fillColor: Color(0x05ffffff),
        ),
      ),
    );
