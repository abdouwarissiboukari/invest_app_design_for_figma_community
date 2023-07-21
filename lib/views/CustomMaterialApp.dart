import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invest_app/controllers/Home.dart';
import 'package:invest_app/controllers/SplashScreen.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/main.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:provider/provider.dart';

class CustomMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (blOsType) ? iOSMaterialApp() : androidMaterialApp(context);
  }

  CupertinoApp iOSMaterialApp() {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        primaryColor: appPrimaryColor,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('fr', ''),
        Locale('en', ''),
      ],
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
      },
      onGenerateRoute: (settings) {
        final routeName = settings.name;
        switch (routeName) {
          case 'HomeRoute':
            return MaterialPageRoute(
              builder: (BuildContext ctx) => Home(),
              settings: settings,
            );
          default:
        }
      },
    );
  }

  MaterialApp androidMaterialApp(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: appPrimaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: context.watch<DataProvider>().appBackgroundColor_dp,
          centerTitle: true,
          titleTextStyle: GoogleFonts.signika(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      darkTheme: ThemeData.dark(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('fr', ''),
        Locale('en', ''),
      ],
      // home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
      },
      onGenerateRoute: (settings) {
        final routeName = settings.name;
        switch (routeName) {
          case 'HomeRoute':
            return MaterialPageRoute(
              builder: (BuildContext ctx) => Home(),
              settings: settings,
            );
          default:
        }
      },
    );
  }
}
