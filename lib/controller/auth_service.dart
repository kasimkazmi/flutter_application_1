import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Fetch user Details from Firestore
  Future<Map<String, dynamic>?> getUserDetails() async {
    try {
      User? user = _auth.currentUser;
      // print("Current user: $user"); // Debug user info
      if (user == null) {
        throw Exception("No user is currently signed in.");
      }
      DocumentSnapshot snapshot =
          await _firestore.collection('users').doc(user.uid).get();
      // print("Firestore document: ${snapshot.data()}"); // Debug document info
      if (!snapshot.exists) {
        throw Exception("User document not found in Firestore..");
      }
      return snapshot.data() as Map<String, dynamic>?;
    } catch (e) {
      // print("Error fetching user details: $e");
      rethrow;
    }
  }

//   Sign in with email and password

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user; // Return the user if successful
    } catch (e) {
      // Handle specific Firebase exceptions
      if (e is FirebaseAuthException) {
        // print("FirebaseAuthException: ${e.message}");
        rethrow; // Rethrow the exception to handle it in the UI
      }
      return null;
    }
  }

  // Register with email, password, and username

  Future<User?> registerWithEmail(
      String email, String password, String username) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      // Store user details in Firestore
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'username': username,
          'email': email,
          // Add other user details if needed
        });
      }
      return user;
    } catch (e) {
      // print("Error register: $e");
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
          // print("Verification failed:${e.message}");
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
      // print("Error signing in with phone:$e");
      return null;
    }
    return null;
  }

  // Send password rest email
  Future<void> sendPasswordRestEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
//     Handle error (e.g, user not found)
      rethrow;
    }
  }
}
