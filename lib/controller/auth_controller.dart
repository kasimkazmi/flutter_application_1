import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Create an instance of FirebaseAuth to handle authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Observable variable to track if the user is logged in or not
  var isLoggedIn = false.obs; // Starts as false (user is not logged in)

  @override
  void onInit() {
    super.onInit();

    // Listen for changes in authentication state using Firebase's authStateChanges() stream
    _auth.authStateChanges().listen((User? user) {
      // Update the isLoggedIn observable when the user logs in or out
      isLoggedIn.value =
          user != null; // true if a user is logged in, false otherwise
    });
  }
}
