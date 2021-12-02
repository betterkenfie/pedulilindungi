import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:pedulilindungi/app/routes/app_pages.dart';
import '../../../data/icons/icons_app_icons.dart';

import '../controllers/home_controller.dart';
import 'package:flutter/services.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return FutureBuilder(
        future: Init.instance.initialize(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Splash();
          } else {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 45,
                      child: InkWell(
                        onTap: () => Get.toNamed(Routes.ACCOUNT),
                        highlightColor: Colors.blue[50],
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 13,
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  IconsApp.profile,
                                  size: 23,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: RichText(
                                    text: TextSpan(
                                        text: "Hi, ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                        children: [
                                      TextSpan(
                                        text: "User Name",
                                        style: TextStyle(
                                          color: Colors.black,
                                          decoration: TextDecoration.underline,
                                          fontSize: 15,
                                        ),
                                      )
                                    ])),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  splashRadius: 18.0,
                                  highlightColor: Colors.blue[50],
                                  icon: Icon(
                                    IconsApp.notification,
                                    size: 20,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Entering a public space?",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    ElevatedButton(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            IconsApp.scan,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text("Scan QR Code",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.blue)),
                                        ],
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        onPrimary: Colors.blue[200],
                                        primary: Colors.white,
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  child: Image.asset(
                                      "assets/images/scan_qr_illustration.png"))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Divider(
                      height: 5,
                      thickness: 5,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MenuApp(
                          color: Colors.orange,
                          title: "Vaccine Certivicate",
                          image: "assets/icons/ic_menu_vaccine_cer.svg",
                          onPressed: () =>
                              Get.toNamed(Routes.VACCINE_CERTIFICATE),
                        ),
                        MenuApp(
                          color: Colors.red,
                          title: "Covid-19 Test Result",
                          image: "assets/icons/ic_menu_covid_test_result.svg",
                          onPressed: () {},
                        ),
                        MenuApp(
                          color: Colors.green,
                          title: "EHAC",
                          image: "assets/icons/ic_menu_ehac.svg",
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MenuApp(
                          color: Colors.blue,
                          title: "Check-In History",
                          image: "assets/icons/ic_menu_chek_in_history.svg",
                          onPressed: () {
                            Get.toNamed(Routes.CHECKIN_HISTORY);
                          },
                        ),
                        MenuApp(
                          color: Colors.green,
                          title: "Travel Regulations",
                          image: "assets/icons/ic_menu_travel_regulataions.svg",
                          onPressed: () {},
                        ),
                        MenuApp(
                          color: Colors.orange,
                          title: "Telemedicine",
                          image: "assets/icons/ic_menu_telemedicine.svg",
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MenuApp(
                          color: Colors.green,
                          title: "Healhtcare Facility",
                          image: "assets/icons/ic_menu_healthcare_facility.svg",
                          onPressed: () {},
                        ),
                        MenuApp(
                          color: Colors.red,
                          title: "Covid-19 Statistic",
                          image: "assets/icons/ic_menu_covid_statistic.svg",
                          onPressed: () => Get.toNamed(Routes.STATISTIC_COVID),
                        ),
                        MenuApp(
                          color: Colors.blue,
                          title: "Get Vaccine",
                          image: "assets/icons/ic_menu_get_vaccines.svg",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              floatingActionButton: SizedBox(
                height: 50,
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Container(
                      height: 25,
                      child: Icon(
                        IconsApp.question_outline,
                        color: Colors.blue,
                      )),
                  backgroundColor: Colors.white,
                ),
              ),
            );
          }
        });
  }
}

class MenuApp extends StatelessWidget {
  final Color color;
  final String title;
  final String image;
  final VoidCallback onPressed;
  const MenuApp({
    Key? key,
    required this.color,
    required this.title,
    required this.image,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 3,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: onPressed,
            child: SvgPicture.asset(
              image,
              width: (Get.width / 3) / 4,
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(20, 20),
              primary: color,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor: lightMode ? Colors.white : Colors.black,
      body: Center(
          child: lightMode
              ? SvgPicture.asset(
                  'assets/images/logo_with_text.svg',
                  width: Get.width / 2,
                )
              : SvgPicture.asset('assets/images/logo_with_text.svg',
                  width: Get.width / 2)),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 0));
  }
}
