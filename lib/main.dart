import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shahanas/core/theme.dart';
import 'package:shahanas/viewmodel/datacontroller.dart';
import 'package:shahanas/view/property_view_screen.dart';
import 'package:shahanas/viewmodel/propertydetail.dart';

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
      home: AddPropertyScreen(),
    );
  }
}

