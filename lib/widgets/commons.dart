import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final Function(String) onChanged;
  final bool obscure;
  final Function(String) onFieldSubmitted;
  final TextInputType? inputType;
  final Widget? leadingIcon;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.icon,
    required this.hintText,
    required this.onChanged,
    required this.obscure,
    required this.onFieldSubmitted,
    this.inputType,
    this.leadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 10),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 50,
            color: const Color(0xFF9F9F9F).withOpacity(0.2),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(
              right: 10.0,
            ),
            child: Icon(
              icon,
              color: const Color(0xFF8C8C8C),
            ),
          ),
          Expanded(
            child: TextFormField(
              obscureText: obscure,
              controller: controller,
              keyboardType: inputType,
              decoration: InputDecoration(
                suffixIcon: leadingIcon ?? SizedBox(),
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFF8C8C8C), //Colors.black.withOpacity(0.5),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onFieldSubmitted: onFieldSubmitted,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onPressed,
    required this.buttonText, required this.fillColor,
  });
  final Function()? onPressed;
  final String buttonText;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: RawMaterialButton(
        elevation: 2,
        fillColor: fillColor,
        //splashColor: Colors.greenAccent,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: fillColor==Colors.white?const BorderSide(width: 2, color: Color(0xFF004064)):BorderSide.none),
        child: SizedBox(
          height: 70,
          width: double.maxFinite,
          child: Center(
            child: Text(buttonText,style: GoogleFonts.poppins(
                color: fillColor==Colors.white?const Color(0xff171C1F):const Color(0xffFFFFFF),
                fontSize: 16,
                fontWeight: FontWeight.w400),),
          ),
        ),
      ),
    );
  }
}