import 'package:flutter/foundation.dart';

import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, int> _quantities = {};
  final Set<String> _saved = {};

  int get count => _quantities.values.fold(0, (total, value) => total + value);
  int quantity(String id) => _quantities[id] ?? 0;
  bool isSaved(String id) => _saved.contains(id);

  void add(Product product) {
    _quantities.update(product.id, (value) => value + 1, ifAbsent: () => 1);
    notifyListeners();
  }

  void toggleSaved(String id) {
    if (!_saved.add(id)) _saved.remove(id);
    notifyListeners();
  }
}
