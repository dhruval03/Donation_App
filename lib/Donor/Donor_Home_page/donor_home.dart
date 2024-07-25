// import 'package:donation_app/Donor/Donor_Home_page/donor_drawer.dart';
import 'package:donation_app/Main_homepage/Home_Drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:donation_app/Components/custom_app_bar.dart';
import 'package:donation_app/Components/custom_navigation_bar.dart';
import 'dart:async';

class DonorHomePage extends StatefulWidget {
  @override
  _DonorHomePageState createState() => _DonorHomePageState();
}

class _DonorHomePageState extends State<DonorHomePage> {
  int _currentIndex = 0; // Initial index for the Home icon
  DateTime? _lastPressedAt; // Track the last time the back button was pressed

  void _onItemTapped(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
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
  }

  Future<bool> _onWillPop() async {
    if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt!) > Duration(seconds: 2)) {
      // If back button is pressed for the first time or more than 2 seconds have passed
      _lastPressedAt = DateTime.now();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Press back again to exit'),
          duration: Duration(seconds: 2),
        ),
      );
      return false; // Prevent exit
    }
    // Exit the app
    SystemNavigator.pop();
    return true; // This line will not actually be reached
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: CustomAppBar(),
         drawer: DrawerWidget(pageType: 'donorhome'),
        body: Center(
          child: Text('Donor Home Page'),  // Example content
        ),
        bottomNavigationBar: CustomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
