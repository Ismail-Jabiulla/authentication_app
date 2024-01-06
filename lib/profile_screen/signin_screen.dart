import 'package:authentication_app/profile_screen/profile_Screen02.dart';
import 'package:authentication_app/profile_screen/profile_screen.dart';
import 'package:authentication_app/provider/authentication_provider.dart';
import 'package:authentication_app/share_preference/user_share_prefs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/fonts_widgets.dart';
import '../utility/validator.dart';
import '../widegts/email_form_widgets.dart';
import '../widegts/google_signin.dart';
import '../widegts/password_form_widgets.dart';
import '../widegts/signin_header_widgets.dart';
import '../widegts/submit_button_widgets.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key, required this.token});
  String token;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  bool _isButtonEnable = false;

  void _checkButtonStatus() {
    setState(() {
      _isButtonEnable = _emailController.text.isNotEmpty &&
          _passwordcontroller.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    _emailController.addListener(_checkButtonStatus);
    _passwordcontroller.addListener(_checkButtonStatus);
    super.initState();
  }

  @override
  void dispose() {
    _emailController;
    _passwordcontroller;
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
              SignInHeaderWidgets(
                headerTextSignin: 'Sign in to your \nAccount',
                textSpan01: '''Don't have an account? ''',
                textSpan02: 'Create a Account',
                textSpan03: '\nIt takes less than a minute',
              ),

              ///--------email-----------
              EmailForm(
                emailController: _emailController,
                validator: isValidEmail,
              ),

              ///---------Password--------------
              PasswordFrom(
                passwordController: _passwordcontroller,
                validator: isValidpassword,
                passTitleText: 'Password',
                passHintsText: 'Enter Your Password',
              ),

              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeights.Bold,
                          decoration: TextDecoration.underline),
                    )),
              ),

              ///----------button--------
              SizedBox(
                height: 60,
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    updateAction(
                        _emailController.text, _passwordcontroller.text);
                  };
                },
                child: SubmitButtonWidget(
                  TextColor: _isButtonEnable,
                  containerColor: _isButtonEnable,
                  ButtonText: 'Sign In',
                ),
              ),

              ///--------Google signIn-----------
              GoogleSignInButton(
                googleButtonText: 'SignIn with Google',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateAction(String email, String password) async {
    int status =
        await Provider.of<AuthenticationProvider>(context, listen: false).login(email, password);

    if (status == 200) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> HomePageScreen(token: '',)), (route) => false);
      print("All Good!");
    } else if (status == 404) {
      print("Wrong email");
    } else if (status == 401) {
      print("Wrong Password");
    }
  }
}
