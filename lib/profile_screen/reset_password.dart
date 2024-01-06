import 'package:authentication_app/utility/validator.dart';
import 'package:authentication_app/widegts/password_form_widgets.dart';
import 'package:authentication_app/widegts/submit_button_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:authentication_app/constants/image_strings.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/fonts_widgets.dart';
import 'profile_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _isButtonEnable = false;

  void _checkButtonStatus() {
    setState(() {
      _isButtonEnable = _newPasswordController.text.isNotEmpty ==
          _confirmPasswordController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    _newPasswordController.addListener(_checkButtonStatus);
    _confirmPasswordController.addListener(_checkButtonStatus);
    super.initState();
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ///--------------background and text----------------
            Padding(
              padding: const EdgeInsets.only(
                top: 80.0,
                left: 16,
              ),
              child: Container(
                alignment: AlignmentDirectional.center,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Reset password',
                        style: GoogleFonts.barlow(
                          textStyle: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeights.SemiBold,
                          ),
                        ),
                      ),
                      Text(
                        'Reset your new password',
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
              ),
            ),

            ///---------New Password--------------
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: PasswordFrom(
                  passwordController: _newPasswordController,
                  validator: isValidpassword,
                  passTitleText: 'New Password',
                  passHintsText: 'Enter your new password'),
            ),

            ///---------Confirm New Password--------------
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: PasswordFrom(
                  passwordController: _confirmPasswordController,
                  validator: (value) {
                    RegExp passwordRegex =
                        RegExp(r'^[A-Za-z\d!@#$%^&*()_+]{8,}$');

                    if (_newPasswordController.text !=
                        _confirmPasswordController.text) {
                      print("Passwords do not match.");
                    } else if (!passwordRegex.hasMatch(_confirmPasswordController.text.toString())) {
                      print(
                          "Password should be at least 8 characters long and contain only letters, digits, or special characters.");
                    } else {
                      print("Password is valid and matches the confirmation.");
                    }
                  },
                  passTitleText: 'Confirm New Password',
                  passHintsText: 'Re-enter your new password'),
            ),

            ///----------button--------
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _showAlertDialog(context);
                }
              },
              child: SubmitButtonWidget(
                  containerColor: _isButtonEnable,
                  TextColor: _isButtonEnable,
                  ButtonText: 'Reset Password'),
            ),
          ],
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
                appImages.successGifImage,
                height: 188,
                width: 188,
              ),
              Text(
                'Success!',
                style: GoogleFonts.archivo(
                    fontSize: 24,
                    fontWeight: FontWeights.Bold,
                    color: AppColors.colorOrange),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  'Your password reset successfully \nComplete',
                  style:
                      GoogleFonts.inter(color: AppColors.colorBlackHighButton),
                ),
              ),

              ///-------Continue Button------------
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                      (Route<dynamic> route) =>
                          false, // Remove all routes except the new one
                    );
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
                          textStyle: const TextStyle(
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
