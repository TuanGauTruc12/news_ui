import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  String title;
  TextInputType type;
  final input;
  bool isRequired;

  TextFieldCustom(
      {super.key,
      required this.title,
      required this.type,
      required this.input,
      required this.isRequired});

  @override
  _TextFieldCustomState createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: widget.input,
        decoration: InputDecoration(
            hintText: widget.title,
            floatingLabelStyle: const TextStyle(color: Colors.red),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            ),
            suffixIconColor: Colors.red,
            suffixIcon: widget.isRequired
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      ImageIcon(
                        AssetImage('images/asterisk.png'),
                        size: 15,
                      )
                    ],
                  )
                : const SizedBox(),
            prefixIcon: widget.type == TextInputType.emailAddress
                ? const Icon(Icons.email, size: 24)
                : const SizedBox(height: 0),
            prefixIconColor: Colors.red),
        keyboardType: widget.type);
  }
}
