import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/app%20ui/constant_ui/const_colors.dart';

import 'bottom_sheet_components.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Language",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: ConstColors.drawerColor,
          ),
        ),
        InkWell(
          onTap: () {
            showBottomSheet();
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            height: MediaQuery.of(context).size.height * 0.07,
            width: double.infinity,
            decoration: BoxDecoration(border: Border.all(
              color: ConstColors.primaryColor
            )),
            child: Text(
              "English",
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: ConstColors.primaryColor
              ),
            ),
          ),
        )
      ],
    );
  }

  showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ShowBottomSheet();
      },
    );
  }
}
