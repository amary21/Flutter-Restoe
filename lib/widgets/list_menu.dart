import 'package:flutter/material.dart';

class ListMenu extends StatelessWidget {
  final String name;
  final String imageAsset;

  const ListMenu({
    Key key,
    this.name,
    this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          child: Stack(
            children: [
              Image.asset(
                imageAsset,
                color: Color.fromRGBO(128, 128, 128, 1),
                colorBlendMode: BlendMode.modulate,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.all(16.0),
                child: Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .apply(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
