import 'package:antes_prova/Models/user_model.dart';
import 'package:antes_prova/Services/auth_service.dart';
import 'package:antes_prova/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

AuthService FBAuth = Get.find();

class UserController extends GetxController {
  var formKey = GlobalKey<FormState>();
  TextEditingController nomeUserController = TextEditingController();
  TextEditingController emailUserController = TextEditingController();
  TextEditingController passwordUserController = TextEditingController();

  String? validaNomeUser(String? value) {
    if (value == null || value.isEmpty || value.trim().length < 3) {
      return 'Por favor, insira seu nome';
    }
    return null;
  }

  String? validaEmailUser(String? value) {
    if (value == null ||
        value.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return 'Por favor, insira um email válido';
    } else {
      return null;
    }
  }

  String? validaPasswordUser(String? value) {
    if (value == null || value.isEmpty || value.trim().length < 6) {
      return 'Sua senha deve ter no mínimo 6 dígitos';
    } else {
      return null;
    }
  }

  void createUser() async {
    if (formKey.currentState!.validate()) {
        Get.dialog(
          const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
          barrierDismissible: false,
        );

       String result = await FBAuth.createUser(userCreated: Usuario(nomeUsuario: nomeUserController.text, email: emailUserController.text, password: passwordUserController.text));

        if (result != '') {
          Get.back();
          Get.snackbar(
            "Erro",
            result,
            icon: const Icon(Icons.error_outline),
            backgroundColor: const Color.fromARGB(255, 202, 0, 0),
            colorText: Colors.white,
          );
        } else {
          Get.back();
          Get.snackbar(
            "Sucesso",
            "Usuário criado com êxito",
            icon: const Icon(Icons.check),
            backgroundColor: const Color.fromARGB(255, 10, 117, 0),
            colorText: Colors.white,
          );
        }
      
    } else {
      Get.snackbar(
        "Atenção",
        "Por favor, preencha todos os campos corretamente.",
        icon: const Icon(Icons.assignment_late_rounded),
        backgroundColor: Colors.orange.shade400,
        colorText: Colors.white,
      );
    }
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      try {
        Get.dialog(
          const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
          barrierDismissible: false,
        );
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailUserController.text,
                password: passwordUserController.text);

        Get.back();
        Get.to(const Homepage());
        Get.snackbar(
          "Sucesso",
          "Login Efetuado com Sucesso!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } on FirebaseAuthException catch (e) {
        String errorMessage;
        if (e.code == 'invalid-credential') {
          errorMessage = 'Email e/ou Senha inválido(s)';
        } else if (e.code == 'too-many-requests') {
          errorMessage =
              'Muitas tentativas não sucedidas foram efetuadas. Tente novamente mais tarde.';
        } else {
          errorMessage = 'Erro ao efetuar login: ${e.code}';
        }

        Get.back();
        Get.snackbar(
          "Login Inválido",
          errorMessage,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } catch (e) {
        Get.back();
        Get.snackbar(
          "Erro",
          "Ocorreu um erro ao efetuar o login. Tente novamente.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        "Atenção",
        "Por favor, preencha todos os campos corretamente.",
        backgroundColor: Colors.orange.shade400,
        colorText: Colors.white,
      );
    }
  }
}
