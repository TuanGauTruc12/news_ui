import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_ui/apis/global.dart';
import 'package:news_ui/pages/changepasswordpage.dart';
import 'package:news_ui/views/persontextfield.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  Random random = Random(2);
  final textFieldFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: primaryLight,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.arrow_back_ios),
              ),
              const Text('Thông tin cá nhân')
            ],
          )),
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  child: GestureDetector(
                onTap: () {},
                child: Stack(
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/person-logo.png'),
                      radius: 40,
                    ),
                    Positioned(
                        bottom: -4,
                        right: 0,
                        child: Icon(Icons.camera_alt_sharp, size: 30))
                  ],
                ),
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
                    hnitText: 'Nhập họ và tên',
                    iconData: const Icon(
                      Icons.person_2_outlined,
                      size: 40,
                    ),
                    isChanged: true,
                    inputType: TextInputType.text),
                PersonTextField(
                    hnitText: 'Nhập số điện thoại',
                    iconData: const Icon(
                      Icons.phone_android,
                      size: 40,
                    ),
                    isChanged: true,
                    inputType: TextInputType.phone),
                PersonTextField(
                    hnitText: 'Nhập email',
                    iconData: const Icon(
                      Icons.email_outlined,
                      size: 40,
                    ),
                    isChanged: true,
                    inputType: TextInputType.emailAddress),
                PersonTextField(
                    hnitText: 'Nhập mật khẩu',
                    iconData: const ImageIcon(AssetImage('images/security.png'),
                        size: 40),
                    isChanged: false,
                    inputType: TextInputType.visiblePassword),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChangePasswordPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      backgroundColor: primaryLight,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  child: Text('Lưu thay đổi'.toUpperCase()),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangePasswordPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: primaryLight,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                child: Text('Đổi mật khẩu'.toUpperCase()),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      backgroundColor: primaryLight,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  child: Text('Đăng xuất'.toUpperCase()))
            ],
          ),
        )
      ]),
    );
  }
}
