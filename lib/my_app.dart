import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:via_cep_api/views/nav_tab_bar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple, textTheme: GoogleFonts.robotoCondensedTextTheme()),
      home: const NavTabView(),
    );
  }
}
