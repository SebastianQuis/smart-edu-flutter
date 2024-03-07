import 'package:flutter/material.dart';
import 'package:smart_edu_app/theme/app_theme.dart';

// ignore: must_be_immutable
class InputForm extends StatelessWidget {
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
  final IconData prefixIcon;
  

  InputForm({
    super.key,  
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
    required this.prefixIcon, 
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
          prefixIcon: Icon(prefixIcon, color: AppTheme.color4,),
          labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: suffixIcon,
          suffixIconColor: AppTheme.color1,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.color4), // Color de la línea cuando está enfocado
          ),
          
        ),
        
      ),
    );
  }
}