import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double prcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;
  const RadialProgress({
    super.key, 
    required this.prcentaje,
      this.colorPrimario = Colors.pink,
      this.colorSecundario = Colors.grey,
      this.grosorPrimario = 10,
      this.grosorSecundario = 5
      });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double procentajeAnterior;

  @override
  void initState() {
    super.initState();

    procentajeAnterior = widget.prcentaje;

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.prcentaje - procentajeAnterior;
    procentajeAnterior = widget.prcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
              painter: _MiradialProgres(
                 (widget.prcentaje - diferenciaAnimar) +
                      (diferenciaAnimar * controller.value), widget.colorPrimario, widget.colorSecundario, widget.grosorSecundario, widget.grosorPrimario)),
        );
      },
    );
  }
}

class _MiradialProgres extends CustomPainter {
  final double porcent;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  _MiradialProgres( this.porcent, this.colorPrimario, this.colorSecundario, this.grosorSecundario, this.grosorPrimario);
  @override
  void paint(Canvas canvas, Size size) {
    //* Circulo Completado
    final paint = Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.5, size.height * 0.5);

    final double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    //* Arco del circulo
    final arcPaint = Paint()
      ..strokeWidth = grosorPrimario
      ..color = colorPrimario
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    //* Parque que se va a ir llenando

    double arcAngle = 2 * pi * (porcent / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
