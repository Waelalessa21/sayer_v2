import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.put(HomeController());

  final carousalCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}

class CarDetilsController extends GetxController {
  static CarDetilsController get instance => Get.put(CarDetilsController());

  final carousalCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}
