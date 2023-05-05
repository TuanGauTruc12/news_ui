import 'package:flutter/material.dart';
import 'package:news_ui/models/object/newlistview.dart';
import 'package:news_ui/views/newlistviewcustom.dart';

class HomeBody extends StatelessWidget {
  List<NewListView> list;

  HomeBody({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return NewListViewCustom(
              author: list[index].author!,
              datePost: list[index].postingDate!,
              image: list[index].image!,
              sumary: list[index].summary!);
        });
  }
}
