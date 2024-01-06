import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utility/validator.dart';
class EmailForm extends StatefulWidget {

  final TextEditingController emailController;
  final String? Function(String?)? validator;
  const EmailForm({super.key, required this.emailController, required this.validator});

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding:
          const EdgeInsets.only(top: 16.0, left: 20.0, right: 16.0),
          child: Container(
              alignment: AlignmentDirectional.bottomStart,
              child: Text(
                'Email*',
                style: GoogleFonts.inter(fontSize: 12),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 16, left: 16),
          child: TextFormField(
            controller: widget.emailController,
            validator: isValidEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'Enter Your email',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.black87))),
          ),
        ),

      ],
    );
  }
}
