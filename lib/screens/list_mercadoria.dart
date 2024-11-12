import 'package:antes_prova/Controllers/mercadoria_controller.dart';
import 'package:antes_prova/screens/form_mercadoria.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListMercadoria extends StatelessWidget {
  ListMercadoria({super.key});

  final MercadoriaController mercadoriaControllerList = Get.put(MercadoriaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 20,
          shadowColor: Colors.black,
          backgroundColor: const Color(0xfffc11313),
          title: const Text("FlyFood"),
          titleTextStyle: const TextStyle(fontSize: 25)),
      body: Column(
        children: [
          Container(
              color: Colors.amber.shade400,
              child: const Center(
                child: Column(children: [
                  Padding(padding: EdgeInsets.all(3)),
                  Text(
                    "Listagem de Mercadorias",
                    style: TextStyle(fontSize: 25),
                  ),
                ]),
              )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(5),
            child: Obx(() {
              if (mercadoriaControllerList.mercadoriaList.isEmpty) {
                return const Center(
                  child: Text('Nenhum produto encontrado 🔎'),
                );
              } else {
                return ListView.builder(
                    itemCount: mercadoriaControllerList.mercadoriaList.length,
                    itemBuilder: (context, index) {
                      final mercadoria =
                          mercadoriaControllerList.mercadoriaList[index];

                      return Card(
                        shadowColor: Colors.black,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Color.fromARGB(255, 225, 171, 171),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(13.0)),
                        child: Column(
                          children: [
                            ListTile(
                              minLeadingWidth: 50,
                              leading: const Icon(Icons.album),
                              title: Text(mercadoria.nome),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "${mercadoria.largura} Cm's Largura por ${mercadoria.altura} CM's de Altura"),
                                  Text("${mercadoria.peso} KG's"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              }
            }),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => Formmercadoria()),
        foregroundColor: Colors.black,
        backgroundColor: Colors.amber.shade300,
        child: const Icon(Icons.add_circle_outline_sharp),
      ),
    );
  }
}
