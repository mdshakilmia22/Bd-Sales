import 'dart:convert';
import 'package:bd_sales/Model/biscut_model.dart';
import 'package:bd_sales/Model/flash_model.dart';
import 'package:bd_sales/Model/fruits_model.dart';
import 'package:bd_sales/Model/model_json.dart';
import 'package:bd_sales/Model/nudus_model.dart';
import 'package:bd_sales/Model/oil_model.dart';
import 'package:bd_sales/Model/sugar.dart';
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

  Future <List<FlashSales>> getFlash()async{
    List <FlashSales> flashList=[];
    await FirebaseDatabase.instance.ref('Flash List').orderByKey().get().then((value){
      for(var elements in value.children){
        flashList.add(FlashSales.fromJson(jsonDecode(jsonEncode(elements.value))));
      }
    });
    return flashList;
  }

  Future <List<BiscuitsModel>> getBiscuits()async{
    List <BiscuitsModel> biscuitsList=[];
    await FirebaseDatabase.instance.ref('Biscuits List').orderByKey().get().then((value){
      for(var elements in value.children){
        biscuitsList.add(BiscuitsModel.fromJson(jsonDecode(jsonEncode(elements.value))));
      }
    });
    return biscuitsList;
  }


  Future <List<FruitsModel>> getFruits()async{
    List <FruitsModel> fruitsList=[];
    await FirebaseDatabase.instance.ref('Fruits List').orderByKey().get().then((value){
      for(var elements in value.children){
        fruitsList.add(FruitsModel.fromJson(jsonDecode(jsonEncode(elements.value))));
      }
    });
    return fruitsList;
  }

  Future <List<OilModel>> getOil()async{
    List <OilModel> oil=[];
    await FirebaseDatabase.instance.ref('Oil List').orderByKey().get().then((value){
      for(var elements in value.children){
        oil.add(OilModel.fromJson(jsonDecode(jsonEncode(elements.value))));
      }
    });
    return oil;
  }

  Future <List<SugarModel>> getSugar()async{
    List <SugarModel> sugar=[];
    await FirebaseDatabase.instance.ref('Sugar List').orderByKey().get().then((value){
      for(var elements in value.children){
        sugar.add(SugarModel.fromJson(jsonDecode(jsonEncode(elements.value))));
      }
    });
    return sugar;
  }

  Future <List<NudusModel>> getNoodles()async{
    List <NudusModel> noodles=[];
    await FirebaseDatabase.instance.ref('Noodles List').orderByKey().get().then((value){
      for(var elements in value.children){
        noodles.add(NudusModel.fromJson(jsonDecode(jsonEncode(elements.value))));
      }
    });
    return noodles;
  }

}