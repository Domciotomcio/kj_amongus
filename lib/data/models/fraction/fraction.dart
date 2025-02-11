import 'package:flutter/material.dart';

enum Fraction {
  green,
  blue,
  red // impostors
}

extension FractionExtension on Fraction {
  String get name {
    switch (this) {
      case Fraction.green:
        return 'Załoga zielonych';
      case Fraction.blue:
        return 'Załoga niebieskich';
      case Fraction.red:
        return 'Impostorzy';
    }
  }

  Color get color {
    switch (this) {
      case Fraction.green:
        return Colors.green;
      case Fraction.blue:
        return Colors.blue;
      case Fraction.red:
        return Colors.red;
    }
  }
}
