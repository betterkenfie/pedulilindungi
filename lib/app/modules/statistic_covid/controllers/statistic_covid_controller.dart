import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../../../data/models/statistic_covid_model.dart';

class StatisticCovidController extends GetxController
    with StateMixin<StatisicCovid> {
  // var dataCovid = StatisicCovid().obs;

  @override
  void onInit() {
    // update();
    super.onInit();
    getDataStatistic().then((value) {
      // StatisicCovid data = StateModel.listFromJson(result.data);
      // change(data, status: RxStatus.success());
      change(value, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
    // String data = rootBundle.loadString('assets/models/statistic_covid.json');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // dataCovid.value.dispose();
  }

  Future<StatisicCovid> getDataStatistic() async {
    final String data =
        await rootBundle.loadString('assets/models/statistic_covid.json');
    return StatisicCovid.fromJson(json.decode(data) as Map<String, dynamic>);
    // update();
  }
}
