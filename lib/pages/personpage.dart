import 'package:flutter/material.dart';
import 'package:news_ui/apis/global.dart';
import 'package:news_ui/pages/changepasswordpage.dart';
import 'package:news_ui/pages/login.dart';
import 'package:news_ui/views/buttomnavigationcustom.dart';
import 'package:news_ui/views/persontextfield.dart';

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
                        onTap: () {},
                        child: Stack(
                          children: const [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('images/person-logo.png'),
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
