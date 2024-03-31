import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(77, 196, 196, 196)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            itemCard(title: "الرصيد الاجمالي", number: 50000),
                            itemCard(title: "الديون المدفوعة", number: 0),
                          ],
                        ),
                        const Gap(15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            itemCard(title: "الرصيد الاجمالي", number: -50000),
                            itemCard(title: "الرصيد الاجمالي", number: 0),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SfCartesianChart(
                      // Initialize category axis
                      primaryXAxis: const CategoryAxis(),
                      series: <LineSeries<SalesData, String>>[
                        LineSeries<SalesData, String>(
                            // Bind data source
                            dataSource: <SalesData>[
                              SalesData('Jan', 0),
                              SalesData('Feb', 0),
                              SalesData('Mar', 50000),
                              SalesData('Apr', 0),
                              SalesData('May', 0)
                            ],
                            xValueMapper: (SalesData sales, _) => sales.year,
                            yValueMapper: (SalesData sales, _) => sales.sales)
                      ]),
                ),
                Expanded(
                    child: SfCartesianChart(series: <CartesianSeries>[
                  HistogramSeries<SalesData, num>(
                      dataSource: <SalesData>[
                        SalesData('Jan', 50000),
                        SalesData('Feb', 50000),
                        SalesData('Mar', 0),
                        SalesData('Apr', 50000),
                        SalesData('May', 50000)
                      ],
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      binInterval: 20,
                      showNormalDistributionCurve: true,
                      curveColor: const Color.fromRGBO(192, 108, 132, 1),
                      borderWidth: 3),
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column itemCard({
    required String title,
    required int number,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const Gap(7),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green[300]),
          child: Text(
            number.toString(),
            style: const TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
