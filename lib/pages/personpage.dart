import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_ui/apis/global.dart';
import 'package:news_ui/pages/changepasswordpage.dart';
import 'package:news_ui/pages/login.dart';
import 'package:news_ui/views/buttomnavigationcustom.dart';
import 'package:news_ui/views/persontextfield.dart';
import 'package:image_picker/image_picker.dart';

class PersonPage extends StatefulWidget {
  final onItemTapped;
  int selectedIndex;

  PersonPage(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  final textFieldFocusNode = FocusNode();
  File? avatarImageFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _onImageButtonPressed(ImageSource source) async {
    PickedFile? image = await _picker.getImage(source: source);

    if (image != null) {
      setState(() {
        final File file = File(image.path);
        avatarImageFile = file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = darkNotifier.value;
    Color? backgroundColor;
    String name = "";
    String mobile = "";
    String email = "";
    String image = "";
    if (user != null) {
      name = user!.name!;
      mobile = user!.mobile!;
      email = user!.email!;
      image = user!.image!;
    }

    if (!isDark) {
      backgroundColor = primaryLight;
    } else {
      backgroundColor = Colors.transparent;
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Thông tin cá nhân'),
          automaticallyImplyLeading: false,
        ),
        body: user == null
            ? Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(backgroundColor),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12)),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
                    child: const Text("Đăng nhập")),
              )
            : Column(children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          child: GestureDetector(
                        onTap: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Chọn phương thức ảnh'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _onImageButtonPressed(ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(Icons.camera_alt),
                                        SizedBox(width: 4),
                                        Text('Chụp ảnh',
                                            textDirection: TextDirection.ltr)
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 28),
                                  GestureDetector(
                                    onTap: () {
                                      _onImageButtonPressed(
                                          ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(Icons.photo),
                                        SizedBox(width: 4),
                                        Text("Chọn ảnh từ máy",
                                            textDirection: TextDirection.ltr)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Hủy'),
                                )
                              ],
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            avatarImageFile == null
                                ? CircleAvatar(
                                    radius: 40,
                                    child: image.isEmpty
                                        ? const Image(
                                            image: AssetImage(
                                                'images/person-logo.png'))
                                        : Image(
                                            image: NetworkImage(
                                                '$URL/$GET_IMAGES/$URL_USER/$image')),
                                  )
                                : Image.file(avatarImageFile!),
                            const Positioned(
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
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        PersonTextField(
                            data: name,
                            setData: (value) {
                              name = value;
                            },
                            hnitText: 'Nhập họ và tên',
                            iconData: const Icon(
                              Icons.person_2_outlined,
                              size: 40,
                            ),
                            isChanged: true,
                            inputType: TextInputType.text),
                        PersonTextField(
                            data: mobile,
                            hnitText: 'Nhập số điện thoại',
                            iconData: const Icon(
                              Icons.phone_android,
                              size: 40,
                            ),
                            isChanged: true,
                            inputType: TextInputType.phone),
                        PersonTextField(
                            data: email,
                            hnitText: 'Nhập email',
                            iconData: const Icon(
                              Icons.email_outlined,
                              size: 40,
                            ),
                            isChanged: true,
                            inputType: TextInputType.emailAddress),
                        PersonTextField(
                            data: user!.password!,
                            hnitText: 'Nhập mật khẩu',
                            iconData: const ImageIcon(
                                AssetImage('images/security.png'),
                                size: 40),
                            isChanged: false,
                            inputType: TextInputType.visiblePassword),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            print(email);
                            print(mobile);
                            print(name);
                            //print(image);
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              backgroundColor: backgroundColor,
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
                                builder: (context) => ChangePasswordPage(
                                    backgroundColor: backgroundColor)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            backgroundColor: backgroundColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        child: Text('Đổi mật khẩu'.toUpperCase()),
                      ),
                      ElevatedButton(
                          onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Đăng xuất'),
                                  content:
                                      const Text("Bạn muốn đăng xuất không?"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('Không'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'Cancel');
                                        setState(() {
                                          user = null;
                                        });
                                      },
                                      child: const Text('Có'),
                                    ),
                                  ],
                                ),
                              ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              backgroundColor: backgroundColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          child: Text('Đăng xuất'.toUpperCase()))
                    ],
                  ),
                )
              ]),
        bottomNavigationBar: BottomNavigationCustom(
            selectedIndex: widget.selectedIndex,
            onItemTapped: widget.onItemTapped));
  }
}
