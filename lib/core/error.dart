import 'package:firebase_auth/firebase_auth.dart';

class FailureAuth {
  final String errorMessage;

  FailureAuth({required this.errorMessage});

  factory FailureAuth.firebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'network-request-failed':
        return FailureAuth(errorMessage: 'No Internet Connection');
      case 'wrong-password':
        return FailureAuth(errorMessage: 'Please enter the correct password');
      case 'user-not-found':
        return FailureAuth(errorMessage: 'Email not found');
      case 'account-exists-with-different-credential':
        print('Email already exists');
        return FailureAuth(errorMessage: 'Email already exists');
      case 'too-many-requests':
        return FailureAuth(errorMessage: 'Too many attempts, please try later');
      case 'unknown':
        return FailureAuth(errorMessage: 'Email and Password Fields are required');
      default:
        return FailureAuth(errorMessage: 'Something went wrong: ${e.code}');
    }
  }
}
