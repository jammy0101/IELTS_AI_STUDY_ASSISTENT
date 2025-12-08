//
//
//
//
// import 'dart:ui';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import '../../resources/routes/routes.dart';
// import '../../resources/routes/routes_names.dart';
//
// class FirebaseServices extends GetxController {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   User? get user => auth.currentUser;
//   final loadingLoginL = false.obs;
//   final loadingGoogleL = false.obs;
//   final loadingRegistration = false.obs;
//
//   final isPasswordVisibleR = false.obs;
//   final isPasswordVisibleRE = false.obs;
//   final isPasswordVisibleL = false.obs;
//
//   void togglePasswordVisibility() => isPasswordVisibleR.toggle();
//   void toggleConfirmPasswordVisibility() => isPasswordVisibleRE.toggle();
//   void togglePasswordVisibilityL() => isPasswordVisibleL.toggle();
//
//   var phoneValid = false.obs;
//   // ----------------------------
// // USER DATA OBSERVABLE
// // ----------------------------
//   final RxMap<String, dynamic> userData = <String, dynamic>{}.obs;
//
//   void setPhoneValid(bool value) => phoneValid.value = value;
//
//   Future<void> registration({
//     required String email,
//     required String password,
//     required String fullName,
//     required String phone,
//   }) async {
//     loadingRegistration.value = true;
//
//     try {
//       // Create user
//       UserCredential userCredential =
//       await auth.createUserWithEmailAndPassword(email: email, password: password);
//
//       final user = userCredential.user;
//
//       if (user != null) {
//         // Update profile
//         await user.updateDisplayName(fullName);
//         await saveUserToFirestore(user, fullName: fullName, phone: phone);
//
//         // LOGIN SUCCESS — NAVIGATE TO HOME
//         Get.snackbar("Success", "Registration Completed",
//             backgroundColor: Colors.green, colorText: Colors.white);
//
//         Get.offAllNamed(RoutesName.home);
//       }
//     } catch (e) {
//       Get.snackbar("Error", e.toString(), backgroundColor: Colors.red, colorText: Colors.white);
//     } finally {
//       loadingRegistration.value = false;
//     }
//   }
//
//
//
//   /// 🔹 Login
//
//   Future<void> login({required String email, required String password}) async {
//     loadingLoginL.value = true;
//
//     try {
//       // LOGIN USER DIRECTLY
//       UserCredential credential = await auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       // SUCCESS SNACKBAR
//       Get.snackbar(
//         "Successfully",
//         "Login Completed",
//         snackPosition: SnackPosition.TOP,
//         backgroundColor: Colors.green,
//         colorText: Colors.white,
//         duration: const Duration(seconds: 2),
//       );
//
//       // SMALL DELAY SO SNACKBAR IS VISIBLE
//       await Future.delayed(const Duration(milliseconds: 600));
//
//       // NAVIGATE TO HOME
//       Get.offAllNamed(RoutesName.home);
//
//     } catch (e) {
//       Get.snackbar(
//         "Error",
//         e.toString(),
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     } finally {
//       loadingLoginL.value = false;
//     }
//   }
//
//
//
//   /// 🔹 Google Sign-In
//   Future<User?> loginWithGoogle() async {
//     try {
//       final googleSignIn = GoogleSignIn(scopes: ['email']);
//       await googleSignIn.signOut();
//       final googleUser = await googleSignIn.signIn();
//       if (googleUser == null) return null;
//
//       final googleAuth = await googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//
//       final userCredential = await auth.signInWithCredential(credential);
//       final user = userCredential.user;
//
//       if (user != null) {
//         await saveUserToFirestore(user, fullName: user.displayName);
//         //new
//         await loadUserProfile(); // ADD THIS
//       }
//
//       Get.offAllNamed(RoutesName.home);
//       return user;
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//       return null;
//     }
//   }
//
//   Future<void> signOut() async {
//     try {
//       await FirebaseAuth.instance.signOut();
//     } catch (e) {
//       Get.snackbar(
//         "Error",
//         "Failed to logout",
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     }
//   }
//
//   /// 🔹 Firestore Save / Update
//   Future<void> saveUserToFirestore(User user, {String? fullName, String? phone}) async {
//     final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
//     final snapshot = await userRef.get();
//
//     if (!snapshot.exists) {
//       await userRef.set({
//         'uid': user.uid,
//         'name': fullName ?? user.displayName ?? '',
//         'email': user.email ?? '',
//         'phone': phone ?? user.phoneNumber ?? '',
//         'profileImage': user.photoURL ?? '',
//         //'language': 'en',
//         // 'preferences': {'notifications': true, 'theme': 'light'},
//         'createdAt': FieldValue.serverTimestamp(),
//       });
//     } else {
//       await userRef.update({
//         'name': fullName ?? user.displayName ?? '',
//         'phone': phone ?? user.phoneNumber ?? '',
//         'email': user.email ?? '',
//         'profileImage': user.photoURL ?? '',
//       });
//     }
//   }
//
//
//
// // ----------------------------
// // LOAD USER DATA FROM FIRESTORE
// // ----------------------------
//   Future<void> loadUserProfile() async {
//     if (user == null) return;
//
//     final doc = await FirebaseFirestore.instance
//         .collection("users")
//         .doc(user!.uid)
//         .get();
//
//     if (doc.exists) {
//       userData.value = doc.data()!;
//     }
//   }
//
// // ----------------------------
// // UPDATE USER DATA IN FIRESTORE
// // ----------------------------
//   Future<void> updateFirestoreProfile({
//     required String name,
//     required String phone,
//   }) async {
//     if (user == null) return;
//
//     final ref = FirebaseFirestore.instance
//         .collection("users")
//         .doc(user!.uid);
//
//     await ref.update({
//       "name": name,
//       "phone": phone,
//     });
//
//     /// ALSO UPDATE FIREBASE AUTH DISPLAY NAME
//     await user!.updateDisplayName(name);
//   }
//
// }


