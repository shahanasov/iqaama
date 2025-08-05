import 'package:get/get.dart';

class ReviewViewModel extends GetxController {
  final agreeTerms = false.obs;

  void toggleTerms(bool? value) {
    agreeTerms.value = value ?? false;
  }
}