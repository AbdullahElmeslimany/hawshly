import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../controller/bloc/balance_cubit/get_balance_data_cubit.dart';

class ChartPage extends StatelessWidget {
  final id;
  final data;
  const ChartPage({super.key, this.data, this.id});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<GetBalanceDataCubit>(context);
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
                            itemCard(
                                title: "الرصيد الاجمالي",
                                number: cubit.data[0]["balance"]),
                            itemCard(
                                title: "الديون المدفوعة",
                                number: 0,
                                minus: true),
                          ],
                        ),
                        const Gap(15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            itemCard(
                                title: "المصاريف",
                                number: -cubit.data[0]["withdrawal"],
                                minus: true),
                            itemCard(title: "الديون المستلمة", number: 0),
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
                              SalesData('Jan', 100),
                              SalesData('Feb', 200),
                              SalesData('Mar', 500),
                              SalesData('Apr', 300),
                              SalesData('May', 120),
                              SalesData('Jun', 420)
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
                        SalesData('Feb', 0),
                        SalesData('Mar', 50000),
                        SalesData('Apr', 50000),
                        SalesData('Jun', 0),
                        SalesData('May', 50000),
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
    bool minus = false,
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
          width: 100,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green[300]),
          child: Center(
            child: Text(
              number.toString(),
              style: TextStyle(
                  fontSize: 16,
                  color: minus == false ? Colors.white : Colors.red,
                  fontWeight: FontWeight.bold),
            ),
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
