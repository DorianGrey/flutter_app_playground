import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter_app_playground/helpers/drawer.dart';
import 'package:flutter_app_playground/i18n/app_localizations.dart';

class ManualCategory {
  final int quote;
  final String displayText;

  ManualCategory(this.quote, this.displayText);
}

class PieChartPage extends StatelessWidget {
  static const ROUTE_NAME = '/pieChart';

  List<charts.Series<ManualCategory, int>> _getSampleSeries() {
    final data = [
      ManualCategory(100, 'Requires manual,\nbut has none'),
      ManualCategory(
          75, 'Has manual starting with\n "How to read this manual..."'),
      ManualCategory(25, 'Requires\nmanual'),
      ManualCategory(5, 'Requires no manual'),
    ];

    return [
      new charts.Series<ManualCategory, int>(
        id: 'Sales',
        domainFn: (ManualCategory sales, _) => sales.quote,
        measureFn: (ManualCategory sales, _) => sales.quote,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (ManualCategory row, _) => row.displayText,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(AppLocalizations.of(context).pieChartLink),
        ),
        drawer: createDefaultAppDrawer(context, PieChartPage.ROUTE_NAME),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(AppLocalizations.of(context).pieChartHeader, style: TextStyle(fontSize: 24),),
            ),
            Expanded(
              flex: 20,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 5.0),
                child: charts.PieChart(_getSampleSeries(),
                    animate: true,
                    defaultRenderer: new charts.ArcRendererConfig(
                        //arcWidth: 10,
                        arcRendererDecorators: [
                          new charts.ArcLabelDecorator()
                        ])),
              ),
            )
          ],
        ));
  }
}
