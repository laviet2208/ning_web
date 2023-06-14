import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:ning_web/Button/Buttontype1.dart';
import 'package:ning_web/main_screens/Before_entering/Controller/LoginController.dart';
import 'package:ning_web/main_screens/Before_entering/signup_screen.dart';
import 'package:ning_web/main_screens/MainmenuScreen/mainmenu.dart';
import 'package:ning_web/utils/utils.dart';


class SigninMobi extends StatefulWidget {
  const SigninMobi({Key? key}) : super(key: key);

  @override
  State<SigninMobi> createState() => _SigninMobiState();
}

class _SigninMobiState extends State<SigninMobi> {
  final emailController = TextEditingController();
  final emailKey = GlobalKey<FormState>();

  final passController = TextEditingController();
  final passKey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseReference database = FirebaseDatabase.instance.ref("Account");

  final formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/logo_1.png',
              width: screenWidth/7.84,
              height: screenWidth/7.84,
            ),

            SizedBox(width: 10),

            Text(
              'N-iNG',
              style: TextStyle(
                fontFamily: "logo_font_1",
                fontSize: screenWidth/19.65,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),

            SizedBox(width: 5),

            Text(
              'LOG IN',
              style: TextStyle(
                fontFamily: "logo_font_1",
                fontSize: screenWidth/19.65,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),


      body: Stack(
        children: [
          // Figma Flutter Generator OrdersuccessWidget - FRAME
          Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                color : Color.fromRGBO(255, 255, 255, 1),
              ),

            child: ListView(
              children: [
                Container(height: 40,),

                Padding(
                  padding: EdgeInsets.only(left: 10),
                    child: Text('E-mail', textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.pinkAccent,
                        fontFamily: 'arial',
                        fontSize: screenWidth / 24,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),
                    )
                ),

                Container(height: 10,),

                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: screenWidth * 0.854,
                    height: screenHeight * 0.07,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: Colors.pinkAccent
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Form(
                      key: emailKey,
                      child: TextFormField(
                        controller: emailController,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Dmsan_regular',
                          //Thêm textAlignVertical vào TextStyle
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your Email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'yourAccount@gmail.com',
                          hintStyle: TextStyle(
                            color: Colors.pinkAccent,
                            fontFamily: 'Dmsan_regular',
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                ),

                Container(height: 20,),

                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Password',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontFamily: 'arial',
                          fontSize: screenWidth / 24,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),
                    )
                ),

                Container(height: 10,),

                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: screenWidth * 0.854,
                    height: screenHeight * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1,
                          color: Colors.pinkAccent
                      ),
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                        controller: passController,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Dmsan_regular',
                          //Thêm textAlignVertical vào TextStyle
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your Password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Your password',
                          prefixIcon: Icon(Icons.lock_open),
                          hintStyle: TextStyle(
                            color: Colors.pinkAccent,
                            fontFamily: 'Dmsan_regular',
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          isDense: true,
                          //Xóa contentVerticalAlignment trong InputDecoration
                        ),
                      ),
                    ),
                  ),
                ),

                Container(height: 10,),

                Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text('Forgot Password ?', textAlign: TextAlign.right, style: TextStyle(
                        color: Color.fromRGBO(0, 99, 255, 1),
                        fontFamily: 'DM Sans',
                        fontSize: screenWidth / 28,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),)
                ),

                Container(height: 30,),

                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ButtonType1(Height: 50 , Width: screenWidth * 0.8, color: Colors.orange, radiusBorder: 10, title: "Sign in", fontText: 'Dmsan_regular', colorText: Colors.white,
                    onTap: (){
                      if (formKey.currentState!.validate() && emailKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });

                        _auth.signInWithEmailAndPassword(email: emailController.text.toString(), password: passController.text.toString()).then((value){
                          LoginController.getAccountData(emailController.text.toString());
                          setState(() {
                            loading = false;
                          });
                          Navigator.push(context, MaterialPageRoute(builder:(context) => MainMenuScreen()));
                        }).onError((error, stackTrace){
                          setState(() {
                            loading = false;
                          });
                          toastMessage(error.toString());
                          print(error.toString());
                        });
                      }
                    },
                    loading: loading,
                  ),
                ),

                Container(height: 20,),


                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ButtonType1(Height: screenHeight * 0.062 , Width: screenWidth * 0.418, color: Colors.pinkAccent, radiusBorder: 10, title: "Sign up", fontText: 'Dmsan_regular', colorText: Colors.white,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context) => SignUpScreen()));
                    },
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );

  }
}
