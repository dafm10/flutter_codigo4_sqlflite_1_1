import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTextFieldWidget extends StatelessWidget {

  String hintText;
  String icon;
  int? maxLines;
  TextEditingController controller;

  InputTextFieldWidget({required this.controller, required this.hintText, required this.icon, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.comfortaa(
          color: Colors.white60,
          fontSize: 14.0,
        ),
        filled: true,
        fillColor: Color(0xff203157),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(18.0),
        ),
        prefixIcon: SvgPicture.asset(
          "assets/icons/$icon.svg",
          color: Colors.white,
          height: 10.0,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
