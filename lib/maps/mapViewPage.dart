import 'package:flutter/material.dart';
import 'package:flutter_app_playground/helpers/drawer.dart';
import 'package:flutter_app_playground/i18n/app_localizations.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapViewPage extends StatelessWidget {
  MapViewPage({Key key}) : super(key: key);

  static const ROUTE_NAME = 'maps';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(AppLocalizations.of(context).mapViewLink),
        ),
        drawer: createDefaultAppDrawer(context, MapViewPage.ROUTE_NAME),
        body: Column(
          children: <Widget>[
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(53.5586941, 9.78774),
                  zoom: 13.0,
                ),
                layers: [
                  TileLayerOptions(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c']),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(53.5586941, 9.787749),
                        builder: (ctx) => Container(
                              child: FlutterLogo(colors: Colors.amber),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
