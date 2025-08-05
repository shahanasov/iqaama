
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shahanas/viewmodel/datacontroller.dart';

class PropertyDetailsViewModel extends GetxController {
  final PropertyFormController formController = Get.find();

  // Local controllers
  final titleController = TextEditingController();
  final areaController = TextEditingController();
  final descriptionController = TextEditingController();

  final RxInt bedrooms = 2.obs;
  final RxInt bathrooms = 2.obs;

  final RxString selectedType = 'Apartment'.obs;
  final List<String> propertyTypes = [
    'Apartment',
    'Villa',
    'Studio',
    'Townhouse',
    'Penthouse',
  ];

  final List<String> floorLevels = ['Ground', '1', '2', '3+', 'Top Floor'];
  final RxString selectedFloor = 'Ground'.obs;
  final RxBool isFurnished = false.obs;

  void selectType(String type) => selectedType.value = type;

  void incrementBedrooms() => bedrooms.value++;
  void decrementBedrooms() => bedrooms.value > 0 ? bedrooms.value-- : null;
  void incrementBathrooms() => bathrooms.value++;
  void decrementBathrooms() => bathrooms.value > 0 ? bathrooms.value-- : null;

  void toggleFurnished(bool value) => isFurnished.value = value;

  void saveInputs() {
    formController.propertyType.value = selectedType.value;
    formController.title.value = titleController.text;
    formController.bedrooms.value = bedrooms.value;
    formController.bathrooms.value = bathrooms.value;
    formController.area.value = areaController.text;
    formController.floorLevel.value = selectedFloor.value;
    formController.isFurnished.value = isFurnished.value;
    formController.description.value = descriptionController.text;
  }

  @override
  void onClose() {
    titleController.dispose();
    areaController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
