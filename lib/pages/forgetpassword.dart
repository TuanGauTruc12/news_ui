import 'package:flutter/material.dart';
import 'package:news_ui/views/textfieldcustom.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  String email = "";

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
                    title: "Nhập email",
                    type: TextInputType.emailAddress,
                    input: (value) {
                      email = value;
                    }),
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
                    
                  },
                  child: const Text('Xác nhận'))
            ],
          ))
    ]));
  }
}
