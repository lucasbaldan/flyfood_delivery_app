import 'package:antes_prova/Controllers/user_controller.dart';
import 'package:antes_prova/screens/form_login_email_senha.dart';
import 'package:antes_prova/screens/form_new_user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});

  
final UserController userController = Get.isRegistered<UserController>()
      ? Get.find<UserController>()
      : Get.put(UserController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffc11313),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 180,
            ),
            Image.asset('assets/logo.png'),
            Text(
              "O CÉU NÃO É MAIS O LIMITE PARA SUA FOME",
              style: GoogleFonts.kanit(color: Colors.amber.shade400, fontSize: 17),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        label: const Text("Entrar", style: TextStyle(fontSize: 15)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber.shade400,
                          foregroundColor: Colors.black,
                          elevation: 20,
                          padding: const EdgeInsets.fromLTRB(0, 13, 0, 13)
                        ),
                        icon: const Icon(Icons.login_outlined),
                        onPressed: () => Get.to(() => FormLoginEmailSenha())),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        label: const Text("Quero me cadastrar!", style: TextStyle(fontSize: 15),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber.shade400,
                          foregroundColor: Colors.black,
                          elevation: 20,
                          padding: const EdgeInsets.fromLTRB(0, 13, 0, 13)
                        ),
                        icon: const Icon(Icons.person_add_outlined),
                        onPressed: () => Get.to(() => FormNewUser())),
                  ),
                   const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        label: const Text("Google", style: TextStyle(fontSize: 15),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 255, 244, 244),
                          foregroundColor: Colors.black,
                          elevation: 20,
                          padding: const EdgeInsets.fromLTRB(0, 13, 0, 13)
                        ),
                        icon: const Icon(FontAwesomeIcons.google),
                        onPressed: () => userController.logarGoogle()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
