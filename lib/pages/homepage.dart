import 'package:flutter/material.dart';
import 'package:news_ui/apis/request_category.dart';
import 'package:news_ui/apis/request_new.dart';
import 'package:news_ui/models/object/new.dart';
import 'package:news_ui/pages/newpage.dart';
import 'package:news_ui/pages/personpage.dart';
import 'package:news_ui/views/buttomnavigationcustom.dart';
import 'package:news_ui/views/categorylistview.dart';
import 'package:news_ui/views/customappbarhome.dart';
import 'package:news_ui/views/homebody.dart';
import 'package:news_ui/models/object/category.dart' as category;

class HomePage extends StatefulWidget {
  String city = "";
  String temperature = "";

  HomePage({
    super.key,
    required this.city,
    required this.temperature,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<New> list = [];
  List<category.Category> categories = [];

  void requestCategory(String slug) {
    RequestNew.fetchNew(slug).then((news) {
      setState(() {
        list = news;
      });
    });
  }

  List<New> lisTemp = [];

  void searchNew(value) {
    if (value.isNotEmpty) {
      setState(() {
        lisTemp = list.where((e) => e.title!.contains(value)).toList();
      });
    } else {
      setState(() {
        lisTemp = list;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    RequestCategory.fetchCategory().then((value) {
      setState(() {
        categories = value;
        requestCategory(categories[0].slug!);
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      HomeBody(list: lisTemp.isEmpty ? list : lisTemp),
      const NewPage(),
      PersonPage(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped)
    ];

    return widgets[_selectedIndex].runtimeType == PersonPage
        ? widgets[_selectedIndex]
        : Scaffold(
            drawerEnableOpenDragGesture: false,
            appBar: CustomAppBar(
              city: widget.city,
              temperature: widget.temperature,
              searchNews: searchNew,
            ),
            body: widgets.elementAt(_selectedIndex),
            drawer: Drawer(
                child: CategoryListView(
                    categories: categories, requestCategory: requestCategory)),
            bottomNavigationBar: BottomNavigationCustom(
                selectedIndex: _selectedIndex, onItemTapped: _onItemTapped));
  }
}
