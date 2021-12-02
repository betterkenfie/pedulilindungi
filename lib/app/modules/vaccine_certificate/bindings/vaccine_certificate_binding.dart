import 'package:get/get.dart';

import '../controllers/vaccine_certificate_controller.dart';

class VaccineCertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VaccineCertificateController>(
      () => VaccineCertificateController(),
    );
  }
}
