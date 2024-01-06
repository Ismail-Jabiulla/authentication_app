import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utility/validator.dart';

class PasswordFrom extends StatefulWidget {
  final TextEditingController passwordController;
  final String? Function(String?)? validator;
  final String? passTitleText;
  final String? passHintsText;

  const PasswordFrom(
      {
        super.key,
        required this.passwordController,
        required this.validator,
        required this.passTitleText,
        required this.passHintsText
      });

  @override
  State<PasswordFrom> createState() => _PasswordFromState();
}

class _PasswordFromState extends State<PasswordFrom> {
  bool _isobscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 20.0, right: 16.0),
          child: Container(
              alignment: AlignmentDirectional.bottomStart,
              child: Text(
                widget.passTitleText.toString(),
                style: GoogleFonts.inter(fontSize: 12),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 16, left: 16),
          child: TextFormField(
            controller: widget.passwordController,
            validator: widget.validator,
            obscureText: _isobscureText,
            decoration: InputDecoration(
                hintText: widget.passHintsText.toString(),
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    _isobscureText =!_isobscureText;
                  });
    }, icon: Icon(_isobscureText ? Icons.visibility:Icons.visibility_off,)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.black87))),
          ),
        ),
      ],
    );
  }
}
