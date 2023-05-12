import 'package:flutter/material.dart';
import 'package:news_ui/apis/global.dart';
import 'package:news_ui/models/object/comment.dart';
import 'package:intl/intl.dart';

class CustomListViewComment extends StatelessWidget {
  CustomListViewComment({super.key, required this.comments});
  List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    final dateFormat = DateFormat('dd-MM-yyyy');

    for (int i = 0; i < comments.length; i++) {
      widgets.add(
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: user == null
                  ? CrossAxisAlignment.start
                  : (user!.id == comments[i].idUser
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start),
              children: [
                Row(
                    mainAxisAlignment: user == null
                        ? MainAxisAlignment.start
                        : (user!.id == comments[i].idUser
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start),
                    children: [
                      Text(comments[i].nameUser!),
                      const SizedBox(width: 20),
                      Text(dateFormat.format(
                          DateTime.parse(comments[i].commentDate!).toLocal()))
                    ]),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(comments[i].content!),
                )
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: widgets,
      ),
    );
  }
}
