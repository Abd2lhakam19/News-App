import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app%20logic/api/models/sourceResponse.dart';
import 'package:news_app/app%20ui/models/category_fragments_model.dart';
import 'package:news_app/app%20ui/tabs/category/category_tab.dart';
import 'package:news_app/app%20ui/tabs/category/category_tab_details_view_model.dart';
import 'package:provider/provider.dart';

import '../../../app logic/api/api_manager/api_manager.dart';
import '../../constant_ui/const_colors.dart';

class CategoryTabDetails extends StatefulWidget {
  String title;
  String?search;
  CategoryTabDetails(this.title,this.search);

  @override
  State<CategoryTabDetails> createState() => _CategoryTabDetailsState();
}

class _CategoryTabDetailsState extends State<CategoryTabDetails> {
  var viewModel = CategoryTabViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.title);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryTabViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.loading == true) {
            return Center(
              child: CircularProgressIndicator(
                color: ConstColors.primaryColor,
              ),
            );
          } else if (viewModel.errorMessage != null) {
            return Center(
              child: Column(
                children: [
                  Text(viewModel.errorMessage ?? ""),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getSources(widget.title??"");
                      },
                      child: Text("Try Again"))
                ],
              ),
            );
          }
          var sourcesList = viewModel.sources??[];
          return CategoryTab(sourcesList,widget.search);
        },
      ),
    );
  }
}
