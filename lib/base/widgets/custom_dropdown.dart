import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String label;
  final String selectedValue;
  final List<String> items;
  final IconData? prefixIcon;
  final double iconSize;
  final Color iconColor;
  final ValueChanged<String?> onChanged; // Use ValueChanged for type safety

  const CustomDropdown({
    super.key,
    this.iconColor = const Color(0xFFBFC2DF),
    this.iconSize = 24.0,
    required this.prefixIcon,
    required this.label,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  Color _borderColor = Colors.pink; // Default border color
  bool _isFocused = false; // Track if the dropdown is focused

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFocused = true; // Set focus when tapped
          _borderColor = Colors.purple; // Change border color on focus
        });
      },
      child: InputDecorator(
        baseStyle: TextStyle(backgroundColor: Colors.pink),
        decoration: InputDecoration(
          labelText: _isFocused || widget.selectedValue.isNotEmpty
              ? widget.label
              : null,
          prefixIcon: widget.prefixIcon != null
              ? Icon(
                  widget.prefixIcon,
                  color: widget.iconColor,
                )
              : null,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: _borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.purple, width: 2),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: widget.selectedValue.isEmpty ? null : widget.selectedValue,
            isExpanded: true,
            items: widget.items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _isFocused = false; // Reset focus when an item is selected
              });
              widget.onChanged(newValue);
            },
            hint: Text('Select Class Type'), // Placeholder text
          ),
        ),
      ),
    );
  }
}
