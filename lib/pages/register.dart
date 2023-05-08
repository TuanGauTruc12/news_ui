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
                  TextFieldCustom("Họ", TextInputType.text),
                  const SizedBox(height: 12),
                  TextFieldCustom("Tên", TextInputType.text),
                  const SizedBox(height: 12),
                  TextFieldCustom("Email", TextInputType.emailAddress),
                  const SizedBox(height: 12),
                  TextFieldCustom("Số điện thoại", TextInputType.number),
                  const SizedBox(height: 12),
                  PasswordFieldCustom("Nhập mật khẩu"),
                  const SizedBox(height: 12),
                  PasswordFieldCustom("Nhập lại mật khẩu"),
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
