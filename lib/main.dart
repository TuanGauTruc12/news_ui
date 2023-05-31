import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_ui/apis/global.dart';
import 'package:news_ui/pages/forgetpasswordpage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: darkNotifier,
        builder: (BuildContext context, bool isDark, Widget? child) {
          return MaterialApp(
            title: 'News',
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(
                primarySwatch: const MaterialColor(
              0xff159A9C,
              <int, Color>{
                50: Color(0xffffffff),
                100: Color(0xffffffff),
                200: Color(0xffffffff),
                300: Color(0xffffffff),
                400: Color(0xffffffff),
                500: Color(0xffffffff),
                600: Color(0xffffffff),
                700: Color(0xffffffff),
                800: Color(0xffffffff),
                900: Color(0xffffffff),
              },
            )),
            darkTheme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            home: const ForgetPasswordPage(),
          );
        });
  }
}
