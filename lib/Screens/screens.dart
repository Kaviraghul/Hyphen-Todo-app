import 'package:firebase_auth_project/Authentication/OtpVerification/otp_verification.dart';
import 'package:firebase_auth_project/Authentication/PhoneAuth/phone_auth.dart';
import 'package:firebase_auth_project/Tasks/tasks.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Screens extends StatelessWidget {
 Screens({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Hyphen task',
    );

  }
      final GoRouter _router = GoRouter(routes: <GoRoute>[
        GoRoute( 
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const PhoneAuth()),
        GoRoute( 
        path: '/otpVerificationScreen',
        builder: (BuildContext context, GoRouterState state) => const OtpVerification()),
        GoRoute( 
        path: '/homeScreen',
        builder: (BuildContext context, GoRouterState state) => const Tasks())
      ]);
}