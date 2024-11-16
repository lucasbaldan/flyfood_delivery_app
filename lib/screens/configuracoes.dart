import 'package:antes_prova/Controllers/configuracoes_controller.dart';
import 'package:antes_prova/components/AppBar.dart';
import 'package:antes_prova/components/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ConfiguracoesPage extends StatelessWidget {
  const ConfiguracoesPage({super.key});

  @override
  Widget build(BuildContext context) {

    final ConfiguracoesController configuracoesController = Get.find<ConfiguracoesController>();

    return Scaffold(
      appBar: const MyAppBar(),
      drawer: MyAppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
            color: Colors.amber.shade400,
            child: const Center(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(3)),
                  Text(
                    "Configurações",
                    style: TextStyle(fontSize: 25),
                  ),
                  Padding(padding: EdgeInsets.all(3))
                ],
              ),
            ),
          ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        label: const Text("Apagar minha conta", style: TextStyle(fontSize: 15)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber.shade400,
                          foregroundColor: Colors.black,
                          elevation: 20,
                          padding: const EdgeInsets.fromLTRB(0, 13, 0, 13)
                        ),
                        icon: const Icon(FontAwesomeIcons.deleteLeft),
                        onPressed: () => configuracoesController.excluirUsuario()),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
