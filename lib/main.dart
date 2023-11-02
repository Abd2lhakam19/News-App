import 'package:flutter/material.dart';
import 'package:news_app/app%20ui/home/home_screen.dart';
import 'package:news_app/app%20ui/screens/news_details_screen.dart';
import 'package:news_app/app%20ui/screens/splahs_screen.dart';
import 'package:news_app/app%20ui/theme/my_theme.dart';

import 'app ui/tabs/category/category_tab_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName : (_)=>SplashScreen(),
        HomeScreen.routeName :(_)=>HomeScreen(),
        NewsDetails.routeName :(_)=>NewsDetails(),
      },
      initialRoute: SplashScreen.routeName ,
      theme: MyTheme.lightTheme,
    );
  }
}
