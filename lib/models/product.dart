
import 'package:flutter/material.dart';

import 'card_data.dart';

class Product extends CardData{
  final String productName;
  final Icon icon;
  final String category;
  final double price;
  final Availability availability;
  final int weight;

  Product({this.productName,
      this.icon,
      this.category,
      this.price,
      this.availability,
      this.weight}) : super(
                        title: productName,
                        icon: icon,
                        subtitle: category,
                        line1: "${price.toString()} €",
                        line2: (availability == Availability.AVAILABLE) ? "en stock" : "indisponible",
                        line3: "${weight.toString()} g",
                      );

  @override
  void openCard(BuildContext context) {
      showDialog(context: context, builder: (_) => AlertDialog(
        title: Text("pop up : $productName"),
      )
    );
  }
}

enum Availability {
  AVAILABLE,
  UNAVAILABLE
}