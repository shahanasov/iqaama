import 'package:get/get.dart';
import 'package:shahanas/data/photo.dart';

class PropertyFormController extends GetxController {
  // Page 1: Overview
  var title = ''.obs;
  var subtitle = ''.obs;
  var rent = ''.obs;

  // Page 2: Location
  var street = ''.obs;
  var building = ''.obs;
  var area = ''.obs;
  var locationLabel = ''.obs;

  // Page 3: Photos
  var photos = <PhotoModel>[].obs;

  // Page 3: Property Details
  var propertyType = ''.obs;
  var titleof = ''.obs;
  var bedrooms = 0.obs;
  var bathrooms = 0.obs;
  var areaName = ''.obs;
  var floorLevel = ''.obs;
  var isFurnished = false.obs;
  var description = ''.obs;
  var currencyCode = 'AED'.obs;
  var amount = ''.obs; 
  // Page 4: Amenities
  var amenities = <String>[].obs;

  // Page 5: Lease Terms
  var leaseTerm = ''.obs;

  // Page 6–7: Pricing & Availability
  var monthlyRent = ''.obs;
  var commission = ''.obs;
  var securityDeposit = ''.obs;
  var availableFrom = DateTime.now().obs;
  var includedUtilities = <String>[].obs;
  var paymentTerm = ''.obs;
}
