import 'package:get/get.dart';

import '../controllers/statistic_covid_controller.dart';

class StatisticCovidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatisticCovidController>(
      () => StatisticCovidController(),
    );
  }
}
