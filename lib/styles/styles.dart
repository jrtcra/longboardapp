import 'package:flutter/material.dart';
import 'package:longboardapp/services/firestore.dart';
import 'package:longboardapp/services/models.dart';
import 'package:longboardapp/shared/error.dart';
import 'package:longboardapp/shared/loading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:longboardapp/shared/bottom_nav.dart';
import 'package:longboardapp/styles/style_item.dart';

class StyleScreen extends StatelessWidget {
  const StyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Style>>(
        future: FirestoreService().getStyles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return Center(
                child: ErrorMessage(message: snapshot.error.toString()));
          } else if (snapshot.hasData) {
            var styles = snapshot.data;
            return Scaffold(
                appBar: AppBar(
                    backgroundColor: Colors.deepOrange,
                    title: const Text("Styles")),
                body: GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  padding: const EdgeInsets.all(20.0),
                  crossAxisSpacing: 10.0,
                  children: styles!.map((style) => StyleType(style: style)).toList(),
                  ),
                bottomNavigationBar: const BottomNav(),);
          } else {
            return const Text("no styles found");
          }
        });
  }
}
