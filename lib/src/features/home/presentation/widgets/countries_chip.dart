import 'package:flutter/material.dart';

class CountriesChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final ValueChanged<bool>? onSelected;
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? shape;
  final double? elevation;


  const CountriesChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onSelected,
    this.padding = const EdgeInsets.only(right: 8.0),
    this.shape = const StadiumBorder(),
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: onSelected,
        selectedColor: Colors.black,
        backgroundColor: Colors.transparent,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
        shape: shape,
        side: isSelected
            ? BorderSide.none
            : BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
        elevation: elevation,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}