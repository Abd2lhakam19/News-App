import 'dart:ui';

class CategoryFragModel{
   String id ;
   String title;
   String imgUrl;
   Color color;

   CategoryFragModel(this.id, this.title, this.imgUrl, this.color);

   /*
   business entertainment general
   health science sports  technology
    */
   static List<CategoryFragModel>getCategoryModel(){
      return [
         CategoryFragModel('sports', 'Sports', "assets/images/ball.png", Color(0xffC91C22)),
         CategoryFragModel('general', 'General', "assets/images/politics.png", Color(0xff003E90)),
         CategoryFragModel('health', 'Health', "assets/images/health.png", Color(0xffED1E79)),
         CategoryFragModel('business', 'Business', "assets/images/business.png", Color(0xffCF7E48)),
         CategoryFragModel('entertainment', 'Entertainment', "assets/images/entertainment.png", Color(0xff4882CF)),
         CategoryFragModel('science', 'Science', "assets/images/science.png", Color(0xffF2D352)),
      ];
   }

}