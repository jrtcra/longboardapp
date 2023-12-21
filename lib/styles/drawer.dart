import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:longboardapp/trick/trick.dart';
import 'package:longboardapp/services/models.dart';

class TrickList extends StatelessWidget {
  final Style style;

  const TrickList({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: style.tricks.map((trick) {
      return Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 4,
        margin: const EdgeInsets.all(4),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    TrickScreen(trickId: trick.id)));
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(
                trick.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              leading: TrickBadge(style: style, trickId: trick.id),
            ),
          ),
        ),
      );
    }).toList());
  }
}

class TrickBadge extends StatelessWidget {
  final String trickId;
  final Style style;
  const TrickBadge({super.key, required this.trickId, required this.style});

  @override
  Widget build(BuildContext context) {
    Report report = Provider.of<Report>(context);
    List completed = report.Styles[style.id] ?? [];
    if (completed.contains(trickId)) {
      return const Icon(FontAwesomeIcons.checkDouble, color: Colors.green);
    } else {
      return const Icon(FontAwesomeIcons.solidCircle, color: Colors.grey);
    }
  }
}
