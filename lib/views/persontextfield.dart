import 'package:flutter/material.dart';

class PersonTextField extends StatelessWidget {
  String hnitText;
  Widget iconData;
  TextInputType inputType;
  bool isChanged;
  String data;
  final setData;

  PersonTextField(
      {super.key,
      required this.hnitText,
      required this.iconData,
      required this.inputType,
      required this.isChanged,
      required this.data,
      this.setData});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    controller.text = data;

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
              onChanged: setData,
              controller: controller,
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
