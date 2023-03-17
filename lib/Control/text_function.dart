import 'package:flutter/material.dart';

//============ Text function========
 myText(String txt, double fntsize, Color clr, FontWeight fntwt)
 {
  return Text(
    txt,
    style: TextStyle(color: clr,fontSize: fntsize,fontWeight: fntwt),
  );
 }