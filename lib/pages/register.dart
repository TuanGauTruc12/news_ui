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
  late bool isChecked;
  late String name;
  late String email;
  late String phoneNumber;
  late String password;
  late String repassword;
  late String error;
  late bool isClear;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isChecked = false;
    error = "";
    name = "";
    phoneNumber = "";
    email = "";
    password = "";
    repassword = "";
    isClear = false;
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = darkNotifier.value;
    Color? color = !isDark ? Colors.grey[200] : Colors.transparent;
    double fontSize = 17;
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
                    isClear: isClear,
                    isRequired: false,
                    title: "Họ và tên",
                    type: TextInputType.text,
                    input: (value) {
                      name = value;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFieldCustom(
                      isClear: isClear,
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
                      isClear: isClear,
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
                            setState(() {
                              error = "Tên không được bỏ trống!";
                              isChecked = true;
                            });
                            print("name");
                          } else if (!emailValidate) {
                            //lỗi email không phù hợp
                            setState(() {
                              error = "Email không phù hợp";
                              isChecked = true;
                            });
                            print("email");
                          } else if (password.length < 8) {
                            //Lỗi password nhỏ hơn 8 ký tự
                            setState(() {
                              error = "Mật khẩu phải từ 8 ký tự trở lên";
                              isChecked = true;
                            });
                          } else if (password != repassword) {
                            setState(() {
                              error = "Mật khẩu nhập lại không khớp!";
                              isChecked = true;
                            });
                            //lỗi passwor & repassword không trùng nhau
                            print("repassword");
                          } else if (!isChecked) {
                            //Lỗi chưa đồng ý điều khoản
                            setState(() {
                              error = "Bạn chưa đồng ý các điều khoản!";
                              isChecked = true;
                            });
                          } else {
                            //call api
                            error = "";
                            RequestUser()
                                .register(name, email, phoneNumber, password)
                                .then((message) {
                              if (message.success! &&
                                  message.message == "SucessFully") {
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
                                                isChecked = true;
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