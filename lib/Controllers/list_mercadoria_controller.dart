import 'package:antes_prova/Models/mercadoria_model.dart';
import 'package:antes_prova/Services/database_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ListMercadoriaController extends GetxController {
  var mercadoriaList = <Mercadoria>[].obs;
  RxBool isLoading = false.obs;
  final DataBaseFirestore db = Get.find<DataBaseFirestore>();

  void deleteById(Mercadoria mercadoria) async {
    String result = await mercadoria.delMercadoriaFireStore(db);

    if (result != '') {
      Get.snackbar(
        "Ops! Algo deu errado ☹️",
        result,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      Get.offAndToNamed('/homepage');
    } else {
      Get.snackbar(
        "Sucesso",
        "Item excluído com sucesso",
        icon: const Icon(FontAwesomeIcons.check),
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      mercadoriaList.removeWhere((produto) => produto.id == mercadoria.id);
    }
  }

  void getAll() async {
    try {
      mercadoriaList.clear();
      isLoading.value = true;
      List<Mercadoria> result = await Mercadoria.getAll(db);
      mercadoriaList.clear();
      mercadoriaList.addAll(result);
    } catch (e) {
      Get.snackbar(
        "Ops! Algo deu errado ☹️",
        'Falha ao se comunicar com a base de dados',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      Get.offAndToNamed('/homepage');
    } finally {
      isLoading.value = false;
    }
  }
}
