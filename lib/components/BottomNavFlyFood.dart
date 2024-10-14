import 'package:flutter/material.dart';

class Bottomnavflyfood extends StatelessWidget {
  const Bottomnavflyfood({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: const Color(0xfffc11313),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Início",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.flight_land), label: "Entregas Aéreas"),
        BottomNavigationBarItem(
            icon: Icon(Icons.lunch_dining), label: "Mercadorias"),
      ],
    );
  }
}
