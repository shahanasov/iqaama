import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shahanas/data/amenity.dart';
import 'package:shahanas/view/photos_screen.dart';
import 'package:shahanas/view/widgets/appbar.dart';

class AmenitiesView extends StatelessWidget {
  AmenitiesView({super.key});
  final AmenitiesController controller = Get.put(AmenitiesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          children: [
            Text("Property Amenities",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Expanded(
              child: Obx(() {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: controller.amenities.length,
                  itemBuilder: (context, index) {
                    final item = controller.amenities[index];
                    return GestureDetector(
                      onTap: () => controller.toggleAmenity(index),
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: item.isSelected ? Color(0xFFFAF8F6) : Colors.white,
                          border: Border.all(
                            color: item.isSelected
                                ? Color(0xFFD2B08A)
                                : Color(0xFFE1E5ED),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                            //  mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(item.icon, size: 28, color: Color(0xFF132D53)),
                            SizedBox(height: 8),
                            Text(
                              item.label,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF132D53),
                              ),
                            ),
                            item.isSelected?
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Icon(
                                  Icons.check,
                                  color: Color(0xFFD2B08A),
                                  size: 16,
                                ),
                              ): SizedBox(height: 20,)
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF132D53),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(vertical: 14),
          ),
          onPressed: () {
            Get.to(() => PropertyPhotoScreen());
          },
          child: Text('Next', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
