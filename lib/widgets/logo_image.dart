
import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  final double height;

  const LogoImage({super.key, this.height = 300});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      height: height,
      child: Image(
        image: AssetImage('assets/logo_smart.jpg'),
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}

