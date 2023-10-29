import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/app%20ui/constant_ui/const_colors.dart';
import 'package:news_app/app%20ui/models/category_fragments_model.dart';
import 'package:news_app/app%20ui/tabs/category/category_item.dart';

class CategoryFragments extends StatelessWidget {
  Function onItemClick;

  CategoryFragments(this.onItemClick);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 12,
        ),
        Text(
          "Pick your category \nof interest",
          style:
              GoogleFonts.poppins(fontSize: 22, color: ConstColors.blueColor),
        ),
        SizedBox(
          height: 25,
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 25, crossAxisCount: 2, mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    onItemClick(CategoryFragModel.getCategoryModel()[index]);
                  },
                  child: CategoryItem(
                      CategoryFragModel.getCategoryModel()[index], index));
            },
            itemCount: CategoryFragModel.getCategoryModel().length,
          ),
        )
      ],
    );
  }
}
