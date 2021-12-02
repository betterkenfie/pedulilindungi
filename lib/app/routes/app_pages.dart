import 'package:get/get.dart';

import 'package:pedulilindungi/app/modules/account/bindings/account_binding.dart';
import 'package:pedulilindungi/app/modules/account/views/account_view.dart';
import 'package:pedulilindungi/app/modules/checkin_history/bindings/checkin_history_binding.dart';
import 'package:pedulilindungi/app/modules/checkin_history/views/checkin_history_view.dart';
import 'package:pedulilindungi/app/modules/edit_account/bindings/edit_account_binding.dart';
import 'package:pedulilindungi/app/modules/edit_account/views/edit_account_view.dart';
import 'package:pedulilindungi/app/modules/home/bindings/home_binding.dart';
import 'package:pedulilindungi/app/modules/home/views/home_view.dart';
import 'package:pedulilindungi/app/modules/statistic_covid/bindings/statistic_covid_binding.dart';
import 'package:pedulilindungi/app/modules/statistic_covid/views/statistic_covid_view.dart';
import 'package:pedulilindungi/app/modules/vaccine_certificate/bindings/vaccine_certificate_binding.dart';
import 'package:pedulilindungi/app/modules/vaccine_certificate/views/vaccine_certificate_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.STATISTIC_COVID,
      page: () => StatisticCovidView(),
      binding: StatisticCovidBinding(),
    ),
    GetPage(
      name: _Paths.VACCINE_CERTIFICATE,
      page: () => VaccineCertificateView(),
      binding: VaccineCertificateBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_ACCOUNT,
      page: () => EditAccountView(),
      binding: EditAccountBinding(),
    ),
    GetPage(
      name: _Paths.CHECKIN_HISTORY,
      page: () => CheckinHistoryView(),
      binding: CheckinHistoryBinding(),
    ),
  ];
}
