import 'package:antes_prova/Services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ConfiguracoesController extends GetxController {
  final AuthService FBAuth = Get.find<AuthService>();

  void excluirUsuario() {
    Get.dialog(
      AlertDialog(
        title: const Text(
            'Tem certeza que deseja excluir seu usuário no sistema? ⁉️'),
        content: const Text(
            'Todas as suas informações serão apagadas e não será possível recuperá-las'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Não'),
          ),
          TextButton(
            onPressed: () async {
              String result = await FBAuth.deleteUser();
              if (result == '9999999') {
                Get.back();
                Get.dialog(AlertDialog(
                  title: const Text('Confirmação'),
                  content: const Text(
                      'Por segurança, será necessário realizar um novo login para validar sua solicitação de exclusão de usuário'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.offAndToNamed('/login-page');
                      },
                      child: const Text('Ok'),
                    ),
                  ],
                ));
              } else if (result == '') {
                Get.snackbar(
                  "Sucesso",
                  "Usuário excluído",
                  icon: const Icon(Icons.check),
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
                Get.offAndToNamed('/login-page');
              } else {
                Get.back();
                Get.snackbar(
                  "Erro",
                  result,
                  icon: const Icon(FontAwesomeIcons.xmark),
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              }
            },
            child: const Text('Sim'),
          ),
        ],
      ),
    );
  }
}
