import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shahanas/core/theme.dart';
import 'package:shahanas/view/propertydetails.dart';
import 'package:shahanas/view/widgets/textfield.dart';
import 'package:shahanas/viewmodel/location.dart';

class AddLocationView extends StatelessWidget {
  const AddLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddLocationViewModel());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset('assets/images/iqama.png', height: 50),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'Add Property Location',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),

              /// Accuracy display
              Obx(
                () => Row(
                  children: [
                    const Icon(Icons.gps_fixed),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Accuracy: ${controller.accuracy.value.toStringAsFixed(1)} meters",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              /// Use Current Location Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: AppColors.white,
                ),
                onPressed: () => controller.getCurrentLocation(context),
                child: const Text("Use Current Location"),
              ),
              const SizedBox(height: 10),

              /// Map Placeholder
              Container(
                height: 200,
                color: Colors.grey.shade300,
                child: const Center(child: Text("Map goes here")),
              ),
              const SizedBox(height: 10),

              /// Location Label
              Obx(
                () => Text(
                  controller.locationLabel.value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),

              /// Reusable Input Fields
              CustomTextField(
                controller: controller.streetController,
                label: "Street Name",
              ),
              CustomTextField(
                controller: controller.buildingController,
                label: "Building Number",
              ),
              CustomTextField(
                controller: controller.areaController,
                label: "Area/District",
              ),

              /// Step + Next
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Step 2 of 7 - Location"),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                      ),
                      onPressed: () {
                        controller.saveInputs();
                        // print(controller.streetController.text.trim());
                        Get.to(() => const PropertyDetailsView());
                      },
                      child: const Text("Next"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
