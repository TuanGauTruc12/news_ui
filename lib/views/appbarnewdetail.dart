import 'package:flutter/material.dart';

class AppbarNewDetail extends StatelessWidget implements PreferredSizeWidget {
  AppbarNewDetail({super.key, required this.isDark});

  bool isDark;

  @override
  Widget build(BuildContext context) {
    const double fontSize = 17;
    Widget image;
    if (isDark) {
      image = Image.asset('images/logo-mini.png', fit: BoxFit.contain);
    } else {
      image = Image.asset('images/logo-mini.png', fit: BoxFit.contain);
    }

    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(),
          ),
        ),
        Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: AppBar(
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context)),
                primary: false,
                title: Row(
                  children: [Expanded(child: image)],
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  )
                ],
              ),
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
