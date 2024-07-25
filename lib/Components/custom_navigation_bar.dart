import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.white,
      color: Color(0xFFFF9800),
      onTap: onTap,
      height: 57,
      items: <Widget>[
        Icon(Icons.home, size: 25),
        Icon(Icons.history_rounded, size: 25),
        Icon(Icons.list_alt_rounded, size: 25),
        Icon(Icons.manage_accounts_sharp, size: 25),
      ],
      index: currentIndex,
    );
  }
}
