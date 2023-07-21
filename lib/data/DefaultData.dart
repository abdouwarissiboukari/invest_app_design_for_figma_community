import 'package:flutter/material.dart';
import 'package:invest_app/controllers/HomePage.dart';
import 'package:invest_app/controllers/MyAsset.dart';
import 'package:invest_app/controllers/ProfilPage.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/data/SvgData.dart';
import 'package:invest_app/models/BankAccount.dart';
import 'package:invest_app/models/BarItem.dart';
import 'package:invest_app/models/BestPlan.dart';
import 'package:invest_app/models/InvestementGuide.dart';
import 'package:invest_app/models/NotificationItem.dart';
import 'package:invest_app/models/Transaction.dart';

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
      BestPlan(
        id: 3,
        title: "Ultra",
        discount: 99,
        urlImage: "ultra.png",
        planColors: ultraListColor,
      ),
    ];

    return bestPlans;
  }

  List<BarItem> allBarItems() {
    List<BarItem> barItems = [
      BarItem(
        label: "Home",
        iconData: homeSvg,
        page: HomePage(
          strFullName: "",
        ),
      ),
      BarItem(
        label: "Product",
        iconData: searchSvg,
        page: Container(),
      ),
      BarItem(
        label: "Transaction",
        iconData: transactionSvg,
        page: MyAsset(
          bestPlan: DefaultData().allBestPlans()[0],
          fromPage: 1,
        ),
      ),
      BarItem(
        label: "Account",
        iconData: profilSvg,
        page: ProfilPage(),
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

  List<Transaction> allTransactions() {
    return [
      Transaction(
        id: 1,
        amount: 200000,
        description: 'Buy "APPL" Stock',
        date: DateTime(2020, 6, 22, 17, 30),
        isBuyOrSell: true,
      ),
      Transaction(
        id: 2,
        amount: 150000,
        description: 'Sell "TLKM" Stock',
        date: DateTime(2020, 6, 22, 17, 30),
        isBuyOrSell: false,
      ),
      Transaction(
        id: 3,
        amount: 1000240,
        description: 'Buy "FB" Stock',
        date: DateTime(2020, 6, 22, 17, 30),
        isBuyOrSell: true,
      ),
      Transaction(
        id: 4,
        amount: 1000240,
        description: 'Sell "APPL" Stock',
        date: DateTime(2020, 6, 22, 17, 30),
        isBuyOrSell: false,
      )
    ];
  }

  List<NotificationItem> allNotification() {
    return [
      NotificationItem(
        id: 1,
        description: "Apple stocks just increased Check it out now.",
        timeAgo: "15min ago",
        imageUrl: "notif1.png",
      ),
      NotificationItem(
        id: 2,
        description: "Check out today’s best investor. You’ll learn from him",
        timeAgo: "3min ago",
        imageUrl: "notif2.png",
      ),
      NotificationItem(
        id: 3,
        description: "Where do you see yourself in the next ages.",
        timeAgo: "30secs ago",
        imageUrl: "notif3.png",
      )
    ];
  }

  List<BankAccount> allBankAccount() {
    return [
      BankAccount(
        id: 0,
        name: "Bank of America",
        accountNumber: "0182128004",
        owner: "Warren Buffet",
        imageUrl: "bank1.png",
      ),
      BankAccount(
        id: 1,
        name: "Zenith Bank",
        accountNumber: "0182239002",
        owner: "Warren Buffet",
        imageUrl: "bank2.png",
      ),
    ];
  }
}
