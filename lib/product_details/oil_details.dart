import 'package:bd_sales/Model/oil_model.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Model/colors_model.dart';
class OilDetails extends StatefulWidget {
  const OilDetails({super.key, required this.oilinformation});
  final OilModel oilinformation;

  @override
  State<OilDetails> createState() => _OilDetailsState();
}

class _OilDetailsState extends State<OilDetails> {
  int counter=0;
  void increament(){
    setState(() {
      counter++;
    });
  }
  void decrement(){
    setState(() {
      counter--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Product Details',style: TextStyle(color: Colors.black),),
        leading: const Icon(Icons.arrow_back,size: 28,color: Colors.black,).onTap(()=>Navigator.pop(context)),
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: const Text('Close',textAlign: TextAlign.center,style: TextStyle(color: AppColor.secondaryColor,fontWeight: FontWeight.w500,fontSize: 20),).onTap(()=>Navigator.pop(context)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text(widget.oilinformation.title.toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(widget.oilinformation.pictureUrl.toString(),height: 200,width: 200,)
                ],
              ),
              Row(
                children: [
                  Text('${widget.oilinformation.price} | ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  Text(widget.oilinformation.weight,style: const TextStyle(fontSize: 16),)
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.secondaryColor,
                      ),
                      onPressed: (){},
                      child: const Text('Buy Now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                          ),

                          child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.add))).onTap(()=>increament(),
                      ),
                      SizedBox(width: 7,),
                      Text('${counter}',style: TextStyle(fontSize: 16),),
                      SizedBox(width: 7,),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Icon(Icons.remove),
                          )).onTap(()=>decrement())
                    ],
                  )
                ],
              ),
              SizedBox(height: 15,),
              Divider(color: Colors.black,height: 10,),
              SizedBox(height: 10,),
              Text(widget.oilinformation.description.toString(),),
            ],
          ),
        ),
      ),
    );
  }
}
