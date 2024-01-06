import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../constants/colors.dart';
import '../constants/fonts_widgets.dart';
import '../widegts/submit_button_widgets.dart';
import 'reset_password.dart';

class ForgetPass_VarificatioCode extends StatefulWidget {
  const ForgetPass_VarificatioCode({super.key});

  @override
  State<ForgetPass_VarificatioCode> createState() => _ForgetPass_VarificatioCodeState();
}

class _ForgetPass_VarificatioCodeState extends State<ForgetPass_VarificatioCode> {
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
                    controller: _textEditingController,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Required Pin';
                      }else{
                        return null;
                      }
                    },
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

                ///----------Continue Button-----------
                SizedBox(height: 40,),
                GestureDetector(
                    onTap: (){
                      if(_formKey.currentState!.validate()){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordScreen()));
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

