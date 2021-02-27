import 'package:flutter/material.dart';
import 'package:restoe/data/api/api_service.dart';
import 'package:restoe/data/models/resto_detail_result.dart';
import 'package:restoe/widgets/info_image_appbar.dart';
import 'package:restoe/widgets/info_item_detail.dart';
import 'package:restoe/widgets/info_item_subtitle.dart';
import 'package:restoe/widgets/info_item_title.dart';
import 'package:restoe/widgets/list_menu.dart';

class RestoDetailPage extends StatefulWidget {
  static const routeName = '/resto_detail';

  final String id;

  const RestoDetailPage({@required this.id});

  @override
  _RestoDetailPageState createState() => _RestoDetailPageState();
}

class _RestoDetailPageState extends State<RestoDetailPage> {
  Future<RestoDetailResult> _result;

  @override
  void initState() {
    _result = ApiServices().detailRestaurant(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildDetail(context),
    );
  }

  Widget _buildDetail(BuildContext context) {
    return FutureBuilder(
      future: _result,
      builder: (context, AsyncSnapshot<RestoDetailResult> snapshot) {
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
              return NestedScrollView(
                headerSliverBuilder: (context, isScrolled) {
                  return [
                    InfoImageAppbar(
                      restaurant: snapshot.data.restaurant,
                    )
                  ];
                },
                body: Container(
                  margin: EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        InfoItemDetail(
                          icon: Icon(Icons.location_on),
                          name: snapshot.data.restaurant.city ?? "",
                        ),
                        InfoItemDetail(
                          icon: Icon(Icons.location_on),
                          name:
                              snapshot.data.restaurant.rating.toString() ?? "",
                        ),
                        InfoItemTitle(
                          title: "Description",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            snapshot.data.restaurant.description ?? "",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        InfoItemTitle(
                          title: "Menus",
                        ),
                        InfoItemSubtitle(
                          title: "Foods",
                        ),
                        _buildListMenu(true, snapshot.data.restaurant.menus,
                            'assets/images/foods.png'),
                        InfoItemSubtitle(
                          title: "Drinks",
                        ),
                        _buildListMenu(false, snapshot.data.restaurant.menus,
                            'assets/images/drinks.png'),
                      ],
                    ),
                  ),
                ),
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

  Widget _buildListMenu(bool isFood, Menus menus, String imgAssets) {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: isFood ? menus.foods.length : menus.drinks.length,
        itemBuilder: (context, index) {
          return ListMenu(
              name: isFood ? menus.foods[index].name : menus.drinks[index].name,
              imageAsset: imgAssets);
        },
      ),
    );
  }
}
