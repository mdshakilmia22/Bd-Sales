
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import '../Provider/product_provider.dart';
import '../model_json.dart';
class VagitablePage extends StatefulWidget {
  const VagitablePage({Key? key}) : super(key: key);

  @override
  State<VagitablePage> createState() => _VagitablePageState();
}

class _VagitablePageState extends State<VagitablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fresh Vagitables',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_ios,size: 30,color: Colors.black,).onTap(()=>Navigator.pop(context)),
      ),
      body: Column(
        children: [
          Consumer(
              builder: (_,ref,watch){
                AsyncValue<List<ProductModel>> product= ref.watch(productProvider);
                return product.when(
                    data: (details){
                    return GridView.builder(
                         shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: details.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                          itemBuilder: (_,index){
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.red[200],
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(details[index].pictureUrl.toString(),height: 100,width: 100,),
                                  Text(details[index].price),
                                  SizedBox(height: 5,),
                                  Text(details[index].title.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                  SizedBox(height: 5,),
                                  Text(details[index].weight, style: TextStyle(fontSize: 10),)
                                ],
                              ),
                            );
                          });
                    },
                    error: (e,stack){
                      return Text(e.toString());
                    },
                    loading: (){
                      return Center(child: CircularProgressIndicator(),);
                    });
              })
        ],
      ),
    );
  }
}
