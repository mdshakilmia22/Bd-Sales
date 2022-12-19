import 'dart:convert';

import 'package:bd_sales/Model/model_json.dart';
import 'package:firebase_database/firebase_database.dart';

class ProductReop{
  Future <List<ProductModel>> getProduct()async{
    List <ProductModel> productList=[];
    await FirebaseDatabase.instance.ref('Product List').orderByKey().get().then((value){
      for(var elements in value.children){
        productList.add(ProductModel.fromJson(jsonDecode(jsonEncode(elements.value))));
      }
    });
    return productList;
  }
}