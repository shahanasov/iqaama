import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shahanas/core/theme.dart';
import 'package:shahanas/viewmodel/datacontroller.dart';
import 'package:shahanas/view/property_view_screen.dart';
import 'package:shahanas/viewmodel/propertydetail.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  Get.put(PropertyFormController()); 
   Get.lazyPut(() => PropertyDetailsViewModel());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'iQaama',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: 
      // MapTestPage(),
      AddPropertyScreen(),
    );
  }
}


class MapTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Map Test")),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // San Francisco
          zoom: 12,
        ),
      ),
    );
  }
}

