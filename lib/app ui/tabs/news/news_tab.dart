import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app%20logic/api/api_manager/api_manager.dart';
import 'package:news_app/app%20logic/api/models/sourceResponse.dart';
import 'package:news_app/app%20ui/constant_ui/const_colors.dart';
import 'package:news_app/app%20ui/tabs/news/news_tab_view_model.dart';

import 'news_containr.dart';

class NewsTab extends StatefulWidget {
  Sources source;
  String? search;

  NewsTab(this.source, this.search);

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  var viewModel = NewsTabViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNews(widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsTabViewModel, NewsState>(
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
              var newsList = state.newsList;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsContainer(newsList[index]);
                },
                itemCount: newsList.length,
              );
            }
          case ErrorState():
            {
              return Center(
                child: Column(
                  children: [
                    Text(state.message ?? ""),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.getNews(widget.source.id ?? "");
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
    //   future: ApiManager.getNewsWithId(source.id??"",search: search),
    //   builder: (context, snapshot) {
    //     if(snapshot.connectionState== ConnectionState.waiting)
    //       {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: ConstColors.primaryColor,
    //           ),
    //         );
    //       } else if (snapshot.hasError){
    //       return Center(
    //         child: Text("SomeThing Went Wrong"),
    //       );
    //     }
    //     if(snapshot.data?.status!='ok')
    //       {
    //         return Text(snapshot.data!.message!);
    //       }
    //     var newsList = snapshot.data?.articles??[];
    //     return ListView.builder(
    //       itemBuilder: (context, index) {
    //         return NewsContainer(newsList[index]);
    //       },
    //       itemCount:newsList.length ,);
    //   },);
  }
}
