import 'dart:io';

import 'package:flutter/material.dart';
import 'package:invest_app/models/Account.dart';
import 'package:invest_app/models/User.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:provider/provider.dart';

import 'controllers/MyApp.dart';

bool isDarkMode = false;
bool blOsType = (Platform.isIOS ? true : false);
bool blIsConnected = false;
Size deviceSize = const Size(0, 0);
late User userConnected;
late Account defaultAccount;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DataProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
