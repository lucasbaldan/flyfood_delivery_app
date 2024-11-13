import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 20,
        shadowColor: Colors.black,
        backgroundColor: const Color(0xfffc11313),
        title: Text("FlyFood", style: GoogleFonts.kanit()));
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
