import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shahanas/viewmodel/datacontroller.dart';

class AddLocationViewModel extends GetxController {
  final streetController = TextEditingController();
  final buildingController = TextEditingController();
  final areaController = TextEditingController();

  var accuracy = 0.0.obs;
  var locationLabel = ''.obs;

  final PropertyFormController formController = Get.find();

  /// This function uses Geolocator to get the current location
  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 1. Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("Error", "Location services are disabled.");
      return;
    }

    // 2. Check permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("Error", "Location permissions are denied.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("Error", "Location permissions are permanently denied.");
      return;
    }

    // 3. Define settings (instead of deprecated `desiredAccuracy`)
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 0,
    );

    // 4. Get the position
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );

    accuracy.value = position.accuracy;
    locationLabel.value =
        "${position.latitude.toStringAsFixed(6)}, ${position.longitude.toStringAsFixed(6)}";

    // 5. Save to shared controller
    formController.street.value = streetController.text;
    formController.building.value = buildingController.text;
    formController.area.value = areaController.text;
    formController.locationLabel.value = locationLabel.value;
  }

  /// Update label manually if user enters location
  void updateLocationLabel(String label) {
    locationLabel.value = label;
  }

  /// Save text input values to shared controller
  void saveInputs() {
    formController.street.value = streetController.text;
    formController.building.value = buildingController.text;
    formController.area.value = areaController.text;
    formController.locationLabel.value = locationLabel.value;
  }

  @override
  void onClose() {
    streetController.dispose();
    buildingController.dispose();
    areaController.dispose();
    super.onClose();
  }
}
