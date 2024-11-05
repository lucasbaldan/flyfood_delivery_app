import 'package:antes_prova/Services/auth_service.dart';
import 'package:antes_prova/components/BottomNavFlyFood.dart';
import 'package:antes_prova/screens/list_mercadoria.dart';
import 'package:antes_prova/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final AuthService FBAuth = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    String nomeUsuario = FBAuth.getCurrentUser()?.displayName ?? 'Usuário';

    return Scaffold(
      appBar: AppBar(
          elevation: 20,
          shadowColor: Colors.black,
          backgroundColor: const Color(0xfffc11313),
          title: const Text("FlyFood"),
          titleTextStyle: const TextStyle(fontSize: 25)),
      drawer: Drawer(
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
            const ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
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
              onTap: () => {FBAuth.logout(), Get.off(Loginpage())},
              title: const Text("Sair"),
              leading: const Icon(Icons.logout),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 225, 225, 225)),
            child: const Column(
              children: [
                Padding(padding: EdgeInsets.all(5)),
                Text("Informações Operacionais do Drone"),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text("Identificador: FF15890"),
                Text("Status: Aguardando Pedido"),
                Text("Horas de voo restantes: 40min"),
                Padding(padding: EdgeInsets.all(5))
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          const Text(
            " - Acessos Rápidos - ",
            style: TextStyle(fontSize: 30),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade400,
                    foregroundColor: Colors.black,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {},
                  child: const Column(
                    children: [
                      Padding(padding: EdgeInsets.all(3)),
                      Icon(
                        Icons.flight_takeoff,
                        size: 40,
                      ),
                      Padding(padding: EdgeInsets.all(3)),
                      Text(
                        "Solicitar Entrega(s)",
                        style: TextStyle(fontSize: 15),
                      ),
                      Padding(padding: EdgeInsets.all(3)),
                    ],
                  )),
              const Padding(padding: EdgeInsets.only(right: 15)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade400,
                    foregroundColor: Colors.black,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {},
                  child: const Column(
                    children: [
                      Padding(padding: EdgeInsets.all(3)),
                      Icon(
                        Icons.map_outlined,
                        size: 40,
                      ),
                      Padding(padding: EdgeInsets.all(3)),
                      Text(
                        "Acompanhar Entrega",
                        style: TextStyle(fontSize: 15),
                      ),
                      Padding(padding: EdgeInsets.all(3)),
                    ],
                  )),
            ],
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade400,
                    foregroundColor: Colors.black,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    Get.to(ListMercadoria());
                  },
                  child: const Column(
                    children: [
                      Padding(padding: EdgeInsets.all(3)),
                      Icon(
                        Icons.dashboard,
                        size: 40,
                      ),
                      Padding(padding: EdgeInsets.all(3)),
                      Text(
                        "Mercadorias",
                        style: TextStyle(fontSize: 15),
                      ),
                      Padding(padding: EdgeInsets.all(3)),
                    ],
                  )),
              const Padding(padding: EdgeInsets.only(right: 15)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade400,
                    foregroundColor: Colors.black,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {},
                  child: const Column(
                    children: [
                      Padding(padding: EdgeInsets.all(3)),
                      Icon(
                        Icons.history,
                        size: 40,
                      ),
                      Padding(padding: EdgeInsets.all(3)),
                      Text(
                        "Histórico de Entregas",
                        style: TextStyle(fontSize: 15),
                      ),
                      Padding(padding: EdgeInsets.all(3)),
                    ],
                  )),
            ],
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 245, 90, 0),
                    foregroundColor: Colors.black,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {},
                  child: const Column(
                    children: [
                      Padding(padding: EdgeInsets.all(3)),
                      Row(
                        children: [
                          Icon(
                            Icons.engineering,
                            size: 40,
                          ),
                          Icon(
                            Icons.warning,
                            size: 40,
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(3)),
                      Text(
                        "Informar um Problema / Solicitar manutenção",
                        style: TextStyle(fontSize: 15),
                      ),
                      Padding(padding: EdgeInsets.all(3)),
                    ],
                  )),
            ],
          ),
          const Spacer(),
          TextButton(
              onPressed: () {},
              child: const Text("Precisa de Ajuda? Clique aqui"))
        ],
      ),
      bottomNavigationBar: const Bottomnavflyfood(),
    );
  }
}
