import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:news_ui/apis/global.dart';
import 'package:news_ui/apis/request_comment.dart';
import 'package:news_ui/apis/request_new.dart';
import 'package:news_ui/models/object/comment.dart';
import 'package:news_ui/models/object/new.dart';
import 'package:news_ui/pages/login.dart';
import 'package:news_ui/views/appbarnewdetail.dart';
import 'package:news_ui/views/customlistviewcomment.dart';
import 'package:news_ui/views/drawernewdetail.dart';
import 'package:news_ui/views/textfieldcustom.dart';

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

    bool isClear = false;
    bool isDark = darkNotifier.value;
    return Scaffold(
        endDrawer: DrawerNewDetail(setFontSize: setFontSize),
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
                              textAlign: TextAlign.justify,
                            ),
                            "span": Style(
                                color: isDark ? Colors.white : Colors.black)
                          }),
                          comments!.isEmpty
                              ? Text(
                                  "Hiện chưa có người bình luận.".toUpperCase(),
                                  style: TextStyle(fontSize: fontSize + 2),
                                )
                              : CustomListViewComment(comments: comments!),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        child: user != null
                            ? Row(children: [
                                Expanded(
                                    flex: 8,
                                    child: TextFieldCustom(
                                      isRequired: false,
                                      title: 'Bình luận',
                                      type: TextInputType.text,
                                      input: (value) {
                                        contentComment = value;
                                      },
                                      isClear: isClear,
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor: isDark
                                                ? MaterialStateProperty.all(
                                                    Colors.transparent)
                                                : MaterialStateProperty.all(
                                                    const Color(0xff159A9C)),
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.all(16)),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ))),
                                        onPressed: () {
                                          if (contentComment.isNotEmpty) {
                                            DateTime now = DateTime.now();
                                            String dateTime =
                                                '${now.year}-${now.month}-${now.day}';
                                            RequestComment.sendComment(
                                                    contentComment,
                                                    dateTime,
                                                    newDetail!.id!,
                                                    user!.id!)
                                                .then((comment) => {
                                                      if (comment.success!)
                                                        {
                                                          RequestComment
                                                                  .fetchComment(
                                                                      newDetail!
                                                                          .slug!)
                                                              .then(
                                                                  (commentsFetch) {
                                                            setState(() {
                                                              comments =
                                                                  commentsFetch;
                                                              isClear = true;
                                                            });
                                                          })
                                                        }
                                                    });
                                          }
                                        },
                                        child: const Icon(Icons.send,
                                            color: Colors.white)))
                              ])
                            : ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xff159A9C)),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(16)),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()));
                                },
                                child: const Text(
                                  "Đăng nhập để bình luận",
                                  style: TextStyle(fontSize: 20),
                                )),
                      ))
                ],
              ));
  }
}
