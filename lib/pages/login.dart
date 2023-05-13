import 'package:flutter/material.dart';
import 'package:news_ui/apis/global.dart';
import 'package:news_ui/apis/request_user.dart';
import 'package:news_ui/pages/ForgetPassword.dart';
import 'package:news_ui/pages/register.dart';
import 'package:news_ui/pages/splashscreen.dart';
import 'package:news_ui/views/passwordfieldcustom.dart';
import 'package:news_ui/views/textfieldcustom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";
  String error = "";
  double fontSize = 18;
  bool isDark = darkNotifier.value;

  @override
  Widget build(BuildContext context) {
    Color? color = !isDark ? Colors.grey[200] : Colors.transparent;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
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
                    color: color,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(22.0),
                      topRight: Radius.circular(22.0),
                    )),
                child: Column(children: [
                  const SizedBox(height: 24),
                  Text(
                    'Đăng nhập',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSize),
                  ),
                  const SizedBox(height: 32),
                  TextFieldCustom(
                      isRequired: false,
                      title: 'Nhập email',
                      type: TextInputType.emailAddress,
                      input: (value) {
                        email = value;
                      }),
                  const SizedBox(height: 32),
                  PasswordFieldCustom(
                      isRequired: false,
                      title: 'Nhập mật khẩu',
                      input: (value) {
                        password = value;
                      }),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgetPasswordPage()),
                            );
                          },
                          child: Text(
                            'Quên mật khẩu?',
                            style: TextStyle(fontSize: fontSize),
                          )),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: error.isEmpty
                        ? const SizedBox()
                        : Text(
                            error,
                            style: TextStyle(
                                color: Colors.red, fontSize: fontSize),
                          ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff159A9C)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(16)),
                        ),
                        onPressed: () => {
                              //call api login
                              RequestUser()
                                  .login(email, password)
                                  .then((value) {
                                if (value.user == null) {
                                  setState(() {
                                    error =
                                        "Tài khoản sai! Vui lòng kiểm tra lại";
                                  });
                                } else {
                                  setState(() {
                                    user = value.user;
                                    error = "";
                                    Navigator.pop(context);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SplashScreen()));
                                  });
                                }
                              })
                            },
                        child: Text(
                          'Đăng nhập',
                          style: TextStyle(fontSize: fontSize),
                        )),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bạn đã có tài khoản?",
                        style: TextStyle(fontSize: fontSize),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff159A9C)),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(16))),
                        onPressed: () {
                          //Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()),
                          );
                        },
                        child: Text(
                          "Đăng ký ngay",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize,
                          ),
                        ),
                      )
                    ],
                  ),
                ])),
          )
        ]));
  }
}
