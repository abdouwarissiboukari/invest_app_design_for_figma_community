import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/data/DefaultData.dart';
import 'package:invest_app/models/BarItem.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int currentIndex = 0;
  List<BarItem> barItems = DefaultData().allBarItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: barItems[currentIndex].page,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: appBackgroundColor,
        selectedItemColor: appPrimaryColor,
        unselectedItemColor:
            Provider.of<DataProvider>(context, listen: false).appTextColor_dp,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: barItems.map((e) => e.item).toList(),
        onTap: barTapped,
      ),
    );
  }

  barTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
