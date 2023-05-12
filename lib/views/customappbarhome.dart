import 'package:flutter/material.dart';
import 'package:news_ui/apis/global.dart';
import 'package:news_ui/views/timeListViewCustom.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String city;
  String temperature;
  final searchNews;
  final onChangeBright;
  CustomAppBar(
      {super.key,
      required this.city,
      required this.temperature,
      required this.searchNews,
      required this.onChangeBright});

  @override
  Widget build(BuildContext context) {
    const double fontSize = 17;
    TextStyle textStyle = const TextStyle(fontSize: fontSize);
    DateTime now = DateTime.now();
    int hours = now.hour;
    String messageAppbar = "";
    bool isDark = darkNotifier.value;

    if (hours >= 1 && hours <= 12) {
      messageAppbar = "buổi sáng";
    } else if (hours >= 12 && hours <= 18) {
      messageAppbar = "buổi chiều";
    } else {
      messageAppbar = "buổi tối";
    }

    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
            child: Container(
              alignment: Alignment.bottomRight,
              child: Row(children: [
                Text('Chào bạn $messageAppbar', style: textStyle),
                Expanded(
                    child: TimeListViewCustom(
                        city: city, temperature: temperature)),
              ]),
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 20.0,
          right: 20.0,
          child: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer()),
            primary: false,
            title: TextField(
                onChanged: searchNews,
                decoration: const InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold))),
            actions: [
              IconButton(
                icon: const Icon(Icons.brightness_4),
                onPressed: () {
                  onChangeBright(isDark);
                  //Light=false
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(125);
}
