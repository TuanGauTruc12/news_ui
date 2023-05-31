import 'package:flutter/material.dart';
import 'package:news_ui/apis/request_user.dart';
import 'package:news_ui/views/textfieldcustom.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  late String email;
  late bool isClear;
  late String error;
  late Color colorTextMessage;

  @override
  void initState() {
    isClear = false;
    email = "";
    error = "";
    colorTextMessage = Colors.red;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const Expanded(
          child: Image(
              image: AssetImage('images/logo.png'), height: 200, width: 200)),
      Expanded(
          flex: 2,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Text("Quên mật khẩu")],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Mời bạn nhập Email phía bên dưới"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: TextFieldCustom(
                    isClear: isClear,
                    isRequired: false,
                    title: "Nhập email",
                    type: TextInputType.emailAddress,
                    input: (value) {
                      email = value;
                    }),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text(error,
                    style: TextStyle(fontSize: 18, color: colorTextMessage)),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff159A9C)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 16)),
                  ),
                  onPressed: () {
                    final bool emailValidate = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email);

                    if (!emailValidate) {
                      setState(() {
                        colorTextMessage = Colors.red;
                        error = "Bạn nhập email chưa chính xác!!!";
                      });
                      return;
                    }

                    RequestUser.forgetPassword(email).then((message) {
                      if (!(message.success!)) {
                        setState(() {
                          error = message.message!;
                        });
                      } else {
                        setState(() {
                          colorTextMessage = Colors.green;
                          error = message.message!;
                          isClear = true;
                        });
                      }
                    });
                  },
                  child: const Text('Xác nhận')),
            ],
          ))
    ]));
  }
}
