part of 'phone_auth_bloc.dart';

abstract class PhoneAuthEvent extends Equatable {
  const PhoneAuthEvent();

  @override
  List<Object> get props => [];
}

//Mentioning all the events that are needed for authentication

// When the user clicks the send OTP button after entering the phone number.
class SendOtpToPhoneEvent extends PhoneAuthEvent {
  final String phoneNumber;

  const SendOtpToPhoneEvent({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

//When the Otp user has typed is verified
class VerifySentOtpEvent extends PhoneAuthEvent {
  final String otp;
  final String verificationId;

  const VerifySentOtpEvent({
    required this.otp,
    required this.verificationId,
  });
  @override
  List<Object> get props => [otp, verificationId];
}

//Below events are side effects in theh authentication process

//this is event is triggered when the phone OTP and verification ID are sent
class OnPhoneOtpSent extends PhoneAuthEvent {
  final String verificationId;
  final int? token;
  const OnPhoneOtpSent({
    required this.verificationId,
    required this.token,
  });

  @override
  List<Object> get props => [verificationId];
}

class OnPhoneAuthErrorEvent extends PhoneAuthEvent {
  final String error;
  const OnPhoneAuthErrorEvent({required this.error});

  @override
  List<Object> get props => [error];
}

class OnPhoneAuthVerificationCompleteEvent extends PhoneAuthEvent {
  final AuthCredential credential;
  const OnPhoneAuthVerificationCompleteEvent({
    required this.credential,
  });
}
