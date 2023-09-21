import 'package:flutter/material.dart';
import 'package:longboardapp/services/models.dart';

class StyleType extends StatelessWidget {
  final Style style;
  const StyleType({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: style.img,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      StylesScreen(style: style)));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: SizedBox(
                      child: Image.asset(
                    'assets/covers/${style.img}',
                    fit: BoxFit.contain,
                  )),
                ),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    style.title,
                    style: const TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                )),
                //Flexible(child: StyleProgress)
              ],
            ),
          ),
        ));
  }
}

class StylesScreen extends StatelessWidget {
  final Style style;
  const StylesScreen({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Hero(tag: style.img, child: Image.asset('assets/covers/${style.img}',
            width: MediaQuery.of(context).size.width),
          ),
          Text(
            style.title,
            style: 
              const TextStyle(height: 2, fontSize: 20, fontWeight: FontWeight.bold)
          )
        ],
      ),
    );
  }
}
