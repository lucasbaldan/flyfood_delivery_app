import 'package:antes_prova/Services/auth_service.dart';
import 'package:antes_prova/screens/home_page.dart';
import 'package:antes_prova/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final AuthService fBAuth = Get.find<AuthService>();

class MyAppDrawer extends StatelessWidget {
  MyAppDrawer({super.key});

  final nomeUsuario = fBAuth.getCurrentUser()?.displayName ?? 'Usuário';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
            children: [
              const CircleAvatar(
                maxRadius: 35,
                backgroundImage: AssetImage('assets/user.png'),
              ),
              const Padding(padding: EdgeInsetsDirectional.all(5)),
              Text(nomeUsuario),
              const Text("Plano Atual: Premium")
            ],
          )),
          ListTile(
            title: const Text("Home"),
            leading: const Icon(Icons.home),
            onTap: () => {Get.off(() => const Homepage())},
          ),
          const ListTile(
            title: Text("Trocar Plano"),
            leading: Icon(Icons.price_change),
          ),
          const ListTile(
            title: Text("Regiões Atendidas"),
            leading: Icon(Icons.map),
          ),
          const ListTile(
            title: Text("Configurações"),
            leading: Icon(Icons.settings),
          ),
          ListTile(
            onTap: () => {fBAuth.logout(), Get.off(Loginpage())},
            title: const Text("Sair"),
            leading: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
