import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgresPage extends StatefulWidget {
  const CircularProgresPage({super.key});

  @override
  State<CircularProgresPage> createState() => _CircularProgresPageState();
}

class _CircularProgresPageState extends State<CircularProgresPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double porcentaje = 0.0;
  double newPorcent = 0.0;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    controller.addListener(() {
      setState(() {
        porcentaje =
            lerpDouble(porcentaje, newPorcent, controller.value) as double;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          porcentaje = newPorcent;
          newPorcent += 10;
          if (newPorcent > 100) {
            newPorcent = 0;
            porcentaje = 0;
          }

          controller.forward(from: 0.0);
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _MiradialProgres(porcent: porcentaje),
          ),
        ),
      ),
    );
  }
}

class _MiradialProgres extends CustomPainter {
  final double porcent;

  _MiradialProgres({required this.porcent});
  @override
  void paint(Canvas canvas, Size size) {
    //* Circulo Completado
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.5, size.height * 0.5);

    final double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    //* Arco del circulo
    final arcPaint = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    //* Parque que se va a ir llenando

    double arcAngle = 2 * pi * (porcent / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
