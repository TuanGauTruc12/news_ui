import 'package:flutter/material.dart';
import 'package:news_ui/views/timeListViewCustom.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String city;
  String temperature;
  CustomAppBar({super.key, required this.city, required this.temperature});

  @override
  Widget build(BuildContext context) {
    Color red800 = const Color(0xff159A9C);
    const double fontSize = 17;
    TextStyle textStyle = const TextStyle(fontSize: fontSize);
    DateTime now = DateTime.now();
    int hours = now.hour;
    String messageAppbar = "";

    if (hours >= 1 && hours <= 12) {
      messageAppbar = "buổi sáng";
    } else if (hours >= 12 && hours <= 18) {
      messageAppbar = "buổi chiều";
    } else {
      messageAppbar = "Good tối";
    }

    return Stack(
      children: [
        Container(
          color: red800,
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
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: const Icon(Icons.menu),
                color: Colors.black,
                onPressed: () => Scaffold.of(context).openDrawer()),
            primary: false,
            title: const TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold))),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset('images/notification.png'),
                onPressed: () {},
                color: Colors.black,
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
