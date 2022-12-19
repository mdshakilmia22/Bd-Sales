
import 'package:bd_sales/Model/Provider/product_provider.dart';
import 'package:bd_sales/Model/colors_model.dart';
import 'package:bd_sales/Model/model_json.dart';
import 'package:bd_sales/screen/admin_page.dart';
import 'package:bd_sales/screen/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/product details/vagitable.dart';

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
          size: 30,
        ),
        elevation: 0.0,
        backgroundColor: AppColor.mainColor,
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
              Stack(
                  children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.4,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                    color: AppColor.mainColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 110, right: 10, left: 10),
                    child: AppTextField(
                      textFieldType: TextFieldType.NAME,
                      decoration: InputDecoration(
                          prefixIcon: Icon(IconlyLight.search),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.mic,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                          hintText: 'What are you loking for..',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          )),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 230,left: 8,right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text('Best Collections',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                      SizedBox(height: 10),
                      HorizontalList(
                          spacing: 15,
                          itemCount: 7,
                          itemBuilder: (context,index){
                            return Column(
                              children: [
                                Text(nameList[index],style: TextStyle(color: colur[index],fontSize: 14,),maxLines: 2,),
                              ],
                            );
                          })
                    ],
                  ),
                )
              ]),
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
                        Text('Fresh Vegitables',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Text('View more',style: TextStyle(color: Colors.blue[600],fontSize: 15),),
                            Icon(Icons.arrow_forward_ios,color: Colors.blue[600],size: 15,)
                          ],
                        )
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
                                            Text(details[index].title.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,),
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
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Fresh Vegitables',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Text('View more',style: TextStyle(color: Colors.blue[600],fontSize: 15),),
                            Icon(Icons.arrow_forward_ios,color: Colors.blue[600],size: 15,)
                          ],
                        )
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
                                            Text(details[index].title.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,),
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
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Fresh Vegitables',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Text('View more',style: TextStyle(color: Colors.blue[600],fontSize: 15),),
                            Icon(Icons.arrow_forward_ios,color: Colors.blue[600],size: 15,)
                          ],
                        )
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
                                            Text(details[index].title.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,),
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
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Fresh Vegitables',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Text('View more',style: TextStyle(color: Colors.blue[600],fontSize: 15),),
                            Icon(Icons.arrow_forward_ios,color: Colors.blue[600],size: 15,)
                          ],
                        )
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
                                            Text(details[index].title.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,),
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