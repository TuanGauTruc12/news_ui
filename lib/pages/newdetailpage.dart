import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:news_ui/apis/global.dart';
import 'package:news_ui/apis/request_new.dart';
import 'package:news_ui/models/object/comment.dart';
import 'package:news_ui/models/object/new.dart';
import 'package:news_ui/views/appbarnewdetail.dart';
import 'package:news_ui/views/textfieldcustom.dart';
import 'package:news_ui/views/drawernewdetail.dart';

class NewDetailPage extends StatefulWidget {
  String? slug;
  NewDetailPage({super.key, required this.slug});

  @override
  State<NewDetailPage> createState() => _NewDetailPageState();
}

class _NewDetailPageState extends State<NewDetailPage> {
  New? newDetail;
  List<Comment>? comments;
  bool backScreen = false;
  String contentComment = "";

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

    void setFontSize(bool checkSize) {
      if (checkSize == true) {
        setState(() {
          fontSize++;
          return;
        });
        return;
      } else {
        setState(() {
          fontSize--;
          return;
        });
        return;
      }
    }

    bool isDark = darkNotifier.value;

    return Scaffold(
        endDrawer: DrawerNewDetail(setFontSize: setFontSize, isDark: isDark),
        appBar: AppbarNewDetail(isDark: isDark),
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
                                fontSize: FontSize(fontSize),
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
                        child: Row(children: [
                          Expanded(
                              flex: 8,
                              child: TextFieldCustom(
                                title: 'Bình luận',
                                type: TextInputType.text,
                                input: (value) {
                                  contentComment = value;
                                },
                              )),
                          Expanded(
                              flex: 2,
                              child: Container(
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