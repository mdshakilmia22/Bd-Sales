import 'package:bd_sales/screen/home_page.dart';
import 'package:bd_sales/screen/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SpalashScreen extends StatefulWidget {
  const SpalashScreen({Key? key}) : super(key: key);

  @override
  State<SpalashScreen> createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {

  var currentPage=FirebaseAuth.instance.currentUser;
  void getData()async{
    Future.delayed(const Duration(seconds: 02)).then((value){
      if(currentPage != null){
        const HomePage().launch(context,isNewTask: true);
      }
      else{
        const SingInPage().launch(context,isNewTask: true);
      }
    });
  }
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/br.png',height: 90,width: 90,),
                SizedBox(width: 5,),
                Text('BD',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 35,fontFamily: 'Lobster',letterSpacing: 1.2),),
                Text('SALES',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 35,fontFamily: 'Lobster',letterSpacing: 1.2),),
              ],
            ),
          ],
        )
      ),
    );
  }
}
