import 'package:flutter/material.dart';
import 'package:news_ui/models/object/category.dart';

class CategoryListView extends StatefulWidget {
  List<Category> categories;
  final requestCategory;
  CategoryListView(
      {super.key, required this.categories, required this.requestCategory});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: MediaQuery.of(context).size.height,
          child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                widget.categories.length,
                (index) => GestureDetector(
                  onTap: () {
                    widget.requestCategory(widget.categories[index].slug);
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Container(
                        margin: const EdgeInsets.only(
                            left: 8, right: 16, top: 16, bottom: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "${widget.categories[index].title}",
                          style: const TextStyle(
                              backgroundColor: Colors.white, fontSize: 18),
                        )),
                  ),
                ),
              )))
    ]);
  }
}
