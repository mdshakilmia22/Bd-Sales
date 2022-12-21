import 'package:bd_sales/Category%20Product/biscuits_category_list.dart';
import 'package:bd_sales/Category%20Product/flash_category_list.dart';
import 'package:bd_sales/Category%20Product/fresh_vagitable_category.dart';
import 'package:bd_sales/Category%20Product/fruits_category_list.dart';
import 'package:bd_sales/Category%20Product/nudus_category_list.dart';
import 'package:bd_sales/Category%20Product/oil_Category_List.dart';
import 'package:bd_sales/Category%20Product/sugar_category_list.dart';
import 'package:bd_sales/Model/biscut_model.dart';
import 'package:bd_sales/Model/colors_model.dart';
import 'package:bd_sales/Model/flash_model.dart';
import 'package:bd_sales/Model/fruits_model.dart';
import 'package:bd_sales/Model/model_json.dart';
import 'package:bd_sales/Model/nudus_model.dart';
import 'package:bd_sales/Model/oil_model.dart';
import 'package:bd_sales/Model/sugar.dart';
import 'package:bd_sales/Product%20List/admin_page.dart';
import 'package:bd_sales/Product%20List/biscut_fileld.dart';
import 'package:bd_sales/Product%20List/fruits_page.dart';
import 'package:bd_sales/Product%20List/nudus_model.dart';
import 'package:bd_sales/Product%20List/oil_page.dart';
import 'package:bd_sales/Product%20List/sugar_page.dart';
import 'package:bd_sales/screen/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Product List/flash_sale.dart';
import '../Provider/product_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List <String> nameList=[
    'Vegitable',
    'Biscuit',
    'Oil',
    'Fruits',
    'Flash',
    'Noodles',
    'Sugar & Salt',
  ];

  var colur=[
    Colors.orange[500],
    Colors.red[600],
    Colors.lime[600],
    Colors.cyan[200],
    Colors.purple[300],
    Colors.orange[200],
    Colors.red[100],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // drawer:  Padding(
      //   padding: const EdgeInsets.all(15.0),
      //   child: Drawer(
      //     width: 1
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: AppColor.mainColor,
          size: 30,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/br.png',
              height: 50,
              width: 50,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'BD',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'Lobster',
                  letterSpacing: 1.2),
            ),
            Text(
              'SALES',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'Lobster',
                  letterSpacing: 1.2),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.account_circle,
              color: AppColor.mainColor,
              size: 32,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlideshow(
                height: 220,
                width: double.infinity,
                autoPlayInterval: 3000,
                isLoop: true,
                indicatorBackgroundColor: Colors.black,
                indicatorColor: Colors.pink,
                onPageChanged: (value){
                  debugPrint('Page Changed: $value');
                },
                children: [
                  Image.asset('images/br.png',fit: BoxFit.cover,)

                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Flash Sales',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Text('View more',style: TextStyle(color: Colors.blue[600],fontSize: 15),),
                            Icon(Icons.arrow_forward_ios,color: Colors.blue[600],size: 15,),
                          ],
                        ).onTap(()=>FlashCategoryList().launch(context)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Consumer(
                        builder: (_,ref,watch){
                          AsyncValue<List<FlashSales>> product= ref.watch(flashProvider);
                          return product.when(
                              data: (details){
                                return SizedBox(
                                  child: HorizontalList(
                                      spacing: 15,
                                      itemCount: details.length,
                                      itemBuilder: (_,index){
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.network(details[index].pictureUrl.toString(),height: 100,width: 100,),
                                            Text(details[index].price),
                                            SizedBox(height: 5,),
                                            SizedBox(
                                                width: 80,
                                                child: Text(details[index].title.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                                            SizedBox(height: 5,),
                                            Text(details[index].weight, style: TextStyle(fontSize: 10),)
                                          ],
                                        );
                                      }),
                                );
                              },
                              error: (e,stack){
                                return Text(e.toString());
                              },
                              loading: (){
                                return Center(child: CircleAvatar(),);
                              });
                        })
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Fresh Vegitables',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Text('View more',style: TextStyle(color: Colors.blue[600],fontSize: 15),),
                            Icon(Icons.arrow_forward_ios,color: Colors.blue[600],size: 15,)
                          ],
                        ).onTap(()=>VagitableCategory().launch(context))
                      ],
                    ),
                    SizedBox(height: 10,),
                    Consumer(
                        builder: (_,ref,watch){
                          AsyncValue<List<ProductModel>> product= ref.watch(productProvider);
                          return product.when(
                              data: (details){
                                return SizedBox(
                                  child: HorizontalList(
                                      spacing: 15,
                                      itemCount: details.length,
                                      itemBuilder: (_,index){
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.network(details[index].pictureUrl.toString(),height: 100,width: 100,),
                                            Text(details[index].price),
                                            SizedBox(height: 5,),
                                            SizedBox(
                                                width: 80,
                                                child: Text(details[index].title.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                                            SizedBox(height: 5,),
                                            Text(details[index].weight, style: TextStyle(fontSize: 10),)
                                          ],
                                        );
                                      }),
                                );
                              },
                              error: (e,stack){
                                return Text(e.toString());
                              },
                              loading: (){
                                return Center(child: CircleAvatar(),);
                              });
                        })
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Fresh Fruits',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Text('View more',style: TextStyle(color: Colors.blue[600],fontSize: 15),),
                            Icon(Icons.arrow_forward_ios,color: Colors.blue[600],size: 15,)
                          ],
                        ).onTap(()=>FruitsCategoryList().launch(context))
                      ],
                    ),
                    SizedBox(height: 10,),
                    Consumer(
                        builder: (_,ref,watch){
                          AsyncValue<List<FruitsModel>> product= ref.watch(fruitsProvider);
                          return product.when(
                              data: (details){
                                return SizedBox(
                                  child: HorizontalList(
                                      spacing: 15,
                                      itemCount: details.length,
                                      itemBuilder: (_,index){
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.network(details[index].pictureUrl.toString(),height: 100,width: 100,),
                                            Text(details[index].price),
                                            SizedBox(height: 5,),
                                            SizedBox(
                                                width: 80,
                                                child: Text(details[index].title.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                                            SizedBox(height: 5,),
                                            Text(details[index].weight, style: TextStyle(fontSize: 10),)
                                          ],
                                        );
                                      }),
                                );
                              },
                              error: (e,stack){
                                return Text(e.toString());
                              },
                              loading: (){
                                return Center(child: CircleAvatar(),);
                              });
                        })
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Oil',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Text('View more',style: TextStyle(color: Colors.blue[600],fontSize: 15),),
                            Icon(Icons.arrow_forward_ios,color: Colors.blue[600],size: 15,)
                          ],
                        ).onTap(()=>OilCategoryList().launch(context)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Consumer(
                        builder: (_,ref,watch){
                          AsyncValue<List<OilModel>> product= ref.watch(oilProvider);
                          return product.when(
                              data: (details){
                                return SizedBox(
                                  child: HorizontalList(
                                      spacing: 15,
                                      itemCount: details.length,
                                      itemBuilder: (_,index){
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                height:100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                ),
                                                child: Image.network(details[index].pictureUrl.toString())),
                                            Text(details[index].price),
                                            SizedBox(height: 5,),
                                            SizedBox(
                                                width: 80,
                                                child: Text(details[index].title.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                                            SizedBox(height: 5,),
                                            Text(details[index].weight, style: TextStyle(fontSize: 10),)
                                          ],
                                        );
                                      }),
                                );
                              },
                              error: (e,stack){
                                return Text(e.toString());
                              },
                              loading: (){
                                return Center(child: CircleAvatar(),);
                              });
                        })
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Noodles',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Text('View more',style: TextStyle(color: Colors.blue[600],fontSize: 15),),
                            Icon(Icons.arrow_forward_ios,color: Colors.blue[600],size: 15,)
                          ],
                        ).onTap(()=>NudusCategoryList().launch(context)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Consumer(
                        builder: (_,ref,watch){
                          AsyncValue<List<NudusModel>> product= ref.watch(noodlesProvider);
                          return product.when(
                              data: (details){
                                return SizedBox(
                                  child: HorizontalList(
                                      spacing: 15,
                                      itemCount: details.length,
                                      itemBuilder: (_,index){
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.network(details[index].pictureUrl.toString(),height: 100,width: 100,),
                                            Text(details[index].price),
                                            SizedBox(height: 5,),
                                            SizedBox(
                                                width: 80,
                                                child: Text(details[index].title.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                                            const SizedBox(height: 5,),
                                            Text(details[index].weight, style: const TextStyle(fontSize: 10),)
                                          ],
                                        );
                                      }),
                                );
                              },
                              error: (e,stack){
                                return Text(e.toString());
                              },
                              loading: (){
                                return Center(child: CircleAvatar(),);
                              });
                        })
                  ],
                ),
              ),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Biscuits',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Text('View more',style: TextStyle(color: Colors.blue[600],fontSize: 15),),
                            Icon(Icons.arrow_forward_ios,color: Colors.blue[600],size: 15,)
                          ],
                        ).onTap(()=>BiscutCategoryList().launch(context))
                      ],
                    ),
                    SizedBox(height: 10,),
                    Consumer(
                        builder: (_,ref,watch){
                          AsyncValue<List<BiscuitsModel>> product= ref.watch(biscuitsProvider);
                          return product.when(
                              data: (details){
                                return SizedBox(
                                  child: HorizontalList(
                                      spacing: 15,
                                      itemCount: details.length,
                                      itemBuilder: (_,index){
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.network(details[index].pictureUrl.toString(),height: 100,width: 100,),
                                            Text(details[index].price),
                                            SizedBox(height: 5,),
                                            SizedBox(
                                                width: 80,
                                                child: Text(details[index].title.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                                            SizedBox(height: 5,),
                                            Text(details[index].weight, style: TextStyle(fontSize: 10),)
                                          ],
                                        );
                                      }),
                                );
                              },
                              error: (e,stack){
                                return Text(e.toString());
                              },
                              loading: (){
                                return Center(child: CircleAvatar(),);
                              });
                        })
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Sugar and Salt',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Text('View more',style: TextStyle(color: Colors.blue[600],fontSize: 15),),
                            Icon(Icons.arrow_forward_ios,color: Colors.blue[600],size: 15,)
                          ],
                        ).onTap(()=>SugarCategoryList().launch(context))
                      ],
                    ),
                    SizedBox(height: 10,),
                    Consumer(
                        builder: (_,ref,watch){
                          AsyncValue<List<SugarModel>> product= ref.watch(sugarProvider);
                          return product.when(
                              data: (details){
                                return SizedBox(
                                  child: HorizontalList(
                                      spacing: 15,
                                      itemCount: details.length,
                                      itemBuilder: (_,index){
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.network(details[index].pictureUrl.toString(),height: 100,width: 100,),
                                            Text(details[index].price),
                                            SizedBox(height: 5,),
                                            SizedBox(
                                                width: 80,
                                                child: Text(details[index].title.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                                            SizedBox(height: 5,),
                                            Text(details[index].weight, style: TextStyle(fontSize: 10),)
                                          ],
                                        );
                                      }),
                                );
                              },
                              error: (e,stack){
                                return Text(e.toString());
                              },
                              loading: (){
                                return Center(child: CircleAvatar(),);
                              });
                        })
                  ],
                ),
              ),
              SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }
}

// ElevatedButton(
// onPressed: () async{
// final prefs = await SharedPreferences.getInstance();
// await prefs.setString('token', '');
// const SingInPage().launch(context);
// },
// child: Text('Logout'))
// Icon(Icons.add).onTap(()=>AdminPage().launch(context)),