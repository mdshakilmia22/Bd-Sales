import 'dart:io';

import 'package:bd_sales/Model/Provider/product_provider.dart';
import 'package:bd_sales/Model/model_json.dart';
import 'package:bd_sales/screen/home_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  String? _imageUrl;
  Future<void> getImage() async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    var snapshot = await FirebaseStorage.instance.ref('Student Image').child(DateTime.now().microsecondsSinceEpoch.toString()).putFile(File(image!.path));
    _imageUrl = await snapshot.ref.getDownloadURL();
    setState(() {});
  }

  TextEditingController titleController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController weightController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController imageUrlController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
        backgroundColor: Colors.lime,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Consumer(
            builder: (context,ref,watch) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                            image: image == null
                                ? const DecorationImage(
                                image: AssetImage('images/bg.png'),
                                fit: BoxFit.cover)
                                : DecorationImage(
                                image: FileImage(File(image!.path)),
                                fit: BoxFit.cover)),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.camera_alt,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                      ).onTap(() => getImage()),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        AppTextField(
                          textFieldType: TextFieldType.NAME,
                          controller: titleController,
                          decoration: InputDecoration(
                              hintText: 'Product Title',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              )
                          ),

                        ),
                        SizedBox(height: 10,),
                        AppTextField(
                          textFieldType: TextFieldType.NAME,
                          controller: priceController,
                          decoration: InputDecoration(
                              hintText: 'Product Price',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              )
                          ),
                        ),
                        SizedBox(height: 10,),
                        AppTextField(
                          textFieldType: TextFieldType.NAME,
                          controller: weightController,
                          decoration: InputDecoration(
                              hintText: 'Product Weight',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              )
                          ),

                        ),
                        SizedBox(height: 10,),
                        AppTextField(
                          textFieldType: TextFieldType.NAME,
                          controller: descriptionController,
                          decoration: InputDecoration(
                              hintText: 'Product Description',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              )
                          ),
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(
                            onPressed: () async {
                              ProductModel model = ProductModel(
                                 title: titleController.text,
                                 price: priceController.text,
                                 weight: weightController.text,
                                 description: descriptionController.text,
                                 pictureUrl: _imageUrl,

                              );
                              await FirebaseDatabase.instance.ref('Product List').push().set(model.toJson()).then((value) => {
                                EasyLoading.showSuccess('Done'),
                                ref.refresh(productProvider),
                                HomePage().launch(context),
                              });
                            },
                            child: Text('Save'))
                      ],
                    ),
                  )
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
