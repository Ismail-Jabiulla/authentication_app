import 'package:authentication_app/widegts/email_form_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:authentication_app/constants/image_strings.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../constants/fonts_widgets.dart';
import '../utility/validator.dart';
import '../widegts/submit_button_widgets.dart';
import 'code_varification.dart';
import 'forgetpass_verification.dart';

class ForgetPasswordScreen extends StatefulWidget {

  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  bool _isButtonEnable = false;

  void _checkButtonStatus() {
    setState(() {
      _isButtonEnable = _emailController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    _emailController.addListener(_checkButtonStatus);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              ///--------------background and text----------------
              Container(
                height: 341,
                width: double.infinity,
                decoration: BoxDecoration(
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
                        'Enter your email',
                        style: GoogleFonts.barlow(
                          textStyle: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeights.SemiBold,
                            color: AppColors.colorText,
                          ),
                        ),
                      ),
                      Text('Enter your email to reset password',
                        style: GoogleFonts.inter(textStyle: TextStyle(
                            fontSize: 12, color: AppColors.colorText)),),
                    ],
                  ),
                ),
              ),

              ///--------email-----------
             EmailForm(emailController: _emailController, validator: isValidEmail),

              ///----------button--------
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPass_VarificatioCode()));
                  }
                },
                  child: SubmitButtonWidget(containerColor:_isButtonEnable,
                    TextColor: _isButtonEnable,
                    ButtonText: 'Confirm',)),

            ],
          ),
        ),
      ),
    );
  }
}


