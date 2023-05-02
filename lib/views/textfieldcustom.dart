import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  late String _title;
  late TextInputType _type;

  TextFieldCustom(String title, TextInputType type, {super.key}) {
    _title = title;
    _type = type;
  }

  @override
  _TextFieldCustomState createState() => _TextFieldCustomState(_title, _type);
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  late String _title;
  late TextInputType _type;
  _TextFieldCustomState(String title, TextInputType type) {
    _title = title;
    _type = type;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            hintText: _title,
            floatingLabelStyle: const TextStyle(color: Colors.red),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: _type == TextInputType.emailAddress
                ? const Icon(Icons.email, size: 24)
                : const SizedBox(height: 0),
            prefixIconColor: Colors.red),
        keyboardType: _type);
  }
}
