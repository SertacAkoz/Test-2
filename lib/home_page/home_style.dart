import 'package:flutter/material.dart';
import 'package:test_2/base/base_style.dart';

class HomeStyle extends BaseStyle{
  BoxDecoration pageBoxDecoration = const BoxDecoration(
    // border: Border.all(
    //   width: 3.0
    // ),
    color: Colors.blue,
    borderRadius: BorderRadius.all(
        Radius.circular(5.0)
    ),
  );

  TextStyle pageBoxTitleTextStyle = const TextStyle(color: Colors.white, fontSize: 21);
}