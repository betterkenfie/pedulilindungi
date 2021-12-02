import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/icons/icons_app_icons.dart';
import '../controllers/statistic_covid_controller.dart';
import '../../../data/models/statistic_covid_model.dart';

class StatisticCovidView extends GetView<StatisticCovidController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          toolbarHeight: 45,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              splashRadius: 20,
              icon: Icon(
                IconsApp.navigation_left,
                size: 20,
              )),
          titleSpacing: 5,
          elevation: 1,
          shadowColor: Colors.grey.withOpacity(0.4),
          backgroundColor: Colors.white,
          title: Container(
            child: Text(
              'Statistic COVID-19',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: controller.obx(
          (state) {
            List<CardStatisticWidget> cardData = [];
            state!.item!.asMap().forEach((index, items) {
              cardData.add(CardStatisticWidget(itemStatistic: items));
            });
            return Body(cardData: cardData);
          },
          onLoading: Center(child: CircularProgressIndicator()),
        ));
  }
}

class Body extends StatelessWidget {
  final List<CardStatisticWidget> cardData;
  const Body({Key? key, required this.cardData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              "Statistik Kasus COVID-19",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            SizedBox(height: 5),
            Text(
              DateFormat.yMd().add_Hm().format(DateTime.now()).toString(),
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w700),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 20),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    shadowColor: Colors.transparent,
                    onPrimary: Colors.green,
                    primary: Colors.green[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  icon: Container(
                      height: 15,
                      child: Icon(
                        IconsApp.location,
                        color: Colors.green,
                        size: 13,
                      )),
                  label: Text(
                    "Your Location",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 32,
                  child: IconButton(
                      onPressed: () {},
                      splashRadius: 20.0,
                      highlightColor: Colors.blue[50],
                      icon: Icon(
                        IconsApp.search,
                        color: Colors.blue,
                        size: 18,
                      )),
                )
              ],
            ),
            ...cardData,
          ],
        ),
      ),
    );
  }
}

class CardStatisticWidget extends StatelessWidget {
  final Item itemStatistic;
  CardStatisticWidget({Key? key, required this.itemStatistic})
      : super(key: key);

  List<DetailData> getDetaiData() {
    late List<DetailData> result = [];
    itemStatistic.detail!.asMap().forEach((key, value) {
      result.add(DetailData(
        detail: value,
        color: Color(int.parse(itemStatistic.color.toString())),
      ));
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        elevation: 4,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            // color: Colors.green,
            color: Colors.grey.shade300,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          width: Get.width,
          child: Column(
            children: [
              Text(
                itemStatistic.title.toString(),
                style: TextStyle(
                    color: Color(int.parse(itemStatistic.color.toString())),
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              GridView.count(
                padding: EdgeInsets.only(top: 5),
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: getDetaiData(),
              )
            ],
          ),
        ));
  }
}

class DetailData extends StatelessWidget {
  final Detail detail;
  final Color? color;
  DetailData({Key? key, required this.detail, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(detail.location.toString(),
              style: TextStyle(
                fontSize: 11,
                color: color != null ? color : Colors.black,
              )),
          SizedBox(height: 15),
          Text(detail.total.toString(),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: color != null ? color : Colors.black,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(detail.count.toString(),
                  style: TextStyle(
                    fontSize: 13,
                    color: color != null ? color : Colors.black,
                  )),
              Container(
                margin: EdgeInsets.only(left: 3),
                height: 11,
                width: 11,
                decoration: BoxDecoration(
                    color: color != null
                        ? color!.withOpacity(0.4)
                        : Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12)),
              )
            ],
          )
        ],
      ),
    );
  }
}
