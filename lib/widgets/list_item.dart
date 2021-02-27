import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:restoe/common/styles.dart';
import 'package:restoe/data/api/api_url.dart';
import 'package:restoe/data/models/resto_result.dart';

class ListItem extends StatelessWidget {
  final Restaurant restaurant;
  final Function onPressed;

  const ListItem({
    Key key,
    this.restaurant,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      margin: EdgeInsets.only(bottom: 8.0, left: 16.0),
      child: InkWell(
        onTap: onPressed,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
          ),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: restaurant.pictureId == null
                      ? Container(
                          child: Image.asset('assets/images/foods.png'),
                        )
                      : Hero(
                          tag: restaurant.pictureId,
                          child: CachedNetworkImage(
                            imageUrl: imgMediumUrl + restaurant.pictureId,
                            placeholder: (context, url) =>
                                Image.asset('assets/images/foods.png'),
                            errorWidget: (context, url, error) =>
                                Image.asset('assets/images/foods.png'),
                          ),
                        ),
                ),
                Expanded(
                  flex: 4,
                  child: ListTile(
                    title: Text(restaurant.name ?? ""),
                    subtitle: Text(restaurant.city ?? ""),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
    ));
  }
}
