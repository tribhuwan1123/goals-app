import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/dashboard/dashboard.dart';

class PaymentChartScreen extends StatefulWidget {
  final List<PaymentCharts>? paymentCharts;

  PaymentChartScreen(this.paymentCharts, {super.key});

  @override
  State<PaymentChartScreen> createState() => _PaymentChartScreenState();
}

class _PaymentChartScreenState extends State<PaymentChartScreen> {
  var months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "July",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          //Initialize the spark charts widget
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            borderColor: Colors.white,
            borderWidth: 2.0,
            title: ChartTitle(
                text: "Payment Chart",
                textStyle: TextStyle(color: Colors.white)),
            enableAxisAnimation: true,
            series: [
              StackedColumnSeries(
                dataSource: widget.paymentCharts!,
                color: Colors.black,
                trackColor: Colors.white70,
                xValueMapper: (PaymentCharts? paymentChart, _) =>
                    months[paymentChart!.m! - 1],
                yValueMapper: (PaymentCharts? paymentChart, _) =>
                    paymentChart!.s!.toInt(),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
