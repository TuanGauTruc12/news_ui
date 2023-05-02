import 'package:flutter/material.dart';

class TimeListViewCustom extends StatelessWidget {
  final ScrollController scrollController;

  const TimeListViewCustom({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var list = [
      {
        "image": "assets/calendar.png",
        "data": '${now.day} tháng ${now.month}, ${now.year}'
      },
      {"image": "assets/temperature.png", "data": "30°C, TP. Hồ Chí Minh"}
    ];
    const double fontSize = 17;
    TextStyle textStyle = const TextStyle(fontSize: fontSize);
    return SizedBox(
      child: ListView.builder(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Image(
                  image: AssetImage(list[index]["image"] as String),
                  height: 18,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text('${list[index]["data"]}', style: textStyle))
              ],
            );
          }),
    );
  }
}
