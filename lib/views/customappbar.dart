import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Color red800 = const Color(0xff159A9C);
    const double fontSize = 17;
    TextStyle textStyle = const TextStyle(fontSize: fontSize);
    DateTime now = DateTime.now();
    String date = "${now.day} tháng ${now.month}, ${now.year}";
    return Stack(
      children: <Widget>[
        Container(
          color: red800,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Chào bạn buổi sáng', style: textStyle),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Image(
                            image: AssetImage('images/calendar.png'),
                            height: 18,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text('T${now.weekday + 1}, $date',
                                  style: textStyle))
                        ],
                      ),
                    ],
                  )
                ],
              ),
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
