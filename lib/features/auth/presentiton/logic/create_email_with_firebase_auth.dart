import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/shared/widgets/show_error_massage.dart';

createAcountWithFirebaseAuth(
  String email,
  String password,
  BuildContext context,
) async {
  final auth = FirebaseAuth.instance;
  try {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showErrorMassage(context, message: 'The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      showErrorMassage(
        context,
        message: 'The account already exists for that email.',
      );
    }
  } catch (e) {
    showErrorMassage(context, message: "Unable to create account.");
  }
}
