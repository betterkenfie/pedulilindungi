import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedulilindungi/app/data/icons/icons_app_icons.dart';

import '../controllers/edit_account_controller.dart';

class EditAccountView extends GetView<EditAccountController> {
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
          'Edit Account',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Center(
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: <Widget>[
                    CircleAvatar(
                        backgroundColor: Colors.cyan[50],
                        radius: 40.0,
                        child: InkWell(
                          highlightColor: Colors.red,
                          onTap: () {
                            print("Edit Picture");
                          },
                          child: Icon(
                            IconsApp.person,
                            size: 40,
                          ),
                        )),
                    ClipOval(
                      child: Material(
                        color: Colors.blue,
                        child: InkWell(
                          splashColor: Colors.white60,
                          onTap: () {},
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.camera_alt,
                                size: 13, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              // ListWheelScrollView()
              InputField(
                title: "Kwarganegaraan",
                textField: Obx(() => ElevatedButton(
                      onPressed: () {
                        bottomSheetList(
                          title: "Kwarganegaraan",
                          listMenu: [
                            "Indonesia",
                            "Warga Asing",
                          ],
                        ).then((value) {
                          value.isNotEmpty
                              ? controller.user.value.citizenship = value
                              : false;
                        });
                      },
                      child: Text(controller.user.value.citizenship.toString(),
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.normal)),
                      style: styleButton(),
                    )),
              ),
              InputField(
                  title: "Nama Lengkap",
                  textField: Obx(() => TextField(
                        onTap: () {},
                        controller: TextEditingController(
                          text: controller.user.value.fullName,
                        ),
                        style: TextStyle(fontSize: 13),
                        decoration: decorations(),
                      ))),
              InputField(
                  title: "NIK",
                  textField: Obx(() => TextField(
                        onTap: () {},
                        controller: TextEditingController(
                          text: controller.user.value.nik,
                        ),
                        style: TextStyle(fontSize: 13),
                        decoration: decorations(),
                      ))),
              InputField(
                title: "Tanggal Lahir",
                textField: Obx(() => ElevatedButton(
                      onPressed: () {
                        showDateOfBird(context: context);
                      },
                      child: Text(
                          DateFormat('dd-MM-yyyy').format(
                              controller.user.value.dateOfBirth ??
                                  DateTime.now()),
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.normal)),
                      style: styleButton(),
                    )),
              ),
              CardInput(
                funtion: () {},
                title: 'Email',
                value: Text(controller.user.value.email.toString(),
                    style: TextStyle(fontSize: 13)),
              ),
              CardInput(
                funtion: () {},
                title: 'Phone Number',
                value: Text(controller.user.value.phone.toString(),
                    style: TextStyle(fontSize: 13)),
              ),
              SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        height: 70,
        width: Get.width,
        child: ElevatedButton(onPressed: () {}, child: Text("Simpan")),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  ButtonStyle styleButton() => ElevatedButton.styleFrom(
        onPrimary: Colors.blue[300],
        elevation: 0,
        shadowColor: Colors.transparent,
        primary: Colors.grey[200],
        alignment: Alignment.centerLeft,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );

  InputDecoration decorations() {
    return InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              color: Colors.transparent,
            )),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.grey[200]);
  }

  void showDateOfBird({required BuildContext context}) {
    showDatePicker(
            context: context,
            initialDate: controller.user.value.dateOfBirth ?? DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now())
        .then((value) {
      if (value != null) {
        controller.user.value.dateOfBirth = value;
      }
    });
  }

  Future<String> bottomSheetList(
      {String? title, required List<String> listMenu}) async {
    late String result;
    return await Get.bottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          title != null
              ? Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                )
              : SizedBox(),
          Divider(thickness: 1, height: 1, color: Colors.grey[300]),
          Expanded(
            flex: 0,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  visualDensity: VisualDensity(vertical: -4),
                  title: new Text(listMenu.elementAt(index),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13)),
                  onTap: () {
                    result = listMenu.elementAt(index);
                    print(result);
                    Get.back();
                  },
                );
              },
              itemCount: listMenu.length,
            ),
          ),
        ],
      ),
      enterBottomSheetDuration: Duration(milliseconds: 200),
      exitBottomSheetDuration: Duration(milliseconds: 200),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(15.0),
              topRight: const Radius.circular(15.0))),
      backgroundColor: Colors.white,
    ).then((value) {
      return result;
    }).onError((error, stackTrace) {
      printError(info: "bottomSheet");
      return '';
    });
  }
}

class CardInput extends StatelessWidget {
  final String title;
  final VoidCallback funtion;
  final Widget value;
  const CardInput({
    Key? key,
    required this.title,
    required this.funtion,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        margin: EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              width: 1,
              color: Colors.grey.shade200,
            )),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 20,
                    child: IconButton(
                      onPressed: funtion,
                      splashRadius: 15,
                      padding: EdgeInsets.all(0),
                      icon: Icon(IconsApp.edit_box, color: Colors.blue),
                      iconSize: 15,
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              value
            ],
          ),
        ));
  }
}

class InputField extends StatelessWidget {
  final String title;
  final Widget textField;
  const InputField({
    Key? key,
    required this.title,
    required this.textField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(height: 8),
        Container(height: 40, width: Get.width, child: textField),
        // ),
        SizedBox(height: 15),
      ],
    );
  }
}
