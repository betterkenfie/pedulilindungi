import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:pedulilindungi/app/data/icons/icons_app_icons.dart';

import '../controllers/vaccine_certificate_controller.dart';

class VaccineCertificateView extends GetView<VaccineCertificateController> {
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
            'User Name',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CardItems(
                title: "First Vaccine",
                date: '10 July 2021',
                funtion: () {},
                location: 'Jatibening',
              ),
              CardItems(
                title: "Second Vaccine",
                date: '2 June 2021',
                funtion: () {},
                location: 'Jatibening',
              )
            ],
          ),
        ));
  }
}

class CardItems extends StatelessWidget {
  final String title, date, location;
  final VoidCallback funtion;
  const CardItems({
    Key? key,
    required this.title,
    required this.date,
    required this.location,
    required this.funtion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: funtion,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.lightBlue[900],
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(14),
                ),
              ),
              child: Column(children: [
                SvgPicture.asset(
                  "assets/images/certificate_vaccine_not_found.svg",
                  height: Get.width / 6,
                ),
                SizedBox(height: 10),
                Text(
                  "Vaccines Unavailable",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(date,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 18,
                        child: IconButton(
                          padding: EdgeInsets.all(0),
                          splashRadius: 18,
                          icon: Icon(
                            IconsApp.info_outline,
                            size: 18,
                            color: Colors.blue,
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 3),
                  Text(location,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 13,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
