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
  bool selected = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: selected
          ? AppBar(
              title: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ConstColors.secondryColor),
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          selected = false;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.clear,
                        ),
                      ),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      suffixIconColor: ConstColors.primaryColor,
                      prefixIconColor: ConstColors.primaryColor,
                      hintStyle: TextStyle(color: ConstColors.primaryColor),
                    ),
                  ),
                ),
              ),
            )
          : AppBar(
              title: Text(selectedDrawer == 1
                  ? selectedCat == null
                      ? " News App "
                      : selectedCat.title
                  : "Settings"),
              actions: [
                IconButton(
                    onPressed: () {
                      selected = true;
                      setState(() {});
                    },
                    icon: Icon(Icons.search))
              ],
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
                    : CategoryTabDetails(
                        selectedCat.title, searchController.text)
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
