import 'package:authentication_app/profile_screen/profile_Screen02.dart';
import 'package:authentication_app/profile_screen/signin_screen.dart';
import 'package:authentication_app/share_preference/user_share_prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  initializedata() async {
    String token = await SessionManager.isLoggedIn('');

    if(token.isEmpty){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> SignInScreen(token: '',)), (route) => false);
    }else{
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> HomePageScreen(token: '',)), (route) => false);

    }

    print("Token from splash: $token");
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1200), (){
      initializedata();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset('assets/images/splash.gif'),
    );
  }
}
