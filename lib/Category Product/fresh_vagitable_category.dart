import 'package:bd_sales/Model/model_json.dart';
import 'package:bd_sales/Provider/product_provider.dart';
import 'package:bd_sales/product_details/vagitable_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
class VagitableCategory extends StatefulWidget {
  const VagitableCategory({Key? key}) : super(key: key);

  @override
  State<VagitableCategory> createState() => _VagitableCategoryState();
}

class _VagitableCategoryState extends State<VagitableCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_ios,size: 28,color: Colors.black,).onTap(()=>Navigator.pop(context)),
        title: Text('Fresh Vagitables',style: TextStyle(color: Colors.black),),
      ),
      body: Consumer(
          builder: (_,ref,watch){
            AsyncValue<List<ProductModel>> flash= ref.watch(productProvider);
            return flash.when(
                data: (detail){
                  return  GridView.builder(
                      itemCount: detail.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.6,

                      ),
                      itemBuilder: (_,index){
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(detail[index].pictureUrl.toString(),height: 100,width: 100,),
                              Text(detail[index].price),
                              SizedBox(height: 5,),
                              SizedBox(
                                  width: 80,
                                  child: Text(detail[index].title.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                              SizedBox(height: 5,),
                              Text(detail[index].weight, style: TextStyle(fontSize: 10),),
                            ],
                          ),
                        ).onTap(()=>VagitableDetails(vagitableinformation: detail[index]).launch(context));
                      });
                },
                error: (e,stack){
                  return Text(e.toString());
                },
                loading: (){
                  return Center(child: CircularProgressIndicator(),);
                });
          }),
    );
  }
}
