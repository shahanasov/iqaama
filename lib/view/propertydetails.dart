import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shahanas/core/theme.dart';
import 'package:shahanas/view/amenitites.dart';
import 'package:shahanas/view/widgets/appbar.dart';
import 'package:shahanas/view/widgets/count.dart';
import 'package:shahanas/view/widgets/textfield.dart';
import 'package:shahanas/viewmodel/propertydetail.dart';

class PropertyDetailsView extends StatelessWidget {
  const PropertyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PropertyDetailsViewModel>();

    return Scaffold(
      appBar: appbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Property Details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Property Type",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 8,
                    children: controller.propertyTypes.map((type) {
                      final isSelected = controller.selectedType.value == type;
                      return ChoiceChip(
                        label: Text(type),
                        selected: isSelected,
                        onSelected: (_) => controller.selectType(type),
                        selectedColor: AppColors.accent,
                        backgroundColor: Colors.grey.shade200,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : AppColors.textDark,
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 16),
                CustomTextField(
                  controller: controller.titleController,
                  label: "Property Title",
                  // hint: "e.g. Spacious 2BR Apartment in Marina",
                ),

                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CounterField(
                        label: "Bedrooms",
                        value: controller.bedrooms.value,
                        onIncrement: controller.incrementBedrooms,
                        onDecrement: controller.decrementBedrooms,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CounterField(
                        label: "Bathrooms",
                        value: controller.bathrooms.value,
                        onIncrement: controller.incrementBathrooms,
                        onDecrement: controller.decrementBathrooms,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                CustomTextField(
                  controller: controller.areaController,
                  label: "Total Area",
                  suffixText: "sq.ft",
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: controller.selectedFloor.value,
                        items: controller.floorLevels
                            .map(
                              (f) => DropdownMenuItem(value: f, child: Text(f)),
                            )
                            .toList(),
                        onChanged: (val) =>
                            controller.selectedFloor.value = val!,
                        decoration: const InputDecoration(
                          labelText: "Floor Level",
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.isFurnished.value
                                ? "Furnished"
                                : "Unfurnished",
                          ),
                          Switch(
                            value: controller.isFurnished.value,
                            onChanged: controller.toggleFurnished,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                CustomTextField(
                  controller: controller.descriptionController,
                  maxLines: 5,
                  maxLength: 1000,
                  label: "Property Description",
                ),

                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Step 3 of 7 – Details"),
                    ElevatedButton(
                      onPressed: () {
                        final isTitleFilled = controller.titleController.text
                            .trim()
                            .isNotEmpty;

                        if (isTitleFilled) {
                          controller
                              .saveInputs(); // Save all data to shared controller
                          Get.to(() => AmenitiesView());
                        } else {
                          Get.snackbar(
                            'Missing Title',
                            'Please enter the property title before proceeding.',
                            backgroundColor: AppColors.primary,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      },

                      child: const Text("Next"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
