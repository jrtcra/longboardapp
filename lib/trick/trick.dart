import 'package:flutter/material.dart';
import 'package:longboardapp/services/firestore.dart';
import 'package:longboardapp/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:longboardapp/trick/trick_state.dart';
import 'package:longboardapp/services/models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TrickScreen extends StatelessWidget {
  final String trickId;
  const TrickScreen({super.key, required this.trickId});

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
        create: (_) => TrickState(),
        child: FutureBuilder<Trick>(
          future: FirestoreService().getTrick(trickId),
          builder: (context, snapshot) {
            var state = Provider.of<TrickState>(context);
            if (!snapshot.hasData || snapshot.hasError) {
              return LoadingScreen();
            } else {
              var trick = snapshot.data!;
              return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: const Icon(FontAwesomeIcons.xmark),
                    onPressed: () => Navigator.pop(context),
                    ),
                ),
                body: Placeholder() //for video
              );
            }
          },
        ));
  }
}
