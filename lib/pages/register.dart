import 'package:flutter/material.dart';
import 'package:news_ui/apis/global.dart';
import 'package:news_ui/apis/request_user.dart';
import 'package:news_ui/pages/login.dart';
import 'package:news_ui/pages/splashscreen.dart';
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
    bool isDark = darkNotifier.value;
    Color? color = !isDark ? Colors.grey[200] : Colors.transparent;
    double fontSize = 17;
    String error = "Lỗi";
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
                    color: color,
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
                    isRequired: true,
                    title: "Họ và tên",
                    type: TextInputType.text,
                    input: (value) {
                      name = value;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFieldCustom(
                      isRequired: true,
                      title: "Email",
                      type: TextInputType.emailAddress,
                      input: (value) {
                        setState(() {
                          email = value;
                        });
                      }),
                  const SizedBox(height: 12),
                  TextFieldCustom(
                      isRequired: false,
                      title: "Số điện thoại",
                      type: TextInputType.number,
                      input: (value) {
                        phoneNumber = value;
                      }),
                  const SizedBox(height: 12),
                  PasswordFieldCustom(
                      isRequired: true,
                      title: "Nhập mật khẩu",
                      input: (value) {
                        password = value;
                      }),
                  const SizedBox(height: 12),
                  PasswordFieldCustom(
                      isRequired: true,
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
                  error.isEmpty
                      ? Container()
                      : Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(error,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                              )),
                        ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff159A9C)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(20)),
                        ),
                        onPressed: () {
                          final bool emailValidate = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email);
                          if (name.isEmpty) {
                            //lỗi name trống
                            print("name");
                          } else if (!emailValidate) {
                            //lỗi email không phù hợp
                            print("email");
                          } else if (password.length < 8) {
                            //Lỗi password nhỏ hơn 8 ký tự
                            print("password");
                          } else if (password != repassword) {
                            //lỗi passwor & repassword không trùng nhau
                            print("repassword");
                          } else if (!isChecked) {
                            //Lỗi chưa đồng ý điều khoản
                            print("điều khoản");
                          } else {
                            //call api
                            error = "";
                            RequestUser()
                                .register(name, email, phoneNumber, password)
                                .then((message) {
                              if (message.success! &&
                                  message.message == "SucessFully") {
                                print(message);
                                showDialog(
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
                                        onPressed: () {
                                          RequestUser()
                                              .login(email, password)
                                              .then((models) {
                                            if (models.success == true) {
                                              setState(() {
                                                user = models.user;
                                              });
                                              Navigator.pushAndRemoveUntil<
                                                  dynamic>(
                                                context,
                                                MaterialPageRoute<dynamic>(
                                                  builder:
                                                      (BuildContext context) =>
                                                          const SplashScreen(),
                                                ),
                                                (route) => false,
                                              );
                                            }
                                          });
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                setState(() {
                                  error = message.message!;
                                });
                              }
                            });
                          }
                        },
                        child: const Text('Đăng ký')),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Bạn chưa có tài khoản?",
                        style: TextStyle(fontSize: fontSize),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xff159A9C),
                            ),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(16))),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: Text(
                          "Đăng nhập ngay",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: fontSize),
                        ),
                      )
                    ],
                  ),
                ])),
          )
        ]));
  }
}

/*

showDialog(
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
*/