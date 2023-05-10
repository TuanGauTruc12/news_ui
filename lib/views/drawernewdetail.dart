import 'package:flutter/material.dart';
import 'package:news_ui/apis/global.dart';

class DrawerNewDetail extends StatefulWidget {
  double sizeIcon = 35;
  final setFontSize;
  DrawerNewDetail({super.key, required this.setFontSize});

  @override
  State<DrawerNewDetail> createState() => _DrawerNewDetailState();
}

class _DrawerNewDetailState extends State<DrawerNewDetail> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 120,
          right: 0,
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(children: [
                      Icon(Icons.brightness_4, size: widget.sizeIcon),
                      const SizedBox(width: 4),
                      const Text('Theme:')
                    ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Radio<Brightness>(
                              value: Brightness.light,
                              groupValue: brightness,
                              onChanged: (Brightness? value) {
                                setState(() {
                                  brightness = value;
                                });
                              },
                            ),
                            const Text("Sáng")
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, right: 20),
                        child: Row(
                          children: [
                            Radio<Brightness>(
                              value: Brightness.dark,
                              groupValue: brightness,
                              onChanged: (Brightness? value) {
                                setState(() {
                                  brightness = value;
                                });
                              },
                            ),
                            const Text("Tối")
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(children: [
                      ImageIcon(
                        const AssetImage('images/size.png'),
                        size: widget.sizeIcon,
                      ),
                      const SizedBox(width: 4),
                      const Text('Cỡ chữ:')
                    ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20, top: 10),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              widget.setFontSize(true);
                              return;
                            },
                            icon: Icon(Icons.add, size: widget.sizeIcon)),
                        const SizedBox(width: 15),
                        ImageIcon(
                          const AssetImage('images/size-center.png'),
                          size: widget.sizeIcon,
                        ),
                        const SizedBox(width: 15),
                        IconButton(
                          onPressed: () {
                            widget.setFontSize(false);
                            return;
                          },
                          icon: Icon(
                            Icons.remove,
                            size: widget.sizeIcon,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ]),
          ),
        )
      ],
    );
  }
}
