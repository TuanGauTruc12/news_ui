import 'package:flutter/material.dart';
import 'package:news_ui/apis/request_category.dart';
import 'package:news_ui/models/object/category.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();

    RequestCategory.fetchCategory().then((data) {
      setState(() {
        categories = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      SizedBox(
          height: MediaQuery.of(context).size.height,
          child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                categories.length,
                (index) => Center(
                  child: Container(
                      margin: const EdgeInsets.only(
                          left: 8, right: 16, top: 16, bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "${categories[index].title}",
                        style: const TextStyle(
                            backgroundColor: Colors.white, fontSize: 18),
                      )),
                ),
              )))
    ]));
  }
}
