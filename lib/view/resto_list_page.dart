import 'package:flutter/material.dart';
import 'package:restoe/common/styles.dart';
import 'package:restoe/data/models/restaurants.dart';
import 'package:restoe/view/resto_detail_page.dart';

class RestoListPage extends StatelessWidget {
  static const routeName = '/resto_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.only(top: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.restaurant,
                    color: primaryColor,
                  ),
                ),
                Text(
                  "Resto'e",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .apply(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Card(
              margin: EdgeInsets.all(0),
              child: Container(
                  margin: EdgeInsets.only(left: 16.0, top: 8.0),
                  child: _buildList(context)),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/local_restaurant.json'),
      builder: (context, snapshot) {
        final List<Restaurants> resto =
            Restaurants().parseRestaurants(snapshot.data);
        return ListView.builder(
          itemCount: resto.length,
          itemBuilder: (context, index) {
            return _buildRestoItem(context, resto[index]);
          },
        );
      },
    );
  }

  Widget _buildRestoItem(BuildContext context, Restaurants restaurant) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0, left: 16.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RestoDetailPage.routeName,
              arguments: restaurant);
        },
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
                  child: Hero(
                    tag: restaurant.pictureId,
                    child: Image.network(
                      restaurant.pictureId,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ListTile(
                    title: Text(restaurant.name),
                    subtitle: Text(restaurant.city),
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
    );
  }
}
