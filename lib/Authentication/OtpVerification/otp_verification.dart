import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pinput/pinput.dart';

class OtpVerification extends StatelessWidget {
const OtpVerification({ Key? key }) : super(key: key);

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
            const Pinput(length: 6, showCursor: true,)
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
          onPressed: () => context.go('/homeScreen'),
        ),
      ),
    );
  }
}