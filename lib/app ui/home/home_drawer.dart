import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/app%20ui/constant_ui/const_colors.dart';

class HomeDrawer extends StatelessWidget {
  @override
  static const int categoryClick = 1;
  static const int settingsClick = 2;
  Function onDrawerClick;

  HomeDrawer(this.onDrawerClick);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.06,
            ),
            width: double.infinity,
            color: ConstColors.primaryColor,
            child: Text(
              "News App!",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: ConstColors.secondryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                onDrawerClick(categoryClick);
              },
              child: Row(
                children: [
                  Icon(Icons.list),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "Categories",
                    style: GoogleFonts.poppins(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                onDrawerClick(settingsClick);
              },
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "Settings",
                    style: GoogleFonts.poppins(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
