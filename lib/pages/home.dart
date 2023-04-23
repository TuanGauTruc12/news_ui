import 'package:flutter/material.dart';
import 'package:news_ui/views/CategoryListView.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: const Center(
        child: Text('My Page!'),
      ),
      drawer: const Drawer(child: CategoryListView()),
    );
  }
}
