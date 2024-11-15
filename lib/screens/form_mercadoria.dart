import 'package:antes_prova/Controllers/form_mercadoria_controller.dart';
import 'package:antes_prova/components/AppBar.dart';
import 'package:antes_prova/components/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Formmercadoria extends StatelessWidget {
   Formmercadoria({super.key});

  final FormMercadoriaController mercadoriaControllerForm = Get.put(FormMercadoriaController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: mercadoriaControllerForm.formKey,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
      appBar: const MyAppBar(),
      drawer: MyAppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaça os itens
        children: [
          Container(
            color: Colors.amber.shade400,
            child: const Center(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(3)),
                  Text(
                    "Cadastro de Mercadoria",
                    style: TextStyle(fontSize: 25),
                  ),
                  Padding(padding: EdgeInsets.all(3))
                ],
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.fastfood,
                size: 70,
                color: Color(0xfffc11313),
              ),
              Icon(
                Icons.dry_cleaning_outlined,
                size: 70,
                color: Colors.amber,
              ),
              Icon(
                Icons.widgets,
                size: 70,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 14, 1),
            child: Column(
              children: [
                TextFormField(
                  controller: mercadoriaControllerForm.nomeProdutoController,
                  validator: (value) =>
                      mercadoriaControllerForm.validaNomeProduto(value),
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.fastfood_rounded),
                    labelText: "Nome do Produto",
                    border: UnderlineInputBorder(),
                    iconColor: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  controller: mercadoriaControllerForm.larguraProdutoController,
                  validator: (value) =>
                      mercadoriaControllerForm.validaLarguraProduto(value),
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.width_full_outlined),
                    labelText: "Largura média (CMs)",
                    border: UnderlineInputBorder(),
                    iconColor: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  controller: mercadoriaControllerForm.alturaProdutoController,
                  validator: (value) =>
                      mercadoriaControllerForm.validaAlturaProduto(value),
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.height),
                    labelText: "Altura Média (CMs)",
                    border: UnderlineInputBorder(),
                    iconColor: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  controller: mercadoriaControllerForm.pesoProdutoController,
                  validator: (value) =>
                      mercadoriaControllerForm.validaPesoProduto(value),
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.line_weight),
                    labelText: "Peso Médio KG",
                    border: UnderlineInputBorder(),
                    iconColor: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // Expande para ocupar espaço disponível
            child: Align(
              alignment: Alignment.bottomCenter, // Posiciona no final
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                      label: const Text(
                        "Cadastrar",
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber.shade400,
                          foregroundColor: Colors.black,
                          elevation: 20,
                          padding: const EdgeInsets.fromLTRB(0, 13, 0, 13)),
                      icon: const Icon(FontAwesomeIcons.paperPlane),
                      onPressed: () =>
                          mercadoriaControllerForm.createMercadoria()),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
