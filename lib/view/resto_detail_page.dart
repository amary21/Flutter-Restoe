import 'package:flutter/material.dart';
import 'package:restoe/data/models/menus.dart';
import 'package:restoe/data/models/restaurants.dart';

class RestoDetailPage extends StatelessWidget {
  static const routeName = '/resto_detail';

  final Restaurants restaurants;

  const RestoDetailPage({@required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: ClipRRect(
                  child: Stack(
                    children: <Widget>[
                      Hero(
                        tag: restaurants.pictureId,
                        child: Image.network(
                          restaurants.pictureId,
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
                  restaurants.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .apply(color: Colors.white),
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
            ),
          ];
        },
        body: Container(
          margin: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildInfoDetail(
                    context, Icon(Icons.location_on), restaurants.city),
                _buildInfoDetail(
                    context, Icon(Icons.star), restaurants.rating.toString()),
                _buildTitleInfo(context, "Description"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    restaurants.description,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                _buildTitleInfo(context, "Menus"),
                _buildSubTitleInfo(context, "Foods"),
                _buildListMenu(
                    true, restaurants.menu, 'assets/images/foods.png'),
                _buildSubTitleInfo(context, "Drinks"),
                _buildListMenu(
                    false, restaurants.menu, 'assets/images/drinks.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoDetail(BuildContext context, Icon icon, String name) {
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

  Widget _buildTitleInfo(BuildContext context, String title) {
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

  Widget _buildSubTitleInfo(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildListMenu(bool isFood, Menus menus, String imgAssets) {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: isFood ? menus.foods.length : menus.drinks.length,
        itemBuilder: (context, index) {
          return _buildMenus(
              context: context,
              name: isFood ? menus.foods[index].name : menus.drinks[index].name,
              imageAsset: imgAssets);
        },
      ),
    );
  }

  Widget _buildMenus({BuildContext context, String name, String imageAsset}) {
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
