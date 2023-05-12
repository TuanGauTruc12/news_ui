import 'package:flutter/material.dart';
import 'package:news_ui/apis/request_new.dart';
import 'package:news_ui/models/object/new.dart';
import 'package:news_ui/views/homebody.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  List<New> news = [];
  @override
  void initState() {
    super.initState();
    RequestNew.fetchNew().then((news) {
      setState(() {
        this.news = news;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomeBody(list: news);
  }
}
