import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shahanas/core/theme.dart';
import 'package:shahanas/view/addlocation.dart';
import 'package:shahanas/view/amenitites.dart';
import 'package:shahanas/view/photos_screen.dart';
import 'package:shahanas/view/pracing.dart';
import 'package:shahanas/view/widgets/appbar.dart';
import 'package:shahanas/view/success_screen.dart';
import 'package:shahanas/viewmodel/datacontroller.dart';
import 'package:shahanas/viewmodel/review_viewmodel.dart';

class ReviewView extends StatelessWidget {
  ReviewView({super.key});
  final propertyController = Get.find<PropertyFormController>();
  final viewModel = Get.put(ReviewViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Obx(() {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Review & Confirm',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              InfoCard(
                title: 'Property Overview',
                onEdit: () {
                  Get.offAll(() => AddLocationView());
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            propertyController.title.value,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: Text(
                              propertyController.street.value.isNotEmpty
                                  ? propertyController.street.value
                                  : propertyController.locationLabel.value,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            'Rent ${propertyController.amount.value} / ${propertyController.paymentTerm.value}',
                          ),
                        ],
                      ),
                    ),
                    // Small map
                    Container(
                      height: 80,
                      width: 100,
                      decoration: BoxDecoration(
                        border: BoxBorder.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GoogleMap(
                          zoomGesturesEnabled: true,
                          zoomControlsEnabled: false,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(10.8505, 76.2711),
                            zoom: 14,
                          ),
                          myLocationButtonEnabled: true,
                          onMapCreated: (GoogleMapController controller) {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InfoCard(
                title: 'Photo Gallery',
                onEdit: () {
                  Get.offAll(() => PropertyPhotoScreen());
                },
                child: Obx(() {
                  if (propertyController.photos.isEmpty) {
                    return const Text("No photos uploaded.");
                  }

                  return SizedBox(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: propertyController.photos.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final photo = propertyController.photos[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(photo.imagePath),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                const Icon(Icons.broken_image),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
              InfoCard(
                title: 'Amenities',
                onEdit: () {
                  Get.offAll(() => AmenitiesView());
                },
                child: Wrap(
                  spacing: 12,
                  children: propertyController.amenities
                      .map((e) => Chip(label: Text(e)))
                      .toList(),
                ),
              ),
              InfoCard(
                title: 'Lease Terms',
                onEdit: () {
                  Get.offAll(() => PricingView());
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${propertyController.securityDeposit.value}   '
                      'Security Deposit: ${propertyController.amount.value}',
                    ),
                    Text(
                      'Available from: ${propertyController.availableFrom.value.toLocal().toString().split(' ')[0]}',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              CheckboxListTile(
                value: viewModel.agreeTerms.value,
                onChanged: viewModel.toggleTerms,
                title: const Text('I agree to iQaama\'s listing terms'),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: viewModel.agreeTerms.value
                    ? () {
                        Get.to(() => PropertySuccessPage());
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  minimumSize: Size.fromHeight(50),
                ),
                child: const Text('Publish Property'),
              ),
              const SizedBox(height: 10),
              const Text('Step 7 of 7 – Review', textAlign: TextAlign.center),
            ],
          ),
        );
      }),
    );
  }
}
// import 'package:flutter/material.dart';

class PhotoGalleryPreview extends StatelessWidget {
  final List<String> images;

  const PhotoGalleryPreview({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              images[index],
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback? onEdit;

  const InfoCard({
    super.key,
    required this.title,
    required this.child,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),

                if (onEdit != null)
                  TextButton(onPressed: onEdit, child: const Text('Edit')),
              ],
            ),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }
}
