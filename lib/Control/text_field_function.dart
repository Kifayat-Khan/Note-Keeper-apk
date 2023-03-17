import 'package:flutter/material.dart';

custmTextField(String hint,Color hintClr, double hintsize, TextEditingController txtcontroller)
{
  return TextField(
    controller:  txtcontroller,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: hintClr, fontSize: hintsize,),
     // border: InputBorder.none,

    ),
  );
}