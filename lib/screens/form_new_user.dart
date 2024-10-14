import 'package:flutter/material.dart';

class FormNewUser extends StatelessWidget {
  const FormNewUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Scaffold(
            appBar: AppBar(
                elevation: 20,
                shadowColor: Colors.black,
                backgroundColor: const Color(0xfffc11313),
                title: const Text("FlyFood"),
                titleTextStyle: const TextStyle(fontSize: 25)),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fundocaduser.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Seja bem vindo, Capitão!',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          const Text('Prepare-se para decolar!',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                              'Nossa missão é entregar o melhor aonde quer que o seu cliente esteja.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              )),
                          Image.asset(
                            'assets/logo.png',
                            width: 200,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20, right: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            cursorColor: const Color.fromARGB(255, 255, 255, 255),
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              labelText: "Nome Completo",
                              iconColor: Color.fromARGB(255, 255, 255, 255),
                              labelStyle: TextStyle(color: Colors.white),
                              focusColor: Colors.white,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white), // Cor da linha quando habilitado
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:Colors.white), // Cor da linha quando em foco
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            cursorColor: const Color.fromARGB(255, 255, 255, 255),
                            decoration: const InputDecoration(
                              icon: Icon(Icons.email),
                              labelText: "Email",
                              iconColor: Color.fromARGB(255, 255, 255, 255),
                              labelStyle: TextStyle(color: Colors.white),
                              focusColor: Colors.white,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white), // Cor da linha quando habilitado
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:Colors.white), // Cor da linha quando em foco
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            cursorColor: const Color.fromARGB(255, 255, 255, 255),
                            decoration: const InputDecoration(
                              icon: Icon(Icons.password),
                              labelText: "Senha",
                              iconColor: Color.fromARGB(255, 255, 255, 255),
                              labelStyle: TextStyle(color: Colors.white),
                              focusColor: Colors.white,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white), // Cor da linha quando habilitado
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:Colors.white), // Cor da linha quando em foco
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                          label: const Text("Enviar", style: TextStyle(fontSize: 16),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber.shade400,
                            foregroundColor: Colors.black,
                            elevation: 20,
                            padding: const EdgeInsets.fromLTRB(0, 13, 0, 13)
                          ),
                          icon: const Icon(Icons.near_me),
                          onPressed: () {}),
                                        ),
                    ),
                  const SizedBox(height: 30,)
                  ],
                ),
              ),
            )));
  }
}
