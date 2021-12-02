import 'package:get/get.dart';
import 'package:pedulilindungi/app/data/models/user_model.dart';

class EditAccountController extends GetxController {
  // var dateOfBird = DateTime.now().obs;
  var user = User().obs;

  @override
  void onInit() {
    user.value = User(
        citizenship: "Indonesia",
        fullName: "Your Name",
        nik: "3108387236675172",
        dateOfBirth: DateTime.now(),
        email: 'your@email.mail',
        phone: "085436251786");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  // void setDateOfBird(DateTime date) {
  //   dateOfBird.value = date;
  // }

  // String getsetDateOfbird() {
  //   return dateOfBird.value.toString();
  // }
}
