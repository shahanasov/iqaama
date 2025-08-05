import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shahanas/core/theme.dart';
import 'package:shahanas/data/photo.dart';

class PhotoAddButtons extends StatelessWidget {
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;

  const PhotoAddButtons({
    super.key,
    required this.onCameraTap,
    required this.onGalleryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: onCameraTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.textLight,
            ),
            height: 55,
            width: 150,
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.camera_alt, color: AppColors.cyanLight),
                const Text(
                  "Use Camera",
                  style: TextStyle(color: AppColors.cyanLight),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: onGalleryTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.textLight,
            ),
            height: 55,
            width: 150,
            margin: EdgeInsets.all(10),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.photo, color: AppColors.cyanLight),
                const Text(
                  "Choose from\n Gallery",
                  style: TextStyle(color: AppColors.cyanLight),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PhotoTile extends StatelessWidget {
  final PhotoModel photo;
  final VoidCallback onDelete;

  const PhotoTile({super.key, required this.photo, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.file(
            File(photo.imagePath),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: onDelete,
            child: const CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
              child: Icon(Icons.close, size: 16, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}




