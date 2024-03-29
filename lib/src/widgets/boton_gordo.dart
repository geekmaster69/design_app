import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color1;
  final Color color2;
  final Function() onPress;
  const BotonGordo(
      {super.key,
      required this.icon,
      required this.title,
      required this.color1,
      required this.color2,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _BotonGordoBackground(color1, color2, icon, onPress),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 140,
            width: 40,
          ),
          FaIcon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const FaIcon(
            FontAwesomeIcons.chevronRight,
            color: Colors.white,
          ),
          const SizedBox(
            width: 40,
          )
        ],
      )
    ]);
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  final IconData icon;
  final Function() onPress;
  const _BotonGordoBackground(
    this.color1,
    this.color2,
    this.icon,
    this.onPress,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(
                  0.2,
                ),
                offset: const Offset(4, 6),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            color1,
            color2,
          ])),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
                right: -20,
                top: -20,
                child: FaIcon(
                  icon,
                  size: 150,
                  color: Colors.white.withOpacity(0.2),
                ))
          ],
        ),
      ),
    );
  }
}
