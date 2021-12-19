import 'package:flutter/cupertino.dart';

class PageOneProvider extends ChangeNotifier {
  List<int> counts = List.generate(20, (index) => 0);

  void increment(int index) {
    counts[index] += 1;
    notifyListeners();
  }

  void dicrement(int index) {
    counts[index] -= 1;
    notifyListeners();
  }
}
