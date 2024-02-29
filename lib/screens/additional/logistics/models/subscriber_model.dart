import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:senim/constants/sm_colors.dart';

class SubscriberSeries {
  final String year;
  final int subscribers;
  final charts.Color barColor;

  SubscriberSeries({
    required this.year,
    required this.subscribers,
    required this.barColor,
  });

  static final data = [
    SubscriberSeries(
      year: "2008",
      subscribers: 10000000,
      barColor: charts.ColorUtil.fromDartColor(SMColors.primary.shade500),
    ),
    SubscriberSeries(
      year: "2009",
      subscribers: 11000000,
      barColor: charts.ColorUtil.fromDartColor(SMColors.primary.shade500),
    ),
    SubscriberSeries(
      year: "2010",
      subscribers: 12000000,
      barColor: charts.ColorUtil.fromDartColor(SMColors.primary.shade500),
    ),
    SubscriberSeries(
      year: "2011",
      subscribers: 10000000,
      barColor: charts.ColorUtil.fromDartColor(SMColors.primary.shade500),
    ),
    SubscriberSeries(
      year: "2012",
      subscribers: 8500000,
      barColor: charts.ColorUtil.fromDartColor(SMColors.primary.shade500),
    ),
    SubscriberSeries(
      year: "2013",
      subscribers: 7700000,
      barColor: charts.ColorUtil.fromDartColor(SMColors.primary.shade500),
    ),
    SubscriberSeries(
      year: "2014",
      subscribers: 7600000,
      barColor: charts.ColorUtil.fromDartColor(SMColors.primary.shade500),
    ),
    SubscriberSeries(
      year: "2015",
      subscribers: 5500000,
      barColor: charts.ColorUtil.fromDartColor(SMColors.primary.shade500),
    ),
  ];

  static List<charts.Series<SubscriberSeries, String>> series = [
    charts.Series(
      id: "Subscribers",
      data: data,
      domainFn: (SubscriberSeries series, _) => series.year,
      measureFn: (SubscriberSeries series, _) => series.subscribers,
      colorFn: (SubscriberSeries series, _) => series.barColor,
    )
  ];
}
