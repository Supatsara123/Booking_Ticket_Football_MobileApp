import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../tabs/cart_tab.dart';
import '../widget/buttom_tabs.dart';
import '../tabs/home_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  PageController _pageController = PageController();
  int _selectedTab = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF345487),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int num) {
                setState(() {
                  _selectedTab = num;
                });
              },
              children: [
                HomeTab(),
                CartTab(),
              ],
            ),
          ),

          // Exit button
          BottomTabs(
            selectedTab: _selectedTab,
            tabPressed: (int num) {
              _pageController.animateToPage(num,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOutCubic);
            },
          )
        ],
      ),
    );
  }
}