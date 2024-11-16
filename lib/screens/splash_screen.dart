import 'package:antes_prova/Services/auth_service.dart';
import 'package:antes_prova/screens/home_page.dart';
import 'package:antes_prova/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

      final fBAuth = Get.find<AuthService>();

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
