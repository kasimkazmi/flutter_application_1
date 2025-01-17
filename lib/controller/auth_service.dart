import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//   Sign in with email and password

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user; // Return the user if successful
    } catch (e) {
      // Handle specific Firebase exceptions
      if (e is FirebaseAuthException) {
        print("FirebaseAuthException: ${e.message}");
        throw e; // Rethrow the exception to handle it in the UI
      }
      return null;
    }
  }

//   Register with email and password

  Future<User?> registerWithEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Error register:$e");
      return null;
    }
  }

// Verify phone number

  Future<void> verifyPhoneNumber(
      String phoneNumber, Function(String) onCodeSent) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print("Verification failed:${e.message}");
        },
        codeSent: (String verificationId, int? resendToken) {
          onCodeSent(verificationId); // Callback to handle code sent
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

// Sign in with phone number

  Future<User?> signInWithPhoneNumber(
      String verificationId, String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
    } catch (e) {
      print("Error signing in with phone:$e");
      return null;
    }
    return null;
  }
}
