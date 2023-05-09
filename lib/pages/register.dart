import 'package:flutter/material.dart';
import 'package:news_ui/pages/login.dart';
import 'package:news_ui/views/alertdialogcustom.dart';
import 'package:news_ui/views/passwordfieldcustom.dart';
import 'package:news_ui/views/textfieldcustom.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isChecked = false;
  String name = "";
  String email = "";
  String phoneNumber = "";
  String password = "";
  String repassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 15)),
          const Expanded(
              child: Image(
                  image: AssetImage('images/logo.png'),
                  height: 200,
                  width: 200)),
          Expanded(
            flex: 4,
            child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(22.0),
                      topRight: Radius.circular(22.0),
                    )),
                child: Column(children: [
                  const SizedBox(height: 18),
                  const Text(
                    'Đăng ký',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 18),
                  TextFieldCustom(
                    title: "Họ và tên",
                    type: TextInputType.text,
                    input: (value) {
                      name = value;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFieldCustom(
                      title: "Email",
                      type: TextInputType.emailAddress,
                      input: (value) {
                        email = value;
                      }),
                  const SizedBox(height: 12),
                  TextFieldCustom(
                      title: "Số điện thoại",
                      type: TextInputType.number,
                      input: (value) {
                        phoneNumber = value;
                      }),
                  const SizedBox(height: 12),
                  PasswordFieldCustom(
                      title: "Nhập mật khẩu",
                      input: (value) {
                        password = value;
                      }),
                  const SizedBox(height: 12),
                  PasswordFieldCustom(
                      title: "Nhập lại mật khẩu",
                      input: (value) {
                        repassword = value;
                      }),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) => Colors.green),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      const Text('Tôi đồng ý với điều khoản sử dụng')
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff159A9C)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(12)),
                        ),
                        onPressed: () => showDialog(
                              context: context,
                              builder: (ctx) => PlaceholderDialog(
                                icon: const CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.green,
                                  child: Icon(
                                    Icons.check,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                                message: 'Chúc mừng bạn đăng ký thành công',
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pushAndRemoveUntil<dynamic>(
                                      context,
                                      MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) =>
                                            const LoginPage(),
                                      ),
                                      (route) => false,
                                    ),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            ),
                        child: const Text('Đăng ký')),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Bạn chưa có tài khoản?",
                        style: TextStyle(fontSize: 13),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Đăng ký ngay",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 13),
                        ),
                      )
                    ],
                  ),
                ])),
          )
        ]));
  }
}
