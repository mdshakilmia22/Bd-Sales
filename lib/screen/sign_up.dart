import 'package:bd_sales/Model/colors_model.dart';
import 'package:bd_sales/screen/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';
class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {

  TextEditingController emailController=TextEditingController();
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController numberController= TextEditingController();
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
                    Text('Create Your',style: TextStyle(fontSize: 32,fontFamily: 'Lobster',fontWeight: FontWeight.w500,color: Colors.green),),
                    SizedBox(width: 7,),
                    Text('Account\'s',style: TextStyle(fontSize: 32,fontFamily: 'Lobster',fontWeight: FontWeight.w500,color: Colors.red),)
                  ],
                ),
                SizedBox(height: 25,),
                AppTextField(
                  controller: firstNameController,
                  textFieldType: TextFieldType.NAME,
                  decoration: InputDecoration(
                      hintText: 'First Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black,width: 2.0)
                      )
                  ),
                ),
                SizedBox(height: 12,),
                AppTextField(
                  controller: lastNameController,
                  textFieldType: TextFieldType.NAME,
                  decoration: InputDecoration(
                      hintText: 'Last Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black,width: 2.0)
                      )
                  ),
                ),
                SizedBox(height: 12,),
                AppTextField(
                  controller: numberController,
                  textFieldType: TextFieldType.NUMBER,
                  decoration: InputDecoration(
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black,width: 2.0)
                      )
                  ),
                ),
                SizedBox(height: 12,),
                AppTextField(
                  controller: emailController,
                  textFieldType: TextFieldType.EMAIL,
                  decoration: InputDecoration(
                      hintText: 'Email Address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black,width: 2.0)
                      )
                  ),
                ),
                SizedBox(height: 12,),
                AppTextField(
                  controller: passwordController,
                  textFieldType: TextFieldType.PASSWORD,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black,width: 2.0)
                      )
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.mainColor,
                      ),
                      onPressed: () async {
                        EasyLoading.show(status: 'Signing Up');
                        try {
                          final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          EasyLoading.showSuccess('SigUp Succesful');
                          SingInPage().launch(context);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                      )),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an Account\'s'),
                    TextButton(
                        onPressed: ()=>SingInPage().launch(context),
                        child: Text('Sign In',style: TextStyle(color: Colors.deepOrange,fontSize: 18,fontFamily: 'Merriweather'),))
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
