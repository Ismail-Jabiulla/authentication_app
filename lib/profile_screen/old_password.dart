import 'package:authentication_app/utility/validator.dart';
import 'package:flutter/material.dart';
import 'package:authentication_app/constants/image_strings.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../constants/fonts_widgets.dart';
import '../widegts/password_form_widgets.dart';
import '../widegts/submit_button_widgets.dart';
import 'code_varification.dart';
import 'reset_password.dart';
import 'forget_password.dart';

class OldPasswordScreen extends StatefulWidget {
  OldPasswordScreen({super.key});

  @override
  State<OldPasswordScreen> createState() => _OldPasswordScreenState();
}

class _OldPasswordScreenState extends State<OldPasswordScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnable = false;

  void _checkButtonStatus() {
    setState(() {
      _isButtonEnable = _passwordController.text.isNotEmpty;
    });
  }
  @override
  void initState() {
    _passwordController.addListener(_checkButtonStatus);
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
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
                        'Enter your old password',
                        style: GoogleFonts.barlow(
                          textStyle: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeights.SemiBold,
                            color: AppColors.colorText,
                          ),
                        ),
                      ),
                      Text(
                        'Enter your old password to change new password',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 12, color: AppColors.colorText)),
                      ),
                    ],
                  ),
                ),
              ),

              ///--------old Password-----------
              PasswordFrom(
                passwordController: _passwordController,
                validator: isValidpassword,
                passTitleText: 'Old Password',
                passHintsText: 'Enter Your Old Password',
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgetPasswordScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Forgot Password',
                    style: GoogleFonts.inter(
                        fontSize: 14, fontWeight: FontWeights.Bold),
                  ),
                ),
              ),

              ///----------button--------
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> CodeVarificationScreen()), (route) => false);
                  }
                },
                  child: SubmitButtonWidget(
                containerColor: _isButtonEnable,
                TextColor: _isButtonEnable,
                ButtonText: 'Confirm',
              ))
            ],
          ),
        ),
      ),
    );
  }
}
