import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/app%20logic/api/models/newsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant_ui/const_colors.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as News ;
    return Scaffold(
      appBar: AppBar(
        title: Text("News Title"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: args.urlToImage ?? "",
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
              args.author ?? "",
              style:
              GoogleFonts.poppins(fontSize: 10, color: ConstColors.grayColor),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              args.title ?? "",
              style:
              GoogleFonts.poppins(fontSize: 16, color: ConstColors.blueColor),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              args.publishedAt?.substring(0, 10) ?? "",
              style: GoogleFonts.montserrat(
                fontSize: 13,
                color: ConstColors.grayColor,
              ),
              textAlign: TextAlign.end,
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              args.description ?? "",
              textAlign: TextAlign.start,
              style:
              GoogleFonts.poppins(fontSize: 14, color: ConstColors.blueColor),
            ),
            SizedBox(
              height: 14,
            ),

            InkWell(
              onTap: (){
                Uri url = Uri.parse(args.url??"");
                launchUrl(url);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "View Full Article",
                    textAlign: TextAlign.end,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: ConstColors.blueColor
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.arrow_forward,size: 18,color: ConstColors.blueColor,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
