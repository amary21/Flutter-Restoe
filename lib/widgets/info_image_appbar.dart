import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restoe/data/api/api_url.dart';
import 'package:restoe/data/models/resto_detail_result.dart';

class InfoImageAppbar extends StatelessWidget {
  final Restaurant restaurant;

  const InfoImageAppbar({Key key, this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          child: Stack(
            children: <Widget>[
              restaurant.pictureId == null
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
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.width * 0.8,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
              Container(
                height: MediaQuery.of(context).size.width * 0.8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xCC000000),
                      const Color(0x00000000),
                      const Color(0x00000000),
                      const Color(0xCC000000),
                    ],
                  ),
                ),
              ),
            ],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(28),
            bottomRight: Radius.circular(28),
          ),
        ),
        title: Text(
          restaurant.name,
          style:
              Theme.of(context).textTheme.headline5.apply(color: Colors.white),
        ),
        titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
        centerTitle: true,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
    );
  }
}
