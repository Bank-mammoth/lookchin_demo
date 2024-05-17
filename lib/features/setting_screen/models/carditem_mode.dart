import 'package:flutter/material.dart';

class CardItem {
  final String titlecard;
  final Widget icon;
  final VoidCallback onTap;
  final String? suffixText;

  CardItem({
    required this.titlecard,
    required this.icon,
    required this.onTap,
    this.suffixText
  });
}
