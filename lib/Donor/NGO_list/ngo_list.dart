import 'package:flutter/material.dart';
import 'package:donation_app/Components/custom_navigation_bar.dart';

class NGOListPage extends StatefulWidget {
  @override
  _NGOListPageState createState() => _NGOListPageState();
}

class _NGOListPageState extends State<NGOListPage> {
  int _currentIndex = 2;

  void _onItemTapped(int index) {
    if (index == _currentIndex) return;
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/donor_home');
        break;
      case 1:
        Navigator.pushNamed(context, '/history');
        break;
      case 2:
        Navigator.pushNamed(context, '/NGO_list');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
      default:
        Navigator.pushNamed(context, '/donor_home');
        break;
    }
  }

  Future<bool> _onWillPop() async {
    if (_currentIndex != 0) {
      Navigator.pushNamed(context, '/donor_home');
      return false; // Prevent default back navigation
    }
    return true; // Allow default back navigation
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('NGO List'),
        ),
        body: Center(
          child: Text(
            'NGO List Page',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        bottomNavigationBar: CustomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
