import 'package:flutter/material.dart';
import 'package:longboardapp/services/auth.dart';

class StyleScreen extends StatelessWidget {
  const StyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Styles'),
      ),
      body: ElevatedButton(
          child: Text('signout'),
          onPressed: () async {
            await AuthService().signOut();
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false);
          }),
    );
  }
}
