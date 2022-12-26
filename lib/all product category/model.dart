import 'package:flutter/cupertino.dart';

class CategoryModel{
  String? image;
  String ? title;
  CategoryModel({this.image, this.title});
}
List<CategoryModel> category=[
  CategoryModel(
    image: 'http://cdn.shopify.com/s/files/1/0246/3200/0546/products/RNLQ2_jpg_1200x1200.png?v=1606806312',
    title: 'Flash Sales',
  ),
  CategoryModel(
    image: 'https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg',
    title: 'Vagitables',
  ),
  CategoryModel(
    image: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/assortment-of-colorful-ripe-tropical-fruits-top-royalty-free-image-995518546-1564092355.jpg',
    title: 'Fruits',
  ),
  CategoryModel(
    image: 'https://media.istockphoto.com/id/1206682746/photo/pouring-extra-virgin-olive-oil-in-a-glass-bowl.jpg?s=612x612&w=0&k=20&c=0b9ppVJN0BNyzpLodnhPV8MzNTGY7-9-kteOUIBPxq8=',
    title: 'Oil',
  ),
  CategoryModel(
    image: 'https://img.freepik.com/free-photo/schezwan-noodles-szechwan-vegetable-hakka-noodles-chow-mein-is-popular-indo-chinese-recipes-served-bowl-plate-with-wooden-chopsticks_466689-74636.jpg?w=2000',
    title: 'Noodles',
  ),
  CategoryModel(
    image: 'https://upload.wikimedia.org/wikipedia/commons/7/7f/Biscuits_in_Ghana.jpg',
    title: 'Biscuits',
  ),
  CategoryModel(
    image: 'https://cdn-prod.medicalnewstoday.com/content/images/articles/286/286795/sugar-in-sugar-bowls.jpg',
    title: 'Sugar and Salt',
  ),
];