import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../resources/routes/routes_names.dart';

class FirebaseServices extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? get user => auth.currentUser;

  // Loaders
  final loadingLoginL = false.obs;
  final loadingGoogleL = false.obs;
  final loadingRegistration = false.obs;

  // Password visibility
  final isPasswordVisibleR = false.obs;
  final isPasswordVisibleRE = false.obs;
  final isPasswordVisibleL = false.obs;

  void togglePasswordVisibility() => isPasswordVisibleR.toggle();
  void toggleConfirmPasswordVisibility() => isPasswordVisibleRE.toggle();
  void togglePasswordVisibilityL() => isPasswordVisibleL.toggle();

  // Validation
  var phoneValid = false.obs;
  void setPhoneValid(bool value) => phoneValid.value = value;

  // USER DATA STORED FOR UI
  final RxMap<String, dynamic> userData = <String, dynamic>{}.obs;

  // ----------------------------
  // REGISTRATION
  // ----------------------------
  Future<void> registration({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  }) async {
    loadingRegistration.value = true;

    try {
      UserCredential userCredential =
      await auth.createUserWithEmailAndPassword(email: email, password: password);

      final user = userCredential.user;

      if (user != null) {
        await user.updateDisplayName(fullName);
        await saveUserToFirestore(user, fullName: fullName, phone: phone);

        // IMPORTANT — load profile into GetX variable
        await loadUserProfile();

        Get.snackbar("Success", "Registration Completed",
            backgroundColor: Colors.green, colorText: Colors.white);

        Get.offAllNamed(RoutesName.home);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      loadingRegistration.value = false;
    }
  }

  // ----------------------------
  // LOGIN (EMAIL / PASSWORD)
  // ----------------------------
  Future<void> login({required String email, required String password}) async {
    loadingLoginL.value = true;

    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Load user profile for Home
      await loadUserProfile();

      // Snackbar
      Get.snackbar(
        "Successfully",
        "Login Completed",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );

      // Delay for snackbar visibility
      await Future.delayed(const Duration(milliseconds: 600));

      Get.offAllNamed(RoutesName.home);
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      loadingLoginL.value = false;
    }
  }

  // ----------------------------
  // GOOGLE SIGN-IN
  // ----------------------------
  Future<User?> loginWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn(scopes: ['email']);
      await googleSignIn.signOut();
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await auth.signInWithCredential(credential);
      final user = userCredential.user;

      if (user != null) {
        await saveUserToFirestore(user, fullName: user.displayName);

        // IMPORTANT — load Firestore profile
        await loadUserProfile();
      }

      Get.offAllNamed(RoutesName.home);
      return user;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    }
  }

  // ----------------------------
  // LOGOUT
  // ----------------------------
  Future<void> signOut() async {
    try {
      await auth.signOut();
      userData.clear(); // clear cached data
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to logout",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // ----------------------------
  // SAVE USER TO FIRESTORE
  // ----------------------------
  Future<void> saveUserToFirestore(User user,
      {String? fullName, String? phone}) async {
    final ref = FirebaseFirestore.instance.collection('users').doc(user.uid);
    final snapshot = await ref.get();

    if (!snapshot.exists) {
      await ref.set({
        'uid': user.uid,
        'name': fullName ?? user.displayName ?? '',
        'email': user.email ?? '',
        'phone': phone ?? user.phoneNumber ?? '',
        'profileImage': user.photoURL ?? '',
        'createdAt': FieldValue.serverTimestamp(),
      });
    } else {
      await ref.update({
        'name': fullName ?? user.displayName ?? '',
        'phone': phone ?? user.phoneNumber ?? '',
        'email': user.email ?? '',
        'profileImage': user.photoURL ?? '',
      });
    }
  }

  // ----------------------------
  // LOAD USER DATA (HOME + PROFILE NEEDS THIS)
  // ----------------------------
  Future<void> loadUserProfile() async {
    if (user == null) return;

    final doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get();

    if (doc.exists) {
      userData.value = doc.data()!;
    }
  }

  // ----------------------------
  // UPDATE USER DATA
  // ----------------------------
  Future<void> updateFirestoreProfile({
    required String name,
    required String phone,
  }) async {
    if (user == null) return;

    final ref = FirebaseFirestore.instance.collection("users").doc(user!.uid);

    await ref.update({
      "name": name,
      "phone": phone,
    });

    await user!.updateDisplayName(name);
  }
}
