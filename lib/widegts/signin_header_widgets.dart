import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:authentication_app/constants/image_strings.dart';
import '../constants/colors.dart';
import '../constants/fonts_widgets.dart';
import '../profile_screen/sign_upscreen.dart';

class SignInHeaderWidgets extends StatefulWidget {

  final String? headerTextSignin;
  final String? textSpan01;
  final String? textSpan02;
  final String? textSpan03;


  const SignInHeaderWidgets({super.key, required this.headerTextSignin, required this.textSpan01, required this.textSpan02, required this.textSpan03});

  @override
  State<SignInHeaderWidgets> createState() => _SignInHeaderWidgetsState();
}

class _SignInHeaderWidgetsState extends State<SignInHeaderWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 341,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(appImages.signupImage),
            fit: BoxFit.cover,
          )),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              widget.headerTextSignin.toString(),
              style: GoogleFonts.barlow(
                textStyle: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeights.SemiBold,
                  color: AppColors.colorText,
                ),
              ),
            ),
            RichText(
                text: TextSpan(
                    style: GoogleFonts.inter(fontSize: 16),
                    children: [
                      TextSpan(text: widget.textSpan01.toString()),
                      TextSpan(
                        text: widget.textSpan02.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeights.Bold,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SignUpScreen()));
                          },
                      ),
                      TextSpan(text: widget.textSpan03),
                    ]))
          ],
        ),
      ),
    );
  }
}
