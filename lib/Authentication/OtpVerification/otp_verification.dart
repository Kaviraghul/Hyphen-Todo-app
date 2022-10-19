import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_project/Authentication/PhoneAuth/phone_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

class OtpVerification extends StatefulWidget {
const OtpVerification({ Key? key }) : super(key: key);
  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final otpController = TextEditingController();
  var pin = '';

  void handleOTPVerification()async{
    if(otpController != null){
      try {
              PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: PhoneAuth.verify, smsCode: pin);
              await auth.signInWithCredential(credential);
              context.go('/homeScreen');
            } catch (e) {
              print("something went wrong ");
            }
    }else{
      print("please enter OTP");
    }
    
  }

  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
                 'https://assets7.lottiefiles.com/packages/lf20_bd4p6o.json', width: 300 ),
            const SizedBox(height: 10),
            const Text('Eneter the Otp for verifiation', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            Pinput(
              length: 6, 
            showCursor: true, 
            onChanged:( (value) { pin = value;})
            )
        ],
      )),
      bottomNavigationBar: 	Padding(
        padding: const EdgeInsets.all(15),
        child: ElevatedButton(
          style:ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                fixedSize: const Size(250, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))), 
          child: const Text('Verify OTP'),
          onPressed:() => handleOTPVerification(),
        ),
      ),
    );
  }
}