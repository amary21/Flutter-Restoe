import 'package:flutter/material.dart';

class InfoItemSubtitle extends StatelessWidget {
  final String title;

  const InfoItemSubtitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
