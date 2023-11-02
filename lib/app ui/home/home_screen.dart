import 'package:flutter/material.dart';
import 'package:news_app/app%20logic/api/api_manager/api_manager.dart';
import 'package:news_app/app%20ui/constant_ui/const_colors.dart';
import 'package:news_app/app%20ui/items/category_item.dart';
import 'package:news_app/app%20ui/models/category_fragments_model.dart';
import 'package:news_app/app%20ui/theme/my_theme.dart';

import '../tabs/category/category_fragments.dart';
import '../tabs/category/category_tab_details.dart';
import '../tabs/settings/settings_tab.dart';
import 'home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedDrawer == 1
            ? selectedCat == null
                ? " News App "
                : selectedCat.title
            : "Settings"),
      ),
      drawer: Drawer(
        child: HomeDrawer(onDrawerClick),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/pattern.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: selectedDrawer == 1
                ? selectedCat == null
                    ? CategoryFragments(onItemClick)
                    : CategoryTabDetails(selectedCat.title)
                : SettingsTab(),
          ),
        ],
      ),
    );
  }

  var selectedCat = null;
  var selectedDrawer = 1;

  onItemClick(CategoryFragModel newItem) {
    selectedCat = newItem;
    setState(() {});
  }

  onDrawerClick(int id) {
    selectedDrawer = id;
    selectedCat = null;
    Navigator.pop(context);
    setState(() {});
  }
}
