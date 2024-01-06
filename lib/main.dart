
import 'package:authentication_app/profile_screen/sign_upscreen.dart';
import 'package:authentication_app/profile_screen/signin_screen.dart';
import 'package:authentication_app/provider/authentication_provider.dart';
import 'package:authentication_app/provider/product_provider.dart';
import 'package:authentication_app/share_preference/user_share_prefs.dart';
import 'package:authentication_app/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'demo.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black));
  runApp(
      MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider<ProductProvider>(create: (_) => ProductProvider()),
      ],
      child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white70),
        useMaterial3: true,
      ),
      home: Splash(),
    );
  }
}
