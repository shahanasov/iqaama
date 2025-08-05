import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shahanas/view/review.dart';
import 'package:shahanas/view/widgets/appbar.dart';
import 'package:shahanas/view/widgets/currency.dart';
import 'package:shahanas/view/widgets/custom_selection.dart';
import 'package:shahanas/view/widgets/textfield.dart';
import 'package:shahanas/viewmodel/pricing_viewmodel.dart';

class PricingView extends StatelessWidget {
  PricingView({super.key});
  final viewModel = Get.put(PricingViewModel());

  final depositOptions = ['6 months', '1 year', '2 years', 'Flexible'];
  final paymentOptions = ['Monthly', 'Quarterly', 'Annually'];
  final utilities = [
    'Electricity Included',
    'Water Included',
    'Internet Included',
    'Maintenance Included',
  ];

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(PropertyController());
    return Scaffold(
      appBar: appbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => ListView(
            children: [
              Text(
                'Pricing & Availability',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              const Text('Monthly Rent'),
              Row(
                children: [
                  SizedBox(width: 100, child: CurrencyDropdown()),
                  const SizedBox(width: 10), // spacing between widgets
                  Expanded(
                    // This is important
                    child: CustomTextField(
                      controller: viewModel.amountController,
                      label: "Amount",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              const Text('Security Deposit'),
              CustomSelector(
                options: depositOptions,
                selected: viewModel.selectedDeposit.value,
                onSelected: (val) => viewModel.selectedDeposit.value = val,
              ),
              const SizedBox(height: 16),
              const Text('Available From'),
              TextField(
                readOnly: true,
                controller: TextEditingController(
                  text: '${viewModel.availableFrom.value.toLocal()}'.split(
                    ' ',
                  )[0],
                ),
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: viewModel.availableFrom.value,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) viewModel.availableFrom.value = date;
                },
              ),
              const SizedBox(height: 16),
              const Text('Utilities'),
              ...utilities.map(
                (utility) => CustomCheckboxTile(
                  label: utility,
                  value: viewModel.selectedUtilities.contains(utility),
                  onChanged: (_) => viewModel.toggleUtility(utility),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Payment Terms'),
              CustomSelector(
                options: paymentOptions,
                selected: viewModel.selectedPaymentTerm.value,
                onSelected: (val) => viewModel.selectedPaymentTerm.value = val,
              ),
              const SizedBox(height: 16),
              const Text('Commission'),
              CustomTextField(
                hint: 'Enter commission',
               controller: viewModel.commissionController,
               
                // onChanged: (val) => viewModel.commission.value = val,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                   viewModel.saveToMainController();
                  Get.to(() => ReviewView());
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

