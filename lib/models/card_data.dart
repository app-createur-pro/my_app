
import 'package:flutter/material.dart';

abstract class CardData {

  final String title;
  final Icon icon;
  final String subtitle;
  final String line1;
  final String line2;
  final String line3;

  CardData({this.title,
      this.icon,
      this.subtitle,
      this.line1,
      this.line2,
      this.line3});

  void openCard(BuildContext context);

}