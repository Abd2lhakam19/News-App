import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/app%20ui/constant_ui/const_colors.dart';
import 'package:news_app/app%20ui/models/category_fragments_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryFragModel categoryModel;
  int index;
  CategoryItem(this.categoryModel,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(index%2!=0?24:0),
          bottomRight: Radius.circular(index%2!=0?0:24),

        )
      ),
      child: Column(
        children: [
          Image.asset(categoryModel.imgUrl,height: MediaQuery.of(context).size.height*0.15,),
          Text(categoryModel.title,style: GoogleFonts.exo(
            fontSize: 22,
            color: ConstColors.secondryColor
          ),)
        ],
      ),
    );
  }
}
