import 'package:bd_sales/Model/colors_model.dart';
import 'package:bd_sales/screen/home_page.dart';
import 'package:bd_sales/screen/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';
class SingInPage extends StatefulWidget {
  const SingInPage({Key? key}) : super(key: key);

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                SizedBox(height: 30,),
                AppTextField(
                    controller: emailController,
                    textFieldType: TextFieldType.EMAIL,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      hintText: 'Email Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black,width: 2.0)
                      )
                    ),
                ),
                SizedBox(height: 15,),
                AppTextField(
                  controller: passwordController,
                  textFieldType: TextFieldType.PASSWORD,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.black,width: 2.0)
                      )
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.mainColor,
                      ),
                        onPressed: () async {
                          try {
                            EasyLoading.show(status: 'Signing In');
                            final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                            );
                            EasyLoading.showSuccess('Singing Successful');
                            HomePage().launch(context);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Sign In',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                        )),
                    TextButton(
                        onPressed: (){},
                        child: Text('Forgot Password',style: TextStyle(fontSize: 15,color: Colors.blue[900]),))
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Do you any Account\'s?'),
                    TextButton(
                        onPressed: (){
                          SingUpPage().launch(context);
                        },
                        child: Text('Sign Up',style: TextStyle(fontSize: 18,color: Colors.deepOrange,fontFamily: 'Merriweather'),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
