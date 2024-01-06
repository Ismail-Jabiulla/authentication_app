import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:authentication_app/constants/image_strings.dart';
import '../constants/colors.dart';
import '../constants/fonts_widgets.dart';

class GoogleSignInButton extends StatefulWidget {

  final String? googleButtonText;
  const GoogleSignInButton({super.key, required this.googleButtonText});

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
            alignment: AlignmentDirectional.center,
            height: 50,
            width: 328,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  appImages.iconGooglelogo,
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.googleButtonText.toString(),
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeights.SemiBold,
                        color: AppColors.colorBlackHighButton),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
