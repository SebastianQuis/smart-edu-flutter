import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final void Function()? onPressed;
  final String nombre;
  final double paddingH;

  const ButtonCustom({super.key,required this.onPressed, required this.nombre, this.paddingH = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: paddingH),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 45),
          backgroundColor: Colors.blue[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: onPressed, 
        child: Text(nombre, style: const TextStyle(color: Colors.white, fontSize: 18),)
      ),
    );
  }
}