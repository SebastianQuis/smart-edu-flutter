import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  final double height;
  const LogoImage({super.key, this.height = 300});

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: double.infinity,
      height: height,
      child: const Image(
        image: AssetImage('assets/logo_smart.png'),
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}

