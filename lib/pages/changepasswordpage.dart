import 'package:flutter/material.dart';
import 'package:news_ui/apis/global.dart';
import 'package:news_ui/views/persontextfield.dart';

class ChangePasswordPage extends StatefulWidget {
  ChangePasswordPage({super.key, required this.backgroundColor});
  Color? backgroundColor;

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const Text('Thông tin cá nhân')),
        body: Column(children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                    child: CircleAvatar(
                  backgroundImage: AssetImage('images/person-logo.png'),
                  radius: 40,
                )),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  PersonTextField(
                      data: user!.password!,
                      hnitText: 'Mật khẩu hiện tại',
                      iconData: const ImageIcon(
                          AssetImage('images/security.png'),
                          size: 30),
                      isChanged: true,
                      inputType: TextInputType.visiblePassword),
                  PersonTextField(
                      data: "",
                      hnitText: 'Mật khẩu mới',
                      iconData: const ImageIcon(
                          AssetImage('images/security.png'),
                          size: 40),
                      isChanged: true,
                      inputType: TextInputType.visiblePassword),
                  PersonTextField(
                    data: "",
                    hnitText: 'Nhập lại mật khẩu mới',
                    iconData: const ImageIcon(AssetImage('images/security.png'),
                        size: 40),
                    inputType: TextInputType.visiblePassword,
                    isChanged: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          backgroundColor: widget.backgroundColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      child: Text('Lưu thay đổi'.toUpperCase()),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]));
  }
}
