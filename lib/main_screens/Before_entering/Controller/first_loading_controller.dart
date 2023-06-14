import 'dart:async';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ning_web/main_screens/Before_entering/Controller/LoginController.dart';
import 'package:ning_web/main_screens/Before_entering/home_screen.dart';
import 'package:ning_web/main_screens/MainmenuScreen/mainmenu.dart';


class FirstLoading {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null){
      LoginController.getAccountData(user.email.toString());
      Timer(const Duration(seconds: 3) , () => Navigator.push(context, MaterialPageRoute(builder:(context) => MainMenuScreen())));
    } else {
      Timer(const Duration(seconds: 3) , () => Navigator.push(context, MaterialPageRoute(builder:(context) => HomeScreen())));
    }
  }
}