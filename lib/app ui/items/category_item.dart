import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/app%20ui/constant_ui/const_colors.dart';

import '../../app logic/api/models/sourceResponse.dart';

class CategoryItem extends StatelessWidget {
  bool selected;
  Sources source;

  CategoryItem({ required this.selected,required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
        color: selected ? ConstColors.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected ? Colors.transparent : ConstColors.primaryColor,
          width: 3,
        ),
      ),
      child: Text(
        source.name ?? "",
        style: GoogleFonts.exo(
            color: selected ? Colors.white : ConstColors.primaryColor),
      ),
    );
  }
}
