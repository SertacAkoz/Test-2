import 'package:flutter/material.dart';

class Utils{
  Utils._();

  static void safeNavigate(
    String navigationPath,
    BuildContext context,
    Object? argumenents,
  ) {
    Navigator.pushNamed(context, navigationPath, arguments: argumenents);
  }
}