import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shahanas/viewmodel/datacontroller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart'; 

class AddLocationViewModel extends GetxController {
  final streetController = TextEditingController();
  final buildingController = TextEditingController();
  final areaController = TextEditingController();

  var accuracy = 0.0.obs;
  var locationLabel = ''.obs;

  final PropertyFormController formController = Get.find();

  void updateLocationLabel(String label) {
    locationLabel.value = label;
  }



void getCurrentLocation(BuildContext context) async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Location Disabled"),
        content: Text("Location is required. Please enable it."),
        actions: [
          TextButton(
            onPressed: () {
              Geolocator.openLocationSettings();
              Navigator.pop(context);
            },
            child: Text("Enable"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
        ],
      ),
    );
    return;
  }

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Permission Permanently Denied"),
        content: Text("Please enable location permission from app settings."),
        actions: [
          TextButton(
            onPressed: () {
              Geolocator.openAppSettings();
              Navigator.pop(context);
            },
            child: Text("Open Settings"),
          ),
        ],
      ),
    );
    return;
  }

  //  Fetch GPS location
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  accuracy.value = position.accuracy;

  //  Reverse geocoding
  List<Placemark> placemarks = await placemarkFromCoordinates(
    position.latitude,
    position.longitude,
  );

  if (placemarks.isNotEmpty) {
    final Placemark place = placemarks[0];

    String readableLocation =
        "${place.name}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}";

    locationLabel.value = readableLocation;

    formController.locationLabel.value = readableLocation;
  } else {
    // fallback to coordinates if place name not found
    locationLabel.value = "${position.latitude}, ${position.longitude}";
    formController.locationLabel.value = locationLabel.value;
  }

  //  Save other fields as well
  formController.street.value = streetController.text;
  formController.building.value = buildingController.text;
  formController.area.value = areaController.text;
}


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
