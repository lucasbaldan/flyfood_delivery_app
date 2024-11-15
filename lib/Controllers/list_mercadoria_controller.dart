
import 'package:antes_prova/Models/mercadoria_model.dart';
import 'package:antes_prova/Services/database_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

DataBaseFirestore db = Get.find<DataBaseFirestore>();

class ListMercadoriaController extends GetxController {
  var mercadoriaList = <Mercadoria>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAll();
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
