import 'package:antes_prova/Models/mercadoria_model.dart';
import 'package:antes_prova/Services/database_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListMercadoriaController extends GetxController {
  var mercadoriaList = <Mercadoria>[].obs;
  RxBool isLoading = false.obs;
  final DataBaseFirestore db = Get.find<DataBaseFirestore>();

  void getAll() async {
    mercadoriaList.clear();
    isLoading.value = true;
    List<Mercadoria> result = await Mercadoria.getAll(db);

    if (result.isEmpty) {
      Get.snackbar(
        "Ops! Algo deu errado ☹️",
        'Falha ao se comunicar com a base de dados',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      Get.offAndToNamed('/homepage');
    } else {
      isLoading.value = false;
      mercadoriaList.clear();
      mercadoriaList.addAll(result);
    }
  }
}
