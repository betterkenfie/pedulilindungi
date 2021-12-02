import 'package:get/get.dart';

import '../controllers/checkin_history_controller.dart';

class CheckinHistoryBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<CheckinHistoryController>(
    //   () => CheckinHistoryController(),
    // );
    Get.put(CheckinHistoryController());
  }
}
