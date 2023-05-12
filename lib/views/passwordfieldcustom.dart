import 'package:flutter/material.dart';
import 'package:news_ui/apis/global.dart';

class PasswordFieldCustom extends StatefulWidget {
  late String title;
  final input;
  bool isRequired;

  PasswordFieldCustom(
      {super.key,
      required this.title,
      required this.input,
      required this.isRequired});
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
    bool isDark = darkNotifier.value;
    Color? color = isDark ? Colors.grey[200] : Colors.black;
    return TextField(
        onChanged: widget.input,
        keyboardType: TextInputType.visiblePassword,
        obscureText: _obscured,
        focusNode: textFieldFocusNode,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: widget.title,
            contentPadding:
                const EdgeInsets.only(top: 20, bottom: 20, right: 32, left: 0),
            filled: true,
            isDense: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIconColor: color,
            prefixIcon: const Icon(Icons.lock_rounded, size: 24),
            suffixIcon: widget.isRequired
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ImageIcon(
                        AssetImage('images/asterisk.png'),
                        color: Colors.red,
                        size: 14,
                      ),
                      IconButton(
                        onPressed: _toggleObscured,
                        icon: Icon(
                          _obscured
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                : GestureDetector(
                    onTap: _toggleObscured,
                    child: Icon(
                      _obscured
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      size: 20,
                      color: Colors.black,
                    ),
                  )));
  }
}
