import 'package:flutter/material.dart';
import 'package:longboardapp/login/login.dart';
import 'package:longboardapp/services/auth.dart';
import 'package:longboardapp/shared/bottom_nav.dart';
import 'package:longboardapp/styles/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Placeholder();
        } else if (snapshot.hasError) {
          return const Placeholder();
        } else if (snapshot.hasData) {
          return const StyleScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
