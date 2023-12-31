import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final Key? key;
  TextInputType textInputType;
  final bool obscureText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  TextEditingController? textEditingController;
  FocusNode? focusNode;
  String? hintText;
  String? labelText;
  Widget? suffixIcon;
  bool? enabled;
  String? initialValue;
  

  InputForm({ 
    this.textInputType = TextInputType.name, 
    this.obscureText = false, 
    this.onChanged, 
    this.validator, 
    this.hintText, 
    this.labelText, 
    this.suffixIcon,
    this.enabled = true,
    this.textEditingController,
    this.focusNode, 
    this.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        autocorrect: false,
        enabled: enabled,
        focusNode: focusNode,
        keyboardType: textInputType,
        obscureText: obscureText,
        textCapitalization: TextCapitalization.words,
        onChanged: onChanged,
        validator: validator,
        initialValue: initialValue,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText ?? '',
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}