import 'package:antes_prova/Controllers/user_controller.dart';
import 'package:antes_prova/Services/auth_service.dart';
import 'package:antes_prova/Services/database_firestore.dart';
import 'package:antes_prova/screens/home_page.dart';
import 'package:antes_prova/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  // ignore: non_constant_identifier_names
  final AuthService fBAuth = Get.put(AuthService());
  final UserController userController = Get.put(UserController());
  final DataBaseFirestore bd = Get.put(DataBaseFirestore());

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if (fBAuth.getCurrentUser() == null) {
        Get.off(Loginpage());
      } else {
        Get.off(const Homepage());
      }
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
