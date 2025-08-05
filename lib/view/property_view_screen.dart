import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shahanas/core/theme.dart';
import 'package:shahanas/view/addlocation.dart';
import 'package:shahanas/viewmodel/propertydetail.dart';

class AddPropertyScreen extends StatelessWidget {
  const AddPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<PropertyDetailsViewModel>;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/iqama.png', height: 50),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/images/home.png', height: 50),

                  const SizedBox(height: 24),

                  const Text(
                    "Add New Property",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Exact location can only be added through mobile phone for GPS accuracy.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),

                  const SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => AddLocationView());
                       
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      
                      child: const Text(
                        "Start Adding Property",
                        style: TextStyle(
                          color: AppColors.cyanLight,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 26),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),

                  const Text(
                    "Quick Tips",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),

                  const SizedBox(height: 8),

                  const Text("• Have your property photos ready"),
                  const Text("• Ensure GPS is enabled"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}  