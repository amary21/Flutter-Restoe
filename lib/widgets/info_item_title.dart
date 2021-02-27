import 'package:flutter/material.dart';

class InfoItemTitle extends StatelessWidget {
  final String title;

  const InfoItemTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline5
            .apply(color: Colors.grey[700]),
      ),
    );
  }
}
