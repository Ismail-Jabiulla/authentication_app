import 'package:authentication_app/profile_screen/profile_Screen02.dart';
import 'package:authentication_app/profile_screen/signin_screen.dart';
import 'package:authentication_app/provider/authentication_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../constants/fonts_widgets.dart';
import '../utility/validator.dart';
import '../widegts/confirm_password_widgets.dart';
import '../widegts/email_form_widgets.dart';
import '../widegts/google_signin.dart';
import '../widegts/password_form_widgets.dart';
import '../widegts/signup_header_widgets.dart';
import '../widegts/submit_button_widgets.dart';
import 'package:provider/provider.dart';
import 'package:authentication_app/share_preference/user_share_prefs.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool _isChecked = false;
  bool _isButtonEnable = false;

  void _checkButtonStatus() {
    setState(() {

      _isButtonEnable = _emailController.text.isNotEmpty &&
          _passwordController.text == _confirmPasswordController.text &&
          _isChecked;
    });
  }

  @override
  void initState() {
    _emailController.addListener(_checkButtonStatus);
    _passwordController.addListener(_checkButtonStatus);
    _confirmPasswordController.addListener(_checkButtonStatus);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///--------------background and text----------------
              SignUpHeader(),
              SizedBox(
                height: 40,
              ),

              ///--------email-----------
              EmailForm(
                emailController: _emailController,
                validator: isValidEmail,
              ),

              ///---------Password--------------
              PasswordFrom(
                passwordController: _passwordController,
                validator: isValidpassword, passTitleText: 'Password*', passHintsText: 'Enter your password',

              ),

              ///--------- Confirm Password--------------
              ConfirmPasswordForm(
                  confirmPasswordController: _confirmPasswordController,
                  validator: (value) {
                    RegExp passwordRegex =
                        RegExp(r'^[A-Za-z\d!@#$%^&*()_+]{8,}$');

                    if (_passwordController.text !=
                        _confirmPasswordController.text) {
                      print("Passwords do not match.");
                    } else if (!passwordRegex
                        .hasMatch(_confirmPasswordController.text.toString())) {
                      print(
                          "Password should be at least 8 characters long and contain only letters, digits, or special characters.");
                    } else {
                      print("Password is valid and matches the confirmation.");
                    }
                  }),

              ///----------Policy Check----------
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: _isChecked,
                        onChanged: (newValue) {
                          setState(() {
                            _isChecked = newValue!;
                            _checkButtonStatus();
                          });
                        }),
                    Text(
                      'I agree to all Term and Privacy Policy',
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeights.Bold,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),

              ///---------- Update button--------
              SizedBox(height: 60,),
              GestureDetector(
                onTap: ()async{
                  if (_formKey.currentState!.validate()){
                    updateAction(
                      _emailController.text , _passwordController.text
                    );
                  }
                },
                child: SubmitButtonWidget(
                  TextColor: _isButtonEnable,
                  containerColor: _isButtonEnable,
                  ButtonText: 'SignUp',
                ),
              ),

              ///--------Google signIn-----------
              GoogleSignInButton(googleButtonText: 'SignIn with Google',),

              ///------------Divider-------------
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.colorGrey,
                        thickness: 2,
                        indent: 40,
                        endIndent: 25,
                      ),
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                          color: AppColors.colorGreyDark, fontSize: 16),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.colorGrey,
                        thickness: 2,
                        indent: 20,
                        endIndent: 40,
                      ),
                    ),
                  ],
                ),
              ),

              ///-------SignUp-------------
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Already have an account? ',
                        style: GoogleFonts.inter(
                            color: AppColors.colorBlackHighButton)),
                    TextSpan(
                        text: 'Sign in',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeights.Bold,
                            color: AppColors.colorBlackHighButton,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInScreen(token: '',)));
                          }),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateAction(String email, String password) async{
    int status = await Provider.of<AuthenticationProvider>(context, listen: false).SignUp(email, password);
    if (status == 201) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> HomePageScreen(token: '',)), (route) => false);
      print("All Good!");
    } else if (status == 404) {
      print("Wrong email");
    } else if (status == 401) {
      print("Wrong Password");
    }
  }
}
