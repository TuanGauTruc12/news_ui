import 'package:flutter/material.dart';

class PersonTextField extends StatelessWidget {
  String hnitText;
  Widget iconData;
  TextInputType inputType;
  bool isChanged;

  PersonTextField(
      {super.key,
      required this.hnitText,
      required this.iconData,
      required this.inputType,
      required this.isChanged});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          flex: 2,
          child: SizedBox(
            height: 60,
            child: iconData,
          )),
      Expanded(
          flex: 8,
          child: TextField(
              obscureText:
                  inputType == TextInputType.visiblePassword ? true : false,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.blue)),
                hintText: hnitText,
              ),
              keyboardType: inputType,
              enabled: isChanged ? true : false))
    ]);
  }
}
