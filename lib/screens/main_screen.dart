import 'package:flutter/material.dart';

import '../fire_base/store_firebse.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isLoading = false;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    setState(() {
      isLoading = true;
    });
    StoreFireBase().getAllUsers();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 0,
      itemBuilder: (context, index) {},
    );
  }
}
