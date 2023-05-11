import 'package:flutter/material.dart';

class PasswordFieldCustom extends StatefulWidget {
  late String title;
  final input;
  PasswordFieldCustom({super.key, required this.title, required this.input});
  @override
  _PasswordFieldCustomState createState() => _PasswordFieldCustomState();
}

class _PasswordFieldCustomState extends State<PasswordFieldCustom> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return;
      }
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.input,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscured,
      focusNode: textFieldFocusNode,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: widget.title,
        filled: true,
        isDense: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIconColor: Colors.black,
        prefixIcon: const Icon(Icons.lock_rounded, size: 24),
        suffixIcon: GestureDetector(
          onTap: _toggleObscured,
          child: Icon(
            _obscured ? Icons.visibility_rounded : Icons.visibility_off_rounded,
            size: 24,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
