import 'package:antes_prova/Controllers/user_controller.dart';
import 'package:antes_prova/components/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormLoginEmailSenha extends StatelessWidget {
  FormLoginEmailSenha({super.key});

final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: userController.formKey,
        child: Scaffold(
            appBar: const MyAppBar(),
            body: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - kToolbarHeight,
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
                          const Text('Tá esperando o que?',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                                  const Text(
                            'Informe suas credenciais',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          const Text(
                              'e bora decolar!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            'assets/logo.png',
                            width: 250,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 20, right: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: userController.emailUserController,
                            validator: (value) =>
                                userController.validaEmailUser(value),
                            style: const TextStyle(color: Colors.white),
                            cursorColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            decoration: const InputDecoration(
                              icon: Icon(Icons.email),
                              labelText: "Email",
                              iconColor: Color.fromARGB(255, 255, 255, 255),
                              labelStyle: TextStyle(color: Colors.white),
                              focusColor: Colors.white,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors
                                        .white), // Cor da linha quando habilitado
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors
                                        .white), // Cor da linha quando em foco
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          TextFormField(
                            obscureText: true,
                            controller: userController.passwordUserController,
                            validator: (value) =>
                                userController.validaPasswordUser(value),
                            style: const TextStyle(color: Colors.white),
                            cursorColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            decoration: const InputDecoration(
                              icon: Icon(Icons.password),
                              labelText: "Senha",
                              iconColor: Color.fromARGB(255, 255, 255, 255),
                              labelStyle: TextStyle(color: Colors.white),
                              focusColor: Colors.white,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors
                                        .white), // Cor da linha quando habilitado
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors
                                        .white), // Cor da linha quando em foco
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                            label: const Text(
                              "Acessar",
                              style: TextStyle(fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber.shade400,
                                foregroundColor: Colors.black,
                                elevation: 20,
                                padding:
                                    const EdgeInsets.fromLTRB(0, 13, 0, 13)),
                            icon: const Icon(Icons.keyboard_command_key),
                            onPressed: () {
                              userController.login();
                            }),
                      ),
                    ),
                    const SizedBox(height: 40,)
                  ],
                ),
              ),
            ))));
  }
}
