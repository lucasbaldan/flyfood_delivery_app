import 'package:antes_prova/Bidings/screen_bidings.dart';
import 'package:antes_prova/screens/form_mercadoria.dart';
import 'package:antes_prova/screens/list_mercadoria.dart';
import 'package:get/get.dart';

class AppScreens {
  static final routes = [
    GetPage(
      name: '/list-mercadoria',
      page: () => ListMercadoria(),
      binding: ListMercadoriaBinding(),
    ),
    GetPage(
      name: '/form-mercadoria',
      page: () => Formmercadoria(),
    ),
  ];
}