import 'package:flutter/material.dart';
import 'package:news_ui/apis/global.dart';
import 'package:news_ui/pages/newdetailpage.dart';

class NewListViewCustom extends StatelessWidget {
  String? image;
  String? sumary;
  String? author;
  String? datePost;
  String? slug;

  NewListViewCustom(
      {super.key,
      required this.image,
      required this.sumary,
      required this.author,
      required this.datePost,
      required this.slug});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewDetailPage(slug: slug!)));
        },
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network('$URL/$GET_IMAGES/$image',
                        fit: BoxFit.cover, height: 100, width: 100),
                    const Padding(padding: EdgeInsets.all(4)),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Text(
                            sumary!,
                            style: const TextStyle(overflow: TextOverflow.fade),
                            maxLines: 6,
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                const Icon(Icons.access_time),
                                Text(datePost!)
                              ]),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Row(children: [
                                  const Icon(Icons.account_box_sharp),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 4)),
                                  Expanded(
                                    child: Text(author!,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                            overflow: TextOverflow.fade),
                                        textDirection: TextDirection.ltr),
                                  )
                                ]),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}
