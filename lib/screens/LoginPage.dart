import 'package:antes_prova/screens/form_new_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

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
            const Text(
              "SUA REFEIÇÃO COM ASAS!",
              style: TextStyle(color: Color(0xfffffd700), fontSize: 15),
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
                        onPressed: () {}),
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
                        onPressed: () => Get.to(() => const FormNewUser())),
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
