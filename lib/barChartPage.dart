import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter_app_playground/helpers/drawer.dart';
import 'package:flutter_app_playground/i18n/app_localizations.dart';

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

class BarChartPage extends StatelessWidget {
  BarChartPage({Key key}) : super(key: key);

  static const ROUTE_NAME = '/barChart';

  final sampleData = [
    OrdinalSales('2014', 5),
    OrdinalSales('2015', 25),
    OrdinalSales('2016', 100),
    OrdinalSales('2017', 75),
  ];

  _getSampleSeries() {
    return [
      charts.Series<OrdinalSales, String>(
          id: 'Sample',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (sales, _) => sales.year, // x-axis
          measureFn: (sales, _) => sales.sales, // y-axis
          data: sampleData)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(AppLocalizations.of(context).barChartLink),
        ),
        drawer: createDefaultAppDrawer(context, BarChartPage.ROUTE_NAME),
        body: Center(
          // Note: Adjusting does not seem to work with a Column()
          // container. However: We need to add some padding around.
          // Might have something to do with https://github.com/google/charts/issues/129
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 5.0),
            child: charts.BarChart(
              _getSampleSeries(),
              animate: true,
            ),
          ),
        ));
  }
}
