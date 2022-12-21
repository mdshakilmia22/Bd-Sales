import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nb_utils/nb_utils.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  color: Colors.white,
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
              )

            ],
          )),
    );
  }
}
