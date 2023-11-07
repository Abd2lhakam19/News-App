import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app%20logic/api/models/sourceResponse.dart';
import 'package:news_app/app%20ui/models/category_fragments_model.dart';
import 'package:news_app/app%20ui/tabs/category/category_tab.dart';
import 'package:news_app/app%20ui/tabs/category/category_tab_view_model.dart';

import '../../../app logic/api/api_manager/api_manager.dart';
import '../../constant_ui/const_colors.dart';

class CategoryTabDetails extends StatefulWidget {
  String title;
  String? search;

  CategoryTabDetails(this.title, this.search);

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
    return BlocBuilder<CategoryTabViewModel, CategoryState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            {
              return Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(
                      color: ConstColors.primaryColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(state.message ?? "")
                  ],
                ),
              );
            }
          case SuccessState():
            {
              var soursesList = state.sourcesList;
              return CategoryTab(soursesList, widget.search);
            }
          case ErrorState():
            {
              return Center(
                child: Column(
                  children: [
                    Text(state.message??""),
                    ElevatedButton(
                        onPressed: (){
                          viewModel.getSources(widget.title);
                        },
                        child: Text("Try Again"))
                  ],
                ),
              );
            }
        }
      },
    );
    // return FutureBuilder(
    //     future: ApiManager.getSources(title??""),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: ConstColors.primaryColor,
    //           ),
    //         );
    //       } else if (snapshot.hasError) {
    //         return Center(
    //           child: Text("Something Went Wrong"),
    //         );
    //       }
    //       if (snapshot.data?.status != 'ok') {
    //         return Center(
    //           child: Text(snapshot.data?.message ?? ""),
    //         );
    //       }
    //       var soursesList = snapshot.data?.sources ?? [];
    //       return CategoryTab(soursesList,search);
    //     });
  }
}
