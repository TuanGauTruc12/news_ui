import 'package:flutter/material.dart';

class BottomNavigationCustom extends StatefulWidget {
  final onItemTapped;
  int selectedIndex;
  BottomNavigationCustom(
      {super.key, required this.onItemTapped, required this.selectedIndex});
  @override
  State<BottomNavigationCustom> createState() => _BottomNavigationCustomState();
}

class _BottomNavigationCustomState extends State<BottomNavigationCustom> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sensors_outlined),
            label: 'Mới nhất',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tôi',
          ),
        ],
        selectedItemColor: Colors.amber[800],
        onTap: widget.onItemTapped,
        currentIndex: widget.selectedIndex);
  }
}
