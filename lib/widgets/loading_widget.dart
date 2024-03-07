import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(top: height * 0.4), 
      child: const Center(child: CircularProgressIndicator.adaptive()));
  }
}