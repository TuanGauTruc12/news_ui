import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TimeListViewCustom extends StatelessWidget {
  String temperature;
  TimeListViewCustom(
      {super.key, required this.temperature, required this.city});
  String city;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var list = [
      {
        "image": "images/calendar.png",
        "data":
            'T${now.weekday + 1}, ${now.day} tháng ${now.month}, ${now.year}'
      },
      {"image": "images/temperature.png", "data": '$temperature°C, $city'}
    ];

    TextStyle textStyle = const TextStyle(fontSize: 14);

    List<Widget> listWidget = [];

    for (var e in list) {
      listWidget.add(Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            image: AssetImage('${e["image"]}'),
            height: 22,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 4),
          Expanded(
              child:
                  Text('${e["data"]}', style: textStyle )),
        ]),
      ));
    }

    return Container(
        height: 30,
        margin: const EdgeInsets.only(left: 24),
        child: CarouselSlider(
            options: CarouselOptions(
                scrollDirection: Axis.vertical,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn),
            items: listWidget));
  }
}
