import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app%20logic/api/models/sourceResponse.dart';
import 'package:news_app/app%20ui/models/category_fragments_model.dart';
import 'package:news_app/app%20ui/tabs/category/category_tab.dart';

import '../../../app logic/api/api_manager/api_manager.dart';
import '../../constant_ui/const_colors.dart';

class CategoryTabDetails extends StatelessWidget {
  String title;
  String?search;
  CategoryTabDetails(this.title,this.search);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(title??""),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: ConstColors.primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Something Went Wrong"),
            );
          }
          if (snapshot.data?.status != 'ok') {
            return Center(
              child: Text(snapshot.data?.message ?? ""),
            );
          }
          var soursesList = snapshot.data?.sources ?? [];
          return CategoryTab(soursesList,search);
        });
  }
}
