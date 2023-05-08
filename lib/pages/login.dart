import 'package:flutter/material.dart';
import 'package:news_ui/views/passwordfieldcustom.dart';
import 'package:news_ui/views/textfieldcustom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: <Widget>[
          const Expanded(
              child: Image(
                  image: AssetImage('images/logo.png'),
                  height: 200,
                  width: 200)),
          Expanded(
            flex: 2,
            child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(22.0),
                      topRight: Radius.circular(22.0),
                    )),
                child: Column(children: [
                  const SizedBox(height: 24),
                  const Text(
                    'Đăng nhập',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 32),
                  TextFieldCustom('Nhập email', TextInputType.emailAddress),
                  const SizedBox(height: 32),
                  PasswordFieldCustom('Nhập mật khẩu'),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text('Quên mật khẩu?'),
                    ],
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff159A9C)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(20)),
                        ),
                        onPressed: () => {},
                        child: const Text('Đăng nhập')),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Bạn chưa có tài khoản?",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Đăng ký ngay",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ])),
          )
        ]));
  }
}
