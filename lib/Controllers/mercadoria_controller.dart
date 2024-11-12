import 'package:antes_prova/Models/mercadoria_model.dart';
import 'package:antes_prova/Services/database_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v1.dart';

DataBaseFirestore db = Get.find<DataBaseFirestore>();

class MercadoriaController extends GetxController {
  //var mercadoriaList = <Mercadoria>[].obs;

  var formKey = GlobalKey<FormState>();
  TextEditingController nomeProdutoController = TextEditingController();
  TextEditingController larguraProdutoController = TextEditingController();
  TextEditingController alturaProdutoController = TextEditingController();
  TextEditingController pesoProdutoController = TextEditingController();

  String? validaNomeProduto(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o nome da mercadoria';
    }
    return null;
  }

  String? validaLarguraProduto(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira a largura da mercadoria';
    } else if (double.tryParse(value) == null) {
      return 'Por favor, insira um valor de largura válido';
    }
    return null;
  }

  String? validaAlturaProduto(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira a altura da mercadoria';
    } else if (double.tryParse(value) == null) {
      return 'Por favor, insira um valor de altura válido';
    }
    return null;
  }

  String? validaPesoProduto(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o peso da mercadoria';
    } else if (double.tryParse(value) == null) {
      return 'Por favor, insira um valor de peso válido';
    }
    return null;
  }

  Future<String> createMercadoria() async {
    try {
      Mercadoria mercadoria = Mercadoria(
          id: const Uuid().v1(),
          nome: nomeProdutoController.text,
          altura: double.parse(alturaProdutoController.text),
          largura: double.parse(larguraProdutoController.text),
          peso: double.parse(pesoProdutoController.text));

      await db
          .collection('mercadorias')
          .doc(mercadoria.id)
          .set(mercadoria.toMap());
    } on FirebaseException catch (e) {
      String errorMessage;
      if (e.code == 'permission-denied') {
        errorMessage = "Usuário sem permissão para esta ação";
      } else if (e.code == 'unavailable') {
        errorMessage = "Serviço indisponível. Verifique a conexão.";
      } else {
        errorMessage = "Erro Firestore: ${e.message}";
      }
      return errorMessage;
    } catch (e) {
      return "Erro inesperado no FireBase: $e";
    }
    return '';
  }
}
