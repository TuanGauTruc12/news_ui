import 'package:flutter/material.dart';

class AppbarNewDetail extends StatelessWidget implements PreferredSizeWidget {
  const AppbarNewDetail({super.key});

  @override
  Widget build(BuildContext context) {
    const double fontSize = 17;
    return Stack(
      children: [
        Container(
          color: Colors.white,
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
                backgroundColor: Colors.white,
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.black,
                    onPressed: () => Navigator.pop(context)),
                primary: false,
                title: Row(
                  children: [
                    Expanded(
                        child: Image.asset('images/logo-mini.png',
                            fit: BoxFit.contain))
                  ],
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    color: Colors.black,
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
