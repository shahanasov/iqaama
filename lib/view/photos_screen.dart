import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shahanas/core/theme.dart';
import 'package:shahanas/view/pracing.dart';
import 'package:shahanas/view/widgets/appbar.dart';
import 'package:shahanas/view/widgets/photo_add.dart';
import 'package:shahanas/viewmodel/datacontroller.dart';
import 'package:shahanas/viewmodel/image_picker_controller.dart';

class PropertyPhotoScreen extends StatelessWidget {
 final PropertyPhotoController photoController = Get.put(PropertyPhotoController());
  final PropertyFormController formController = Get.find<PropertyFormController>();

  PropertyPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 10,
          children: [
            const Text(
              "Property Photos",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: photoController.onCameraTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.secondary,
                ),
                height: 110,
                width: double.infinity,
                child: Column(
                  spacing: 10,
                  children: [
                    SizedBox(height: 10),
                    CircleAvatar(
                      backgroundColor: AppColors.accent,
                      child: const Icon(
                        Icons.camera_alt,
                        color: AppColors.secondary,
                      ),
                    ),
                    Text(
                      'Take Photos',
                      style: TextStyle(
                        color: AppColors.cyanLight,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Obx(() {
              return SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: formController.photos.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final photo = formController.photos[index];
                    return PhotoTile(
                      photo: photo,
                      onDelete: () => photoController.removePhoto(index),
                    );
                  },
                ),
              );
            }),
            const SizedBox(height: 10),
            const Divider(),
            PhotoAddButtons(
              onCameraTap: photoController.onCameraTap,
              onGalleryTap: photoController.onGalleryTap,
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Photo Guidelines",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("• Take well-lit photos"),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("• Include all rooms"),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("• Show property features"),
            ),
            const SizedBox(height: 10),
            Obx(() {
              return Text("${photoController.photoCount} of 10 photos added");
            }),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.to(() => PricingView());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
