import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedulilindungi/app/data/icons/icons_app_icons.dart';

import '../controllers/checkin_history_controller.dart';

class CheckinHistoryView extends GetView<CheckinHistoryController> {
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
        title: Text(
          'Check-In History',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: TabBar(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          isScrollable: true,
          controller: controller.controller,
          tabs: controller.tabMain.map((value) {
            return Tab(
              height: 45,
              iconMargin: EdgeInsets.all(0),
              icon: Text(
                DateFormat('d/MM').format(value),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // text: "tes",
              child: Text(
                DateFormat('EEEE').format(value),
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
          controller: controller.controller,
          children: controller.tabMain.map((e) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Check-in Location on:",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${DateFormat('EEEE, MMM dd yyyy').format(e)}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Container(
                      height: 200,
                      width: Get.width,
                      alignment: Alignment.center,
                      child: Text(
                        "Belum ada data terkait riwaya lokasi perjalan anda",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                        ),
                      ))
                ],
              ),
            );
          }).toList()),
    );
  }
}
