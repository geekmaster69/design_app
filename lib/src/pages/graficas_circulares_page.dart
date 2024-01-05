import 'package:flutter/material.dart';
import 'package:flutter_design/src/widgets/radial_progres.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({super.key});

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomRadialProgres(porcentaje: porcentaje),
              CustomRadialProgres(porcentaje: porcentaje)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomRadialProgres(porcentaje: porcentaje),
              CustomRadialProgres(porcentaje: porcentaje)
            ],
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0.0;
            }
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class CustomRadialProgres extends StatelessWidget {
  const CustomRadialProgres({
    super.key,
    required this.porcentaje,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: RadialProgress(
        prcentaje: porcentaje,
        colorPrimario: Colors.indigo,
        
      ),
    );
  }
}
