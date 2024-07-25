import 'package:get/get.dart';

class ShowProductController extends GetxController {
  int buyCounter = 0;
  void buyCounterIncreament() {
    buyCounter++;
    update();
  }

  void buyCounterDecreament() {
    if (buyCounter > 0) {
      buyCounter--;
      update();
    }
  }
}
