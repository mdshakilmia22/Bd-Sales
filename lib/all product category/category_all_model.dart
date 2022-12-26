import 'package:bd_sales/Category%20Product/biscuits_category_list.dart';
import 'package:bd_sales/Category%20Product/flash_category_list.dart';
import 'package:bd_sales/Category%20Product/fresh_vagitable_category.dart';
import 'package:bd_sales/Category%20Product/fruits_category_list.dart';
import 'package:bd_sales/Category%20Product/nudus_category_list.dart';
import 'package:bd_sales/Category%20Product/oil_Category_List.dart';
import 'package:bd_sales/Category%20Product/sugar_category_list.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
class CategoryAllList extends StatefulWidget {
  const CategoryAllList({Key? key}) : super(key: key);
  @override
  State<CategoryAllList> createState() => _CategoryAllListState();
}

class _CategoryAllListState extends State<CategoryAllList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/2.3,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('http://cdn.shopify.com/s/files/1/0246/3200/0546/products/RNLQ2_jpg_1200x1200.png?v=1606806312'),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 130,left: 10),
                    child: Text('Flash Sales',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                  ),
                ),

              ],
            ).onTap(()=>FlashCategoryList().launch(context)),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/2.3,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg'),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 130,left: 10),
                    child: Text('Vagitable',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                  ),
                ),

              ],
            ).onTap(()=>VagitableCategory().launch(context)),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/2.3,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/assortment-of-colorful-ripe-tropical-fruits-top-royalty-free-image-995518546-1564092355.jpg'),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 130,left: 10),
                    child: Text('Fresh Fruits',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                  ),
                ),

              ],
            ).onTap(()=>FruitsCategoryList().launch(context)),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/2.3,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://media.istockphoto.com/id/1206682746/photo/pouring-extra-virgin-olive-oil-in-a-glass-bowl.jpg?s=612x612&w=0&k=20&c=0b9ppVJN0BNyzpLodnhPV8MzNTGY7-9-kteOUIBPxq8='),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 130,left: 10),
                    child: Text('Oil',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                  ),
                ),

              ],
            ).onTap(()=>OilCategoryList().launch(context)),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/2.3,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://img.freepik.com/free-photo/schezwan-noodles-szechwan-vegetable-hakka-noodles-chow-mein-is-popular-indo-chinese-recipes-served-bowl-plate-with-wooden-chopsticks_466689-74636.jpg?w=2000'),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 130,left: 10),
                    child: Text('Noodles',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                  ),
                ),

              ],
            ).onTap(()=>NudusCategoryList().launch(context)),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/2.3,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/7/7f/Biscuits_in_Ghana.jpg'),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 130,left: 10),
                    child: Text('Biscuits',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                  ),
                ),

              ],
            ).onTap(()=>BiscutCategoryList().launch(context)),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/2.3,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://cdn-prod.medicalnewstoday.com/content/images/articles/286/286795/sugar-in-sugar-bowls.jpg'),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 130,left: 10),
                    child: Text('Sugar & Salt',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                  ),
                ),

              ],
            ).onTap(()=>SugarCategoryList().launch(context)),
          ],
      ),
    );
  }
}
