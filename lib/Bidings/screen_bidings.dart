import 'package:antes_prova/Controllers/list_mercadoria_controller.dart';
import 'package:get/get.dart';

class ListMercadoriaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListMercadoriaController>(() => ListMercadoriaController());
  }
}