import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FormNewUserController extends GetxController {
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

  Future<void> createUser() async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailUserController.text.trim(),
          password: passwordUserController.text.trim(),
        );

        await userCredential.user?.updateDisplayName(nomeUserController.text.trim());

        // Obtém o usuário criado
        User? user = userCredential.user;

        if (user != null) {
          Get.snackbar(
            "Sucesso",
            "Usuário criado com sucesso!",
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      } on FirebaseAuthException catch (e) {
        String errorMessage;
        if (e.code == 'weak-password') {
          errorMessage = 'A senha é muito fraca.';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'Este email já está em uso.';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'Email inválido.';
        } else {
          errorMessage = 'Erro desconhecido: ${e.message}';
        }

        Get.snackbar(
          "Erro",
          errorMessage,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } catch (e) {
        Get.snackbar(
          "Erro",
          "Ocorreu um erro ao criar o usuário. Tente novamente.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        "Erro",
        "Por favor, preencha todos os campos corretamente.",
        backgroundColor: Colors.orange.shade400,
        colorText: Colors.white,
      );
    }
  }

}
