import 'package:flutter/material.dart';
import 'package:news_ui/apis/global.dart';
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
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 8, right: 16, top: 16, bottom: 8),
                    child: Stack(
                      children: [
                        Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.network(
                              '$URL/$GET_IMAGES/${widget.categories[index].imageCategory}',
                              fit: BoxFit.cover,
                              height: 100,
                            )),
                        Positioned(
                            right: 0,
                            left: 0,
                            bottom: 0,
                            child: Center(
                              child: Text(
                                "${widget.categories[index].title}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              )))
    ]);
  }
}
