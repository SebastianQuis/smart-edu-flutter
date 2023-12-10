import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mostrarAlerta( BuildContext context, String title,String descripcion, List<Widget>? listActions){

  if( Platform.isAndroid ) {
    return showDialog(
      context: context, 
      builder: (context) => 
        AlertDialog(
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700),),
          content: Text(descripcion),
          actions: listActions,
        )
    );
  } 
    
  showCupertinoDialog(
    context: context, 
    builder: (context) {
      return CupertinoAlertDialog(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(title)),
        content: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric( vertical: 8 ),
            child: Text(descripcion, style: const TextStyle( fontSize: 14),),
          ),
        ),
        actions: listActions ?? [],
      );
    },
  );
}