import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final ValueChanged<String> onChangeInput;
  final String label;
  const TextFieldWidget({
    Key? key,
    required this.onChangeInput,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      ),
      onChanged: onChangeInput,
    );
  }
}
