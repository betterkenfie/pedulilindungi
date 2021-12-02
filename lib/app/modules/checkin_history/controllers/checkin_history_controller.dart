import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckinHistoryController extends GetxController
    with SingleGetTickerProviderMixin {
  final List<DateTime> tabMain = List.from(List.generate(7, (index) {
    return DateTime.now().subtract(Duration(days: index));
  }).reversed);

  late TabController controller;

  @override
  void onInit() {
    controller = TabController(
        initialIndex: tabMain.length - 1, vsync: this, length: tabMain.length);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
