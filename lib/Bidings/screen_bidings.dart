import 'package:antes_prova/Controllers/configuracoes_controller.dart';
import 'package:antes_prova/Controllers/form_mercadoria_controller.dart';
import 'package:antes_prova/Controllers/list_mercadoria_controller.dart';
import 'package:antes_prova/Controllers/user_controller.dart';
import 'package:antes_prova/Services/auth_service.dart';
import 'package:antes_prova/Services/database_firestore.dart';
import 'package:get/get.dart';

class ListMercadoriaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListMercadoriaController>(() => ListMercadoriaController());
  }
}

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
  Get.put<AuthService>(AuthService(), permanent: true);
  Get.put<UserController>(UserController(), permanent: true);
  Get.put<DataBaseFirestore>(DataBaseFirestore(), permanent: true);
  } 
}

class ConfiguracoesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfiguracoesController>(() => ConfiguracoesController());
  } 
}

class FormMercadoriaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormMercadoriaController>(() => FormMercadoriaController());
  } 
}