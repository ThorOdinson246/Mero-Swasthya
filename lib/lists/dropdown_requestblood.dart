import 'package:flutter/material.dart';


class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton(
      {Key? key,
      required this.defaultValue,
      required this.values,
      required this.onItemSelected})
      : super(key: key);
  final dynamic Function(String? selectedValue) onItemSelected;
  final String defaultValue;
  final List<String> values;
  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.all(5.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              items: widget.values.map((dropValue) {
                return DropdownMenuItem<String>(
                  value: dropValue,
                  child: Text(dropValue),
                );
              }).toList(),
              onChanged: (newDropdownValue) {
                setState(() {
                  dropdownValue = newDropdownValue!;
                });
                widget.onItemSelected(newDropdownValue);
              },
            ),
          ),
        ),
      ],
    );
  }
}

