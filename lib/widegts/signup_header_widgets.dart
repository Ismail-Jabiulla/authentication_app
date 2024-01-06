import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/fonts_widgets.dart';

class SignUpHeader extends StatefulWidget {
  const SignUpHeader({super.key});

  @override
  State<SignUpHeader> createState() => _SignUpHeaderState();
}

class _SignUpHeaderState extends State<SignUpHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 100.0,
        left: 16,
      ),
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create your account',
              style: GoogleFonts.barlow(
                textStyle: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeights.SemiBold,
                ),
              ),
            ),
            Text(
              'Lets start a journey with Te News',
              style: GoogleFonts.barlow(
                textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeights.SemiBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
