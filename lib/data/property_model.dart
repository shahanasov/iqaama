import 'package:shahanas/data/photo.dart';

class PropertyModel {
  // Property Overview
  final String title;
  final String subtitle;
  final String rent;

  // Photo Gallery
  final List<PhotoModel> photos; 

  // Amenities
  final List<String> amenities;

  // Lease Terms
  final String leaseTerm;
  final String securityDeposit;
  final DateTime availableFrom;

  // Pricing & Availability
  final String commission;
  final List<String> includedUtilities;
  final String paymentTerm;

  // Timestamp (optional for ordering in Firestore)
  final DateTime? createdAt;

  PropertyModel({
    required this.title,
    required this.subtitle,
    required this.rent,
    required this.photos,
    required this.amenities,
    required this.leaseTerm,
    required this.securityDeposit,
    required this.availableFrom,
    required this.commission,
    required this.includedUtilities,
    required this.paymentTerm,
    this.createdAt,
  });

}
