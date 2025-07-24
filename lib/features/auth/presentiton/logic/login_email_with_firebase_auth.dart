import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/features/home/presentition/view/foodei_home.dart';
import 'package:restaurant/shared/widgets/show_error_massage.dart';

loginAcountWithEmailAndPassword({
  required String email,
  required String password,
  required BuildContext context,
}) async {
  final auth = FirebaseAuth.instance;
  try {
    final userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (userCredential.user != null) {
      context.goNamed(FoodeiHome.routeName);
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showErrorMassage(context, message: 'no user found for that email.');
    } else if (e.code == 'wrong-password') {
      showErrorMassage(
        context,
        message: 'wrong password provided for that user.',
      );
    } else if (e.code == 'invalid-email') {
      showErrorMassage(context, message: 'invalid email provided.');
    } else {
      showErrorMassage(context, message: "Invalid email or password.");
    }
  }
}
