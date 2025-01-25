import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String label;
  final String selectedValue;
  final List<String> items;
  final IconData? prefixIcon;
  final double iconSize;
  final Color iconColor;
  final ValueChanged<String?> onChanged; // Use ValueChanged for type safety
  final double height; // New parameter for height

  const CustomDropdown({
    super.key,
    this.iconColor = const Color(0xFFBFC2DF),
    this.iconSize = 24.0,
    required this.prefixIcon,
    required this.label,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    this.height = 56.0, // Default height
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool _isFocused = false; // Track if the dropdown is focused
  final Color _borderColor = Colors.transparent; // Set to transparent
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFocused = true; // Set focus when tapped
        });
      },
      child: Container(
        height: widget.height, // Set the height of the dropdown
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(10), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color
              offset: const Offset(0, 4), // Shadow offset
              blurRadius: 8, // Shadow blur radius
              spreadRadius: 2, // Shadow spread radius
            ),
          ],
        ),
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
              // border: InputBorder.none, // Remove the border

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: _borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.purple, width: 2),
                //
              )),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: widget.selectedValue.isEmpty ? null : widget.selectedValue,
              isExpanded: true,
              items: widget.items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    height: widget.height - 16, // Adjust item height
                    alignment: Alignment.centerLeft, // Align text to the left
                    child: Text(value),
                  ),
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
      ),
    );
  }
}
