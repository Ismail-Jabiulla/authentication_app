import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../constants/fonts_widgets.dart';


class SubmitButtonWidget extends StatefulWidget {

  final containerColor;
  final TextColor;
  final String? ButtonText;

  const SubmitButtonWidget({
    super.key,
    required this.containerColor,required this.TextColor,
    required this.ButtonText,
  });

  @override
  State<SubmitButtonWidget> createState() => _SubmitButtonWidgetState();
}

class _SubmitButtonWidgetState extends State<SubmitButtonWidget> {



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
          alignment: AlignmentDirectional.center,
          height: 50,
          width: 328,
          decoration: BoxDecoration(
            color: widget.containerColor ? AppColors.colorBlackHighButton
                : AppColors.colorGrey,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Text(
            widget.ButtonText.toString(),
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeights.SemiBold,
                  color: widget.TextColor
                      ? AppColors.colorWhiteHighEmp
                      : AppColors.colorGreyDark),
            ),
          )),
    );
  }
}

