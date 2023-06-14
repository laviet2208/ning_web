import 'package:flutter/material.dart';
import 'package:ning_web/Button/Buttontype1.dart';
import 'package:ning_web/main_screens/Before_entering/Controller/SignupController.dart';
import 'dart:math';

import 'package:ning_web/main_screens/Before_entering/signin_screen.dart';

class SignupScreenMobi extends StatefulWidget {
  const SignupScreenMobi({Key? key}) : super(key: key);

  @override
  State<SignupScreenMobi> createState() => _SignupScreenMobiState();
}

class _SignupScreenMobiState extends State<SignupScreenMobi> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    bool loading = false;

    final SignupController signupController = SignupController();
    signupController.context = context;


    return Scaffold(
      body: Stack(
        children: [
          // Figma Flutter Generator OrdersuccessWidget - FRAME
          Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                color : Color.fromRGBO(255, 255, 255, 1),
              ),

              child: Stack(
                  children: <Widget>[
                    Positioned(
                        top:0,
                        left: screenWidth/4,
                        child: Container(
                          width: screenWidth/2,
                          height: screenWidth/2,
                          child: Image.asset('assets/logo_1.png', ),
                        )
                    ),


                        Positioned (
                            top: screenWidth/2 + 5,
                            left: (screenWidth - 0.96 * screenWidth) / 2,

                            child: Container (
                              height: 0.7 * screenHeight,
                              width: 0.96 * screenWidth,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.black,
                                  )
                              ),

                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                      top: screenHeight * 0.02,
                                      left: screenWidth * 0.382,
                                      child: Text('Sign up', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: 'Dmsan_regular',
                                          fontSize: screenWidth / 16.33333,
                                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.bold,
                                          height: 1
                                      ),)
                                  ),

                                  Positioned(
                                      top: screenHeight * 0.07,
                                      left: screenHeight / 165 + 6,
                                      child: Text('E-mail', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: 'Dmsan_regular',
                                          fontSize: screenWidth / 28,
                                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),

                                  Positioned(
                                      top: screenHeight * 0.178,
                                      left: screenHeight / 165 + 6,
                                      child: Text('Password', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: 'Dmsan_regular',
                                          fontSize: screenWidth / 28,
                                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),

                                  Positioned(
                                      top: screenHeight * 0.4,
                                      left: screenHeight / 165 + 6,
                                      child: Text('Name', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: 'Dmsan_regular',
                                          fontSize: screenWidth / 28,
                                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),

                                  Positioned(
                                      top: screenHeight * 0.29,
                                      left: screenHeight / 165 + 6,
                                      child: Text('Re-Password', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: 'Dmsan_regular',
                                          fontSize: screenWidth / 28,
                                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),)
                                  ),

                                  //EditText email
                                  Positioned(
                                    top: screenHeight * 0.098,
                                    left: screenHeight / 165 + 6,
                                    child: Container(
                                      width: screenWidth * 0.854,
                                      height: screenHeight * 0.07,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.black
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                      child: TextFormField(
                                        controller: signupController.emailController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter your Email";
                                          }
                                          return null;
                                        },
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Dmsan_regular',
                                          //Thêm textAlignVertical vào TextStyle
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Your Email@gmail.com',
                                          hintStyle: TextStyle(
                                            color: Colors.black,
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

                                  //EditText pass
                                  Positioned(
                                    top: screenHeight * 0.21,
                                    left: screenHeight / 165 + 6,
                                    child: Container(
                                      width: screenWidth * 0.854,
                                      height: screenHeight * 0.07,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.black
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                      child: TextFormField(
                                        controller: signupController.passwordController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter your Pass";
                                          }
                                          return null;
                                        },
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Dmsan_regular',
                                          //Thêm textAlignVertical vào TextStyle
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Your Pass',
                                          hintStyle: TextStyle(
                                            color: Colors.black,
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

                                  //EditText repass
                                  Positioned(
                                    top: screenHeight * 0.322,
                                    left: screenHeight / 165 + 6,
                                    child: Container(
                                      width: screenWidth * 0.854,
                                      height: screenHeight * 0.07,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.black
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                      child: TextFormField(
                                        controller: signupController.repasswordController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Re fill your password";
                                          }
                                          return null;
                                        },
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Dmsan_regular',
                                          //Thêm textAlignVertical vào TextStyle
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Re Password',
                                          hintStyle: TextStyle(
                                            color: Colors.black,
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


                                  //EditText name
                                  Positioned(
                                    top: screenHeight * 0.434,
                                    left: screenHeight / 165 + 6,
                                    child: Container(
                                      width: screenWidth * 0.854,
                                      height: screenHeight * 0.07,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.black
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),                                      child: TextFormField(
                                        controller: signupController.nameController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter your Name";
                                          }
                                          return null;
                                        },
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Dmsan_regular',
                                          //Thêm textAlignVertical vào TextStyle
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Alexander tamabel',
                                          hintStyle: TextStyle(
                                            color: Colors.black,
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

                                  //Sign up button
                                  Positioned(
                                    bottom: screenHeight * 0.05,
                                    left: screenHeight / 165 + 6,
                                      child: ButtonType1(Height: screenHeight * 0.062 , Width: screenWidth * 0.418 * 2, color: Color.fromRGBO(255, 49, 49, 1), radiusBorder: 10, title: "Sign up", fontText: 'Dmsan_regular', colorText: Colors.white,
                                        onTap: (){
                                          signupController.signUpPressed();
                                          setState(() {
                                            loading = signupController.loading;
                                          });
                                        } , loading: loading,
                                      ),
                                  ),

                                  //change to signin
                                  Positioned(
                                      bottom: screenHeight * 0.05 * 2 + screenHeight * 0.02,
                                      right: screenWidth / 15,
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder:(context) => SigninScreen()));
                                          },
                                          child: Text('Have a account? Sign in', textAlign: TextAlign.right, style: TextStyle(
                                              color: Color.fromRGBO(0, 99, 255, 1),
                                              fontFamily: 'Dmsan_regular',
                                              fontSize: screenWidth / 26,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.normal,
                                              height: 1
                                          ),
                                          )
                                      )
                                  ),

                                ],
                              ),
                            )
                    ),
                  ]
              )
          )
        ],
      ),
    );
  }
}
