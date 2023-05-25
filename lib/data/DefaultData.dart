import 'package:flutter/material.dart';
import 'package:invest_app/controllers/Home.dart';
import 'package:invest_app/controllers/HomePage.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/models/BarItem.dart';
import 'package:invest_app/models/BestPlan.dart';
import 'package:invest_app/models/InvestementGuide.dart';

class DefaultData {
  List<BestPlan> allBestPlans() {
    List<BestPlan> bestPlans = [
      BestPlan(
        id: 0,
        title: "Gold",
        discount: 30,
        urlImage: "gold.png",
        planColors: goldListColor,
      ),
      BestPlan(
        id: 1,
        title: "Silver",
        discount: 60,
        urlImage: "silver.png",
        planColors: silverListColor,
      ),
      BestPlan(
        id: 2,
        title: "Platinum",
        discount: 90,
        urlImage: "platinum.png",
        planColors: platinumListColor,
      ),
    ];

    return bestPlans;
  }

  List<BarItem> allBarItems() {
    List<BarItem> barItems = [
      BarItem(
        label: "Home",
        iconData: Icons.home_filled,
        page: HomePage(
          strFullName: "",
        ),
      ),
      BarItem(
        label: "Product",
        iconData: Icons.search_rounded,
        page: Container(),
      ),
      BarItem(
        label: "Transaction",
        iconData: Icons.swap_horizontal_circle_outlined,
        page: Container(),
      ),
      BarItem(
        label: "Account",
        iconData: Icons.person_outline_rounded,
        page: Container(),
      )
    ];
    return barItems;
  }

  List<InvestementGuide> allInvestementGuide() {
    List<InvestementGuide> investementGuides = [
      InvestementGuide(
          id: 0,
          title: "Basic type of investments",
          description:
              "This is how you set your foot for 2020 Stock market recession. What’s next",
          imageUrl: "url1.png"),
      InvestementGuide(
          id: 1,
          title: "How much can you start wittin",
          description:
              "What do you like to see? It’s a very different market from 2018. The way",
          imageUrl: "url2.png"),
    ];

    return investementGuides;
  }
}
