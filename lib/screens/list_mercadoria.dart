import 'package:antes_prova/Controllers/list_mercadoria_controller.dart';
import 'package:antes_prova/components/AppBar.dart';
import 'package:antes_prova/components/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListMercadoria extends StatelessWidget {
  const ListMercadoria({super.key});

  @override
  Widget build(BuildContext context) {
    final ListMercadoriaController mercadoriaControllerList =
        Get.find<ListMercadoriaController>();
    mercadoriaControllerList.getAll();

    return Scaffold(
      appBar: const MyAppBar(),
      drawer: MyAppDrawer(),
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
                if (mercadoriaControllerList.isLoading.isTrue) {
                  return const Center(
                      child: CircularProgressIndicator(color: Colors.red));
                } else {
                  return Visibility(
                    visible: mercadoriaControllerList.isLoading.isFalse,
                    child: RefreshIndicator(
                        onRefresh: () async =>
                            mercadoriaControllerList.getAll(),
                        child: mercadoriaControllerList.mercadoriaList.isEmpty
                            ? ListView(
                                children: const [
                                     Center(
                                      heightFactor: 10,
                                      child: Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Text(
                                            'Nenhuma mercadoria encontrada 🔎'),
                                      ),
                                    ),
                                ],
                              )
                            : ListView.builder(
                                itemCount: mercadoriaControllerList
                                    .mercadoriaList.length,
                                itemBuilder: (context, index) {
                                  final mercadoria = mercadoriaControllerList
                                      .mercadoriaList[index];
                                  return Dismissible(
                                      key: Key(mercadoria.id.toString()),
                                      direction: DismissDirection.endToStart,
                                      onDismissed: (direction) =>
                                          mercadoriaControllerList
                                              .deleteById(mercadoria),
                                      background: Container(
                                        color: Colors.red,
                                        alignment: Alignment.centerRight,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: Card(
                                        shadowColor: Colors.black,
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 225, 171, 171),
                                              width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(13.0),
                                        ),
                                        child: Column(
                                          children: [
                                            ListTile(
                                              minLeadingWidth: 50,
                                              leading: const Icon(Icons.album),
                                              title: Text(mercadoria.nome),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "${mercadoria.largura} Cm's Largura por ${mercadoria.altura} CM's de Altura"),
                                                  Text(
                                                      "${mercadoria.peso} KG's"),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ));
                                },
                              )),
                  );
                }
              }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offAndToNamed('/form-mercadoria');
        },
        foregroundColor: Colors.black,
        backgroundColor: Colors.amber.shade300,
        child: const Icon(Icons.add_circle_outline_sharp),
      ),
    );
  }
}
