import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/app%20logic/api/models/newsResponse.dart';
import 'package:news_app/app%20ui/constant_ui/const_colors.dart';
import 'package:news_app/app%20ui/screens/news_details_screen.dart';

import '../../../app logic/api/models/sourceResponse.dart';

class NewsContainer extends StatelessWidget {
  News news;

  NewsContainer(this.news);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsDetails.routeName,arguments: news);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? "",
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                color: ConstColors.primaryColor,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            news.author ?? "",
            style:
                GoogleFonts.poppins(fontSize: 10, color: ConstColors.grayColor),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            news.title ?? "",
            style:
                GoogleFonts.poppins(fontSize: 14, color: ConstColors.blueColor),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            news.publishedAt?.substring(0, 10) ?? "",
            style: GoogleFonts.montserrat(
              fontSize: 13,
              color: ConstColors.grayColor,
            ),
            textAlign: TextAlign.end,
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
