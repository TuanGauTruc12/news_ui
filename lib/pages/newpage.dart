import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:news_ui/apis/global.dart';
import 'package:news_ui/apis/request_new.dart';
import 'package:news_ui/models/object/comment.dart';
import 'package:news_ui/models/object/new.dart';
import 'package:news_ui/views/appbarnewdetail.dart';
import 'package:news_ui/views/textfieldcustom.dart';

class NewPage extends StatefulWidget {
  String? slug;
  NewPage({super.key, required this.slug});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  New? newDetail;
  List<Comment>? comments;
  bool backScreen = false;

  @override
  Widget build(BuildContext context) {
    if (!backScreen) {
      RequestNew.fetchNewDetail(widget.slug!).then(
        (value) {
          setState(() {
            if (value.success == true && value.message == "successfully") {
              newDetail = value.newDetail!;
              comments = value.comments!;
              backScreen = true;
            }
          });
        },
      );
    }

    return Scaffold(
        appBar: const AppbarNewDetail(),
        body: newDetail == null
            ? const Center(
                child: CircularProgressIndicator(
                  value: null,
                  strokeWidth: 7.0,
                ),
              )
            : Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 60),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 8, left: 8, right: 8),
                            child: Image.network(
                                '$URL/$GET_IMAGES/${newDetail!.image}'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8, top: 8),
                            width: MediaQuery.of(context).size.width,
                            child: Text(newDetail!.title ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 8, right: 8, top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.person),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(newDetail!.author ?? ""),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.access_time),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(newDetail!.postingDate ?? ""),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Html(data: newDetail!.content, style: {
                            "body": Style(
                                fontSize: const FontSize(18),
                                textAlign: TextAlign.justify),
                          })
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        color: Colors.white,
                        child: Row(children: [
                          Expanded(
                              flex: 8,
                              child: TextFieldCustom(
                                  'Bình luận', TextInputType.text)),
                          Expanded(
                              flex: 2,
                              child: Container(
                                color: Colors.white,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.send,
                                    color: Colors.blue,
                                  ),
                                ),
                              ))
                        ]),
                      ))
                ],
              ));
  }
}
