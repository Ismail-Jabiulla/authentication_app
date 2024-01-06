import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utility/validator.dart';

class ConfirmPasswordForm extends StatefulWidget {

  final TextEditingController confirmPasswordController;
  final String? Function(String?)? validator;
  const ConfirmPasswordForm({super.key, required this.confirmPasswordController, required this.validator,});

  @override
  State<ConfirmPasswordForm> createState() => _ConfirmPasswordFormState();
}

class _ConfirmPasswordFormState extends State<ConfirmPasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          const EdgeInsets.only(top: 16.0, left: 20.0, right: 16.0),
          child: Container(
              alignment: AlignmentDirectional.bottomStart,
              child: Text(
                'Confirm Password*',
                style: GoogleFonts.inter(fontSize: 12),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 16, left: 16),
          child: TextFormField(
            controller: widget.confirmPasswordController,
            validator: widget.validator,
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Enter your Confirm password',
                suffixIcon: Icon(Icons.visibility_off),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.black87))),
          ),
        ),
      ],
    );
  }
}
