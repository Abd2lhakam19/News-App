import 'package:flutter/material.dart';
import 'package:news_app/app%20ui/items/category_item.dart';
import 'package:news_app/app%20ui/tabs/news/news_tab.dart';

import '../../../app logic/api/models/sourceResponse.dart';

class CategoryTab extends StatefulWidget {
  List<Sources> soursesList;
  String?search;
  CategoryTab(this.soursesList,this.search);

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.soursesList.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            isScrollable: true,
            indicatorColor: Colors.transparent,
            tabs: widget.soursesList
                .map((source) => CategoryItem(
                      selected:
                          selectedIndex == widget.soursesList.indexOf(source),
                      source: source,
                    ))
                .toList(),
          ),
          SizedBox(height: 7,),
          Expanded(child: NewsTab(widget.soursesList[selectedIndex],widget.search))
        ],
      ),
    );
  }
}
