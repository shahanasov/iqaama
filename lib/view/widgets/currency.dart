// view/widgets/currency_dropdown.dart
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shahanas/viewmodel/pricing_viewmodel.dart';

class CurrencyDropdown extends StatelessWidget {
  CurrencyDropdown({super.key});
   final controller = Get.find<PricingViewModel>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          showCurrencyPicker(
            context: context,
            showFlag: true,
            showCurrencyName: true,
            showCurrencyCode: true,
            onSelect: (Currency currency) {
               controller.selectedCurrencyCode.value = currency.code;
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(controller.selectedCurrencyCode.value),
        ),
      ),
    );
  }
}



