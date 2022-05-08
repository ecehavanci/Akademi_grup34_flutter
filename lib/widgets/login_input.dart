import 'package:flutter/material.dart';
import 'package:moodvicer/values.dart';


class CustomSignInTextField extends StatelessWidget {
  final Widget? child;
  final Function(String)? onChanged;
  final String? hint;
  final String label;
  final Icon? icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType keyboardType;
  final BuildContext? context;
  final Color borderColor;

  const CustomSignInTextField(
      {Key? key,
      this.child,
      this.context,
      this.onChanged,
      this.hint,
      required this.label,
      this.icon,
      required this.controller,
      this.validator,
      this.onSaved,
      required this.keyboardType,
      this.borderColor: Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context).size;
    return SizedBox(
      child: TextFormField(
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        textAlign: TextAlign.left,
        onChanged: onChanged,
        onSaved: onSaved,
        style: TextStyle(
          color: AppColors.black,
          fontSize: 15.0,
          height: 1.5,
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 1),
            borderRadius: BorderRadius.circular(15.0),
          ),
          hintText: hint,
          labelText: label,
          icon: icon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide:  BorderSide(color: borderColor,width: 1),
          ),
        ),
      ),
    );
  }
}
