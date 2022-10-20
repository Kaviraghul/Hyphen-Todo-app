import 'package:equatable/equatable.dart';

class PhoneAuth extends Equatable {
  final String phoneNumber;
  bool? isSignedIn;
  PhoneAuth({
    required this.phoneNumber,
    this.isSignedIn,
  }) {
    isSignedIn = isSignedIn ?? false;
  }

  PhoneAuth copyWith({
    String? phoneNumber,
    bool? isSignedIn,
  }) {
    return PhoneAuth(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isSignedIn: isSignedIn ?? this.isSignedIn,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phoneNumber': phoneNumber,
      'isSignedIn': isSignedIn,
    };
  }

  factory PhoneAuth.fromMap(Map<String, dynamic> map) {
    return PhoneAuth(
      phoneNumber: map['phoneNumber'] ?? '',
      isSignedIn: map['isSignedIn'],
    );
  }

  @override
  List<Object?> get props => [phoneNumber, isSignedIn];
}
