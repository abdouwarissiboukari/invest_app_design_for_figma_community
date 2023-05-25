import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatelessWidget {
  Widget suffixIcon;
  bool obscureText;
  Function(String? value) onTextFormFieldValidation;
  TextEditingController textEditingController;
  String strLabelText;

  CustomTextFormField({
    super.key,
    required this.suffixIcon,
    required this.obscureText,
    required this.onTextFormFieldValidation,
    required this.textEditingController,
    required this.strLabelText,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 18),
        child: TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: appPrimaryColor),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: context.watch<DataProvider>().appInputBorderColor_dp,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            labelText: strLabelText,
            labelStyle: GoogleFonts.signika(
              color: context.watch<DataProvider>().appInputBorderColor_dp,
              fontSize: 17,
            ),
            suffixIcon: suffixIcon,
          ),
          obscureText: obscureText,
          validator: (value) => onTextFormFieldValidation(value),
        ),
      ),
    );
  }
}
