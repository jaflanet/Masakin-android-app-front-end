import 'dart:ui';

import 'package:get/get.dart';
import '../../widget/widgets.dart';

class cartController extends GetxController {
  var _foods = {}.obs;
  // RxInt total = 0.obs;

  void addItem(Food food) {
    if (_foods.containsKey(food)) {
      _foods[food] += 1;
    } else {
      _foods[food] = 1;
    }

    Get.snackbar(
      "Food Added",
      "you've add the ${food.name} to the cart",
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
      backgroundColor: Color(0xFFFF8023).withOpacity(0.8),
    );
  }

  void removeItem(Food food) {
    if (_foods.containsKey(food) && _foods[food] == 1) {
      _foods.removeWhere((key, value) => key == food);
    } else {
      _foods[food] -= 1;
    }

    Get.snackbar(
      "Food Removed",
      "you've removed the ${food.name} to the cart",
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
      backgroundColor: Color(0xFFFF8023).withOpacity(0.8),
    );
  }

  get foods => _foods;

  get itemSubtotal =>
      _foods.entries.map((food) => food.key.price * food.value).toList();

  getTotal() {
    num total = 0;
    _foods.entries
        .map((food) => food.key.price * food.value)
        .toList()
        .forEach((element) => total += element);
    return total;
  }

  clearList() {
    _foods.clear();
  }

  foodlist() {
    var list = _foods.entries
        .map((food) =>
            food.value.toString() +
            ' ' +
            food.key.name.toString() +
            ' ' +
            (food.key.price * food.value).toString())
        .toList();
    return list;
  }
}
