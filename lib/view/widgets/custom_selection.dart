
import 'package:flutter/material.dart';
import 'package:shahanas/core/theme.dart';



class CustomSelector extends StatelessWidget {
  final List<String> options;
  final String selected;
  final Function(String) onSelected;

  const CustomSelector({
    super.key,
    required this.options,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 10,
        children: options.map((option) {
          final isSelected = selected == option;
          return ChoiceChip(
            label: Text(option),
            selected: isSelected,
            onSelected: (_) => onSelected(option),
            selectedColor: AppColors.secondary,
            labelStyle: TextStyle(
              color: isSelected ? AppColors.cyanLight : AppColors.textDark,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomCheckboxTile extends StatelessWidget {
  final String label;
  final bool value;
  final void Function(bool?)? onChanged;

  const CustomCheckboxTile({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(activeColor: AppColors.secondary,
      checkColor: AppColors.cyanLight,
      title: Text(label),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
    );
  }
}
