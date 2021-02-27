import 'package:flutter/material.dart';

class InfoItemDetail extends StatelessWidget {
  final Icon icon;
  final String name;

  const InfoItemDetail({
    Key key,
    this.icon,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            name,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ],
    );
  }
}
