import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:pedulilindungi/app/routes/app_pages.dart';
import '../../../data/icons/icons_app_icons.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
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
            'Account',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListWidget(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.cyan[50],
                        child: Icon(
                          IconsApp.person,
                          color: Colors.blue,
                          size: 20,
                        )),
                    SizedBox(width: 13),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("User Name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              )),
                          Text("+6285335502352",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              )),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.EDIT_ACCOUNT);
                        },
                        splashRadius: 18.0,
                        highlightColor: Colors.blue[50],
                        icon: Container(
                            height: 18,
                            child: Icon(
                              IconsApp.edit,
                              color: Colors.blue,
                              size: 18,
                            )))
                  ],
                ),
              ),
              Divider(height: 2, thickness: 1),
              SizedBox(height: 8),
              ListWidget(child: HeaderList(text: "QR Code")),
              ListWidget(
                  child: OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: BorderSide(width: 1.0, color: Colors.blue),
                ),
                icon: Container(
                  width: 15,
                  child: Icon(
                    IconsApp.scan,
                    color: Colors.blue,
                    size: 15,
                  ),
                ),
                label: Text(
                  "Show QR Code",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              )),
              ListWidget(
                  child:
                      HeaderList(text: "Vaccination & Covid-19 Test Result")),
              ListWidget(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    onPrimary: Colors.blue,
                    primary: Colors.cyan[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  icon: CircleAvatar(
                      radius: 13.0,
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(
                        "assets/icons/ic_vaccine_status_blue.svg",
                        height: 13,
                      )),
                  label: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "Vaccination & Covid-19 Test Result",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                  ),
                ),
              ),
              ListMenu(
                icon: IconsApp.list,
                title: "Vaccination History and Tickets",
                funtion: () {},
              ),
              ListMenu(
                icon: IconsApp.medal,
                title: "Vaccine Certificates",
                funtion: () {},
              ),
              ListWidget(child: HeaderList(text: "Other Information")),
              ListMenu(
                icon: IconsApp.heart,
                title: "FAQ",
                funtion: () {},
              ),
              ListMenu(
                icon: IconsApp.live_help,
                title: "About PeduliLindungi",
                funtion: () {},
              ),
              ListMenu(
                icon: IconsApp.star,
                title: "Rate Us - v4.0.2",
                funtion: () {},
              ),
              ListWidget(child: HeaderList(text: "Preference")),
              ListMenu(
                icon: IconsApp.globe,
                title: "Language",
                trailing: false,
                funtion: () {},
              ),
              ListMenu(
                icon: IconsApp.logout,
                title: "Log Out",
                titleColor: Colors.blue,
                trailing: false,
                funtion: () {},
              ),
            ],
          ),
        ));
  }
}

class HeaderList extends StatelessWidget {
  final String text;
  const HeaderList({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
    );
  }
}

class ListWidget extends StatelessWidget {
  final Widget child;
  const ListWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        width: Get.width,
        child: child);
  }
}

class ListMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool trailing;
  final Color titleColor;
  final VoidCallback funtion;
  const ListMenu(
      {Key? key,
      required this.icon,
      required this.title,
      this.trailing = true,
      this.titleColor = Colors.black,
      required this.funtion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: funtion,
      highlightColor: Colors.blue[50],
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 20,
              child: Icon(
                icon,
                color: Colors.blue,
                size: 18,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
                child: Text(
              title,
              style: TextStyle(fontSize: 13, color: titleColor),
            )),
            trailing
                ? Container(
                    width: 6,
                    child: Icon(
                      IconsApp.navigation_right,
                      color: Colors.blue,
                      size: 14,
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
