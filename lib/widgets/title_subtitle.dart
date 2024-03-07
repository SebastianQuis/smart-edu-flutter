import 'package:flutter/material.dart';

class TitleSubTitle extends StatelessWidget {
  final String title;
  String? subtitle;
  final double fontiSize;

  TitleSubTitle({
    super.key, 
    required this.title, 
    this.subtitle, 
    this.fontiSize = 22
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(title, style: TextStyle(fontSize: fontiSize, fontWeight: FontWeight.w700),),

          if( subtitle != null )
            Text(
              subtitle!, 
              style: TextStyle(fontSize: 18, color: Colors.grey[700])
            ),

        ],
      ),
    );
  }
}

