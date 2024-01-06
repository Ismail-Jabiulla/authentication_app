import 'package:authentication_app/widegts/submit_button_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../constants/colors.dart';
import '../constants/fonts_widgets.dart';
import 'package:authentication_app/constants/image_strings.dart';

class CodeVarificationScreen extends StatefulWidget {
  const CodeVarificationScreen({super.key});

  @override
  State<CodeVarificationScreen> createState() => _CodeVarificationScreenState();
}

class _CodeVarificationScreenState extends State<CodeVarificationScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _textEditingController = TextEditingController();
  bool _isButtonEnable = false;

  void _checkButtonStatus(){
    setState(() {
      _isButtonEnable = _textEditingController.text.isNotEmpty;
    });
  }
  @override
  void initState() {
    _textEditingController.addListener(_checkButtonStatus);
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 140.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  'Enter verification code',
                  style: GoogleFonts.inter(
                      fontSize: 24, fontWeight: FontWeights.SemiBold),
                )),
                Text(
                  'We have sent a code to your email',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Pinput(
                    length: 4,
                    onSubmitted: (String pin) {},
                    defaultPinTheme: PinTheme(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: AppColors.colorWhiteHighEmp,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12)),
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeights.Bold,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                ///-------Resend Code---------
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Didn’t get a code? ',
                        style: GoogleFonts.inter(
                            color: AppColors.colorBlackHighButton)),
                    TextSpan(
                        text: 'Click to resend',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeights.Bold,
                            color: AppColors.colorBlackHighButton),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('Send Code');
                          }),
                  ]),
                ),

                ///----------Submit Button-----------
                GestureDetector(
                    onTap: (){
                      if(_formKey.currentState!.validate()){
                        _showAlertDialog(context);
                      }
                    },
                    child: SubmitButtonWidget(containerColor: _isButtonEnable, TextColor: _isButtonEnable, ButtonText: 'Continue')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          height: 410,
          width: 328,
          decoration: BoxDecoration(
              color: AppColors.colorWhiteHighEmp,
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              Image.asset(
                appImages.congratulationGifImage,
                height: 188,
                width: 188,
              ),
              Text(
                'Congratulations!',
                style: GoogleFonts.archivo(
                    fontSize: 24, fontWeight: FontWeights.Bold, color: AppColors.colorOrange),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  'Your account was created \nsuccessfully',
                  style: GoogleFonts.inter(color: AppColors.colorBlackHighButton),
                ),
              ),
              ///-------Continue Button------------
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      alignment: AlignmentDirectional.center,
                      height: 62,
                      width: 264,
                      decoration: BoxDecoration(
                        color: AppColors.colorBlackHighButton,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Text(
                        'Continue',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeights.SemiBold,
                              color: AppColors.colorText),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
