import 'package:flutter/material.dart';
import 'package:invest_app/data/OsThemeExtension.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:provider/provider.dart';

import 'controllers/MyApp.dart';

bool isDarkMode = false;
bool blOsType = false;
bool blIsConnected = false;
String userFullName = "";

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
