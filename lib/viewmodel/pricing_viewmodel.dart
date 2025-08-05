// viewmodel/pricing_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shahanas/viewmodel/datacontroller.dart';

class PricingViewModel extends GetxController {
  var selectedDeposit = '1 year'.obs;
  var availableFrom = DateTime.now().obs;
  var selectedUtilities = <String>[].obs;
  var selectedPaymentTerm = 'Monthly'.obs;

  final rentController = TextEditingController();
  final commissionController = TextEditingController();

  var selectedCurrencyCode = 'AED'.obs;
  final amountController = TextEditingController();

  // Toggle utilities
  void toggleUtility(String utility) {
    if (selectedUtilities.contains(utility)) {
      selectedUtilities.remove(utility);
    } else {
      selectedUtilities.add(utility);
    }
  }

  // Handle date picking
  Future<void> pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: availableFrom.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date != null) availableFrom.value = date;
  }

  // Save all values to PropertyFormController (final save)
  void saveToMainController() {
    final formController = Get.find<PropertyFormController>();
    formController.currencyCode.value = selectedCurrencyCode.value;
    formController.amount.value = amountController.text;
    formController.monthlyRent.value = rentController.text;
    formController.securityDeposit.value = selectedDeposit.value;
    formController.availableFrom.value = availableFrom.value;
    formController.includedUtilities.value = selectedUtilities.toList();
    formController.paymentTerm.value = selectedPaymentTerm.value;
    formController.commission.value = commissionController.text;
  }

  @override
  void onClose() {
    rentController.dispose();
    commissionController.dispose();
    amountController.dispose();
    super.onClose();
  }
}
