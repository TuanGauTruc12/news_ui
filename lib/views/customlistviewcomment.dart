import 'package:flutter/material.dart';
import 'package:news_ui/models/object/comment.dart';

class CustomListViewComment extends StatelessWidget {
  CustomListViewComment({super.key, required this.comments});
  List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [Text("Tuấn"), Text('23/3/2023')],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Hay quá")
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [Text("Tuấn"), Text('23/3/2023')],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Hay quá")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
