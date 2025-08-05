import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shahanas/viewmodel/datacontroller.dart';

class Amenity {
  final String label;
  final IconData icon;
  bool isSelected;

  Amenity({required this.label, required this.icon, this.isSelected = false});
}

class AmenitiesController extends GetxController {
  final amenities = <Amenity>[].obs;
  final PropertyFormController formController = Get.find();

  @override
  void onInit() {
    super.onInit();

    // Initialize from static list or API
    amenities.assignAll([
      Amenity(label: 'Parking', icon: Icons.directions_car),
      Amenity(label: 'Swimming Pool', icon: Icons.pool),
      Amenity(label: 'Gym/Fitness Center', icon: Icons.fitness_center),
      Amenity(label: 'Laundry', icon: Icons.local_laundry_service),
      Amenity(label: 'Balcony', icon: Icons.balcony),
      Amenity(label: 'AC Conditioning', icon: Icons.ac_unit),
      Amenity(label: 'Internet/WiFi', icon: Icons.wifi),
      Amenity(label: 'Security', icon: Icons.security),
      Amenity(label: 'Elevator', icon: Icons.elevator),
      Amenity(label: 'Garden', icon: Icons.park),
      Amenity(label: "Maid's Room", icon: Icons.home_work),
      Amenity(label: 'Storage Room', icon: Icons.store),
      Amenity(label: 'Pet Friendly', icon: Icons.pets),
      Amenity(label: 'Furnished', icon: Icons.chair),
      Amenity(label: 'Kitchen Appliances', icon: Icons.kitchen),
      Amenity(label: 'Concierge', icon: Icons.person),
    ]);
  }

  void toggleAmenity(int index) {
    amenities[index].isSelected = !amenities[index].isSelected;
    amenities.refresh();

    // Update selected list in shared controller
    formController.amenities.value = amenities
        .where((e) => e.isSelected)
        .map((e) => e.label)
        .toList();
  }
}
