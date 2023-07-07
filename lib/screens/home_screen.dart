import 'package:flutter/material.dart';

import '../fire_base/store_firebse.dart';
import 'frind_screen.dart';
import 'main_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> l = [MainScreen(), FriendPage(), Profile()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: l[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() {
          currentIndex = value;
        }),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_search), label: 'All User'),
          BottomNavigationBarItem(
              icon: Icon(Icons.recent_actors), label: 'My '),
        ],
      ),
    );
  }
}
