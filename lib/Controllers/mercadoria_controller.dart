
import 'package:antes_prova/Models/mercadoria_model.dart';
import 'package:antes_prova/Services/database_firestore.dart';
import 'package:antes_prova/screens/list_mercadoria.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

DataBaseFirestore db = Get.find<DataBaseFirestore>();

class MercadoriaController extends GetxController {
  var mercadoriaList = <Mercadoria>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAll();
  }

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

  void createMercadoria() async {
    if (formKey.currentState!.validate()) {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
        barrierDismissible: false,
      );

      Mercadoria mercadoria = Mercadoria(
          id: const Uuid().v1(),
          nome: nomeProdutoController.text,
          altura: double.parse(alturaProdutoController.text),
          largura: double.parse(larguraProdutoController.text),
          peso: double.parse(pesoProdutoController.text));

      String result = await mercadoria.addMercadoriaFireStore(db);

      if (result != '') {
        Get.back();
        Get.snackbar(
          "Ops! Algo deu errado ☹️",
          result,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        Get.back();
        Get.off(() => ListMercadoria());
        Get.snackbar(
          "Sucesso",
          "Item cadastrado com sucesso",
          icon: const Icon(Icons.check),
          backgroundColor: Colors.green,
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

  void getAll() async {

      List<Mercadoria> result = await Mercadoria.getAll(db);

      if (result.isEmpty) {
        //Get.back();
        Get.snackbar(
          "Ops! Algo deu errado ☹️",
          'Falha ao se comunicar com a base de dados',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          "Sucesso",
          "Itens consultados com sucesso",
          icon: const Icon(Icons.check),
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        mercadoriaList.clear();
        mercadoriaList.addAll(result);
        //Get.back();
      }
  }
}
