import 'package:flutter/material.dart';
import 'package:flutter_design/src/pages/emergency_page.dart';
// import 'package:flutter_design/src/pages/animations_page.dart';
// import 'package:flutter_design/src/pages/headers_page.dart';
// import 'package:flutter_design/src/retos/cuadrado_animado_page.dart';
//import 'package:flutter_design/src/labs/circular_progres_page.dart';
// import 'package:flutter_design/src/pages/graficas_circulares_page.dart';
// import 'package:flutter_design/src/labs/slideshow_page.dart';
import 'package:flutter_design/src/pages/slideshow_page.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:EmergencyPage()
    );
  }
}
