import 'package:flutter/material.dart';
import 'package:news_app/app%20logic/api/api_manager/api_manager.dart';
import 'package:news_app/app%20logic/api/models/sourceResponse.dart';
import 'package:news_app/app%20ui/constant_ui/const_colors.dart';

import 'news_containr.dart';

class NewsTab extends StatelessWidget {
  Sources source;

  NewsTab(this.source);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: ApiManager.getNewsWithId(source.id??""),
        builder: (context, snapshot) {
          if(snapshot.connectionState== ConnectionState.waiting)
            {
              return Center(
                child: CircularProgressIndicator(
                  color: ConstColors.primaryColor,
                ),
              );
            } else if (snapshot.hasError){
            return Center(
              child: Text("SomeThing Went Wrong"),
            );
          }
          if(snapshot.data?.status!='ok')
            {
              return Text(snapshot.data!.message!);
            }
          var newsList = snapshot.data?.articles??[];
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsContainer(newsList[index]);
            },
            itemCount:newsList.length ,);
        },),
    );
  }
}
