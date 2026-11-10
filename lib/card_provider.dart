import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  List<String> cardItems = [];

  void addToCard(String product) {
    cardItems.add(product);
    notifyListeners();
  }

  void removeFromCard(String product) {
    cardItems.remove(product);
    notifyListeners();
  }
}
