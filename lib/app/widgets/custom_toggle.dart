import 'package:flutter/material.dart';
import 'package:screl_flutter_project/app/widgets/constants.dart';

class CustomToggle extends StatefulWidget {
  final String label;
  final ValueChanged<bool> onChanged;

  const CustomToggle({required this.label, required this.onChanged, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomToggleState createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.label),
        Switch(
          activeColor: kPrimaryColor,
          value: _value,
          onChanged: (bool newValue) {
            setState(() => _value = newValue);
            widget.onChanged(newValue);
          },
        ),
      ],
    );
  }
}
