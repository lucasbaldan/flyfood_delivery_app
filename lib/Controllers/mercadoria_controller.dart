import 'package:antes_prova/Models/mercadoria_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MercadoriaController extends GetxController{

  var mercadoriaList = <Mercadoria>[].obs;

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

  bool addMercadoria(String nomeProduto, double largura, double altura, double peso){

    mercadoriaList.add(Mercadoria(nome: nomeProduto, altura: altura, largura: largura, peso: peso));

    return true;

  }

}