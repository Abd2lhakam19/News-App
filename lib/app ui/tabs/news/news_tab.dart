import 'package:flutter/material.dart';
import 'package:news_app/app%20logic/api/api_manager/api_manager.dart';
import 'package:news_app/app%20logic/api/models/sourceResponse.dart';
import 'package:news_app/app%20ui/constant_ui/const_colors.dart';
import 'package:news_app/app%20ui/tabs/news/news_tab_view_model.dart';
import 'package:provider/provider.dart';

import 'news_containr.dart';

class NewsTab extends StatefulWidget {
  Sources source;
  String?search;
  NewsTab(this.source,this.search);

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  var viewModel = NewsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNews(widget.source.id??"");
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (context, viewModel, child) {
          if(viewModel.loading=='true')
          {
            return Center(
              child: CircularProgressIndicator(
                color: ConstColors.primaryColor,
              ),
            );
          } else if (viewModel.errorMessage!=null){
            return Center(
              child: Column(
                children: [
                  Text(viewModel.errorMessage ?? ""),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getNews(widget.source.id??"");
                      },
                      child: Text("Try Again"))
                ],
              ),
            );
          }
          var newsList = viewModel.newsList??[];
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsContainer(newsList[index]);
            },
            itemCount:newsList.length ,);
        },

      ) ,
    );
  }
}
