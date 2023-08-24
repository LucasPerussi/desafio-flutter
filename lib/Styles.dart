import 'package:flutter/material.dart';

class AppStyles {
  static final TextStyle headerTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const double defaultPadding = 16.0;
  static const EdgeInsetsGeometry defaultPaddingEdgeInsets =
      EdgeInsets.all(defaultPadding);

  // Você pode adicionar mais constantes de estilo aqui conforme necessário

  static const EdgeInsetsGeometry customPaddingEdgeInsets =
      EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0);
}
