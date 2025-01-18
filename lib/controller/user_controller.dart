import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  // Firebase instance for authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Firebase instance to access Firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Observable variable to track loading state (true when fetching user data)
  var isLoading = false.obs;

  // Observable to store user data fetched from Firestore
  var userData = Rxn<Map<String, dynamic>>();

  // Observable to store any error message encountered during the data fetching process
  var errorMessage = Rxn<String>();

  // Method to fetch user details from Firestore
  Future<void> fetchUserDetails() async {
    try {
      // Set loading to true while fetching data
      isLoading.value = true;

      // Clear any previous error message
      errorMessage.value = null;

      // Get the currently authenticated user
      User? user = _auth.currentUser;

      // If there is no authenticated user, throw an error
      if (user == null) {
        throw Exception("User is not authenticated.");
      }

      // Fetch the user document from Firestore using the authenticated user's UID
      DocumentSnapshot snapshot =
      await _firestore.collection('users').doc(user.uid).get();

      // Check if the document exists
      if (!snapshot.exists) {
        throw Exception("User document not found.");
      }

      // Store the user data in the userData observable
      // The snapshot data is cast to a Map<String, dynamic>
      userData.value = snapshot.data() as Map<String, dynamic>?;

    } catch (e) {
      // In case of an error (e.g., no user, document not found, network issues), set the error message
      errorMessage.value = e.toString();
    } finally {
      // Set loading to false after the fetch operation is completed (whether successful or failed)
      isLoading.value = false;
    }
  }
}
