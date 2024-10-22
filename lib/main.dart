import 'package:antes_prova/Controllers/user_controller.dart';
import 'package:antes_prova/Services/auth_service.dart';
import 'package:antes_prova/screens/home_page.dart';
import 'package:antes_prova/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final AuthService FBAuth = Get.put(AuthService());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 255, 255)),
          useMaterial3: true,
        ),
        home:
            const Loginpage() //FBAuth.getCurrentUser() == null ? const Loginpage() : const Homepage()
        );
  }
}
