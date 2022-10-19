

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_project/Repositories/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository{
  final auth.FirebaseAuth _firebaseAuth;
  final String verificationId;
  final String smsCode;

  AuthRepository({auth.FirebaseAuth? firebaseAuth, required this.smsCode, required this.verificationId}):_firebaseAuth = firebaseAuth?? auth.FirebaseAuth.instance;

  @override
  Future<User?> signUp({
    required String phoneNumber,
    required String otp
  })async{

    try{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
      await _firebaseAuth.signInWithCredential(credential);
      
      final user = credential.user;
      return user;

    }catch(e){}

  }


  @override
  // TODO: implement user
  Stream<User> get user => throw UnimplementedError();}