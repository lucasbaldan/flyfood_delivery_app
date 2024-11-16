import 'package:antes_prova/Bidings/screen_bidings.dart';
import 'package:antes_prova/screens/configuracoes.dart';
import 'package:antes_prova/screens/form_mercadoria.dart';
import 'package:antes_prova/screens/home_page.dart';
import 'package:antes_prova/screens/list_mercadoria.dart';
import 'package:antes_prova/screens/login_page.dart';
import 'package:antes_prova/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppScreens {
  static final routes = [
    GetPage(
      name: '/list-mercadoria',
      page: () => const ListMercadoria(),
      binding: ListMercadoriaBinding(),
    ),
    GetPage(
      name: '/form-mercadoria',
      page: () => Formmercadoria(),
      binding: FormMercadoriaBinding()
    ),
    GetPage(
      name: '/homepage',
      page: () => const Homepage(),
    ),
    GetPage(
      name: '/splash-screen',
      page: () => const SplashScreen(),
      binding: SplashScreenBinding()
    ),
    GetPage(
      name: '/configuracoes',
      page: () => const ConfiguracoesPage(),
      binding: ConfiguracoesScreenBinding()
    ),
    GetPage(
      name: '/login-page',
      page: () => const Loginpage(),
    ),
  ];

}