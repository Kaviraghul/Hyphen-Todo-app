import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_project/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class PhoneAuth extends StatefulWidget {
  static String verify = '';

  const PhoneAuth({Key? key}) : super(key: key);

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  late String phoneNumber;
  String countryCode = '+91';
  final phoneController = TextEditingController();

  void handlePhoneAuth(BuildContext context) async {
    if (phoneController != null) {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '${countryCode + phoneNumber}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          PhoneAuth.verify = verificationId;
          context.go('/otpVerificationScreen');
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } else {
      print("please enter phone number");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(Assets.twoFactorAuth, width: 250),
              const SizedBox(height: 20),
              const Text(
                'Enter your phone number for verification',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: phoneController,
                autofocus: true,
                maxLength: 10,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                keyboardType: TextInputType.number,
                onChanged: ((value) {
                  phoneNumber = value;
                }),
                decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  prefixText: "  +91 | ",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              fixedSize: const Size(250, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          child: const Text('Get OTP'),
          onPressed: () => handlePhoneAuth(context),
        ),
      ),
    );
  }
}
