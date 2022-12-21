import 'package:bd_sales/Model/model_json.dart';
import 'package:bd_sales/Route%20Page/route_page.dart';
import 'package:bd_sales/import_firebase.dart';
import 'package:bd_sales/Product%20List/admin_page.dart';
import 'package:bd_sales/screen/home_page.dart';
import 'package:bd_sales/screen/sign_in.dart';
import 'package:bd_sales/screen/sign_up.dart';
import 'package:bd_sales/screen/spalash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
       const ProviderScope(child: myApp())
  );
}
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: RoutePage(),
    );

  }
}
