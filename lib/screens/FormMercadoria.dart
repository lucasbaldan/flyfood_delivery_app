import 'package:antes_prova/Controllers/mercadoriaController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Formmercadoria extends StatelessWidget {
  Formmercadoria({super.key});


  final MercadoriaController mercadoriaControllerForm = Get.find<MercadoriaController>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: mercadoriaControllerForm.formKey,
        child: Scaffold(
            appBar: AppBar(
                elevation: 20,
                shadowColor: Colors.black,
                backgroundColor: const Color(0xfffc11313),
                title: const Text("FlyFood"),
                titleTextStyle: const TextStyle(fontSize: 25)),
            body: SingleChildScrollView(
              child: Column(
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
                      )),
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
                          controller:
                              mercadoriaControllerForm.nomeProdutoController,
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
                          controller:
                              mercadoriaControllerForm.larguraProdutoController,
                          validator: (value) => mercadoriaControllerForm
                              .validaLarguraProduto(value),
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
                          controller:
                              mercadoriaControllerForm.alturaProdutoController,
                          validator: (value) => mercadoriaControllerForm
                              .validaAlturaProduto(value),
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
                          controller:
                              mercadoriaControllerForm.pesoProdutoController,
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
                        const Padding(padding: EdgeInsets.all(10)),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 8, 178, 230),
                              foregroundColor:
                                  const Color.fromARGB(255, 0, 0, 0),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () {
                              if (mercadoriaControllerForm.formKey.currentState!.validate()) {
                              var resposta =  mercadoriaControllerForm.addMercadoria(
                                    mercadoriaControllerForm.nomeProdutoController.text,
                                    double.parse(mercadoriaControllerForm.larguraProdutoController.text),
                                    double.parse(mercadoriaControllerForm.alturaProdutoController.text),
                                    double.parse(mercadoriaControllerForm.pesoProdutoController.text));

                                    if(resposta){
                                      Get.snackbar('Sucesso', 'Mercadoria Adicionada!', backgroundColor: Colors.green.shade500, icon: const Icon(Icons.done), duration: const Duration(seconds: 5));
                                    }
                              }
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.save_as_outlined,
                                  size: 40,
                                ),
                                Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  "Salvar",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
