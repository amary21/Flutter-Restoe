import 'package:flutter/material.dart';
import 'package:restoe/common/styles.dart';
import 'package:restoe/data/api/api_service.dart';
import 'package:restoe/data/models/resto_result.dart';
import 'package:restoe/view/resto_detail_page.dart';
import 'package:restoe/widgets/list_item.dart';

class RestoListPage extends StatefulWidget {
  static const routeName = '/resto_list';

  @override
  _RestoListPageState createState() => _RestoListPageState();
}

class _RestoListPageState extends State<RestoListPage> {
  Future<RestoResult> _result;

  @override
  void initState() {
    _result = ApiServices().listRestaurants();
    super.initState();
  }

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
                  margin: EdgeInsets.only(left: 16.0, top: 16.0),
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
    return FutureBuilder(
      future: _result,
      builder: (context, AsyncSnapshot<RestoResult> snapshot) {
        var state = snapshot.connectionState;
        switch (state) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.restaurants.length,
                itemBuilder: (context, index) {
                  var restaurant = snapshot.data.restaurants[index];
                  return ListItem(
                    restaurant: restaurant,
                    onPressed: () => Navigator.pushNamed(
                      context,
                      RestoDetailPage.routeName,
                      arguments: restaurant.id,
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Image.asset('assets/images/foods.png'),
              );
            } else {
              return Text('');
            }
            break;
          default:
            return Text('');
        }
      },
    );
  }
}
