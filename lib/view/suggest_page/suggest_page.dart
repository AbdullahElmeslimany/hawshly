import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/add expection/add_expation.dart';

class SuggestPage extends StatelessWidget {
  final id;
  const SuggestPage({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: suggestList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        flex: 5,
                        child: Image.asset(
                          suggestList[index]["image"],
                          height: 150,
                          fit: BoxFit.fitHeight,
                        )),
                    Expanded(
                      flex: 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            suggestList[index]["title"],
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const Gap(15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "${suggestList[index]["price"]}",
                                style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.red,
                                    decorationStyle: TextDecorationStyle.wavy,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              Text(
                                "${suggestList[index]["priceSale"]}",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Gap(15),
                          Text(
                            "% خصم ${suggestList[index]["sale"]}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const Gap(25),
                          Container(
                            height: 55,
                            width: 110,
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(35)),
                            child: MaterialButton(
                              onPressed: () {
                                AddExpation.addReport(
                                    id: id,
                                    money: suggestList[index]["priceSale"],
                                    reason: suggestList[index]["title"],
                                    period: "12 شهور",
                                    onePeriod: suggestList[index]
                                        ["Installment"],
                                    totalComplete: 0);
                                Get.defaultDialog(
                                    title: "تم شراء",
                                    content: Column(
                                      children: [
                                        Text(
                                          suggestList[index]["title"],
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Gap(5),
                                        const Text(
                                          "بمبلغ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Gap(10),
                                        Text(
                                          suggestList[index]["priceSale"]
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.teal),
                                        ),
                                        const Gap(10),
                                        Text(
                                            "القسط الشهري ${suggestList[index]["Installment"]} لمدة سنة",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red))
                                      ],
                                    ));
                              },
                              child: Text(
                                "شراء",
                                style: GoogleFonts.alexandria(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

List suggestList = [
  {
    "title": "iphone 15 pro max",
    "price": 50000,
    "priceSale": 42500,
    "Installment": 3540,
    "sale": "15",
    "image": "assets/images/iphone.png",
  },
  {
    "title": "Range Rover",
    "price": 7200000,
    "priceSale": 5760000,
    "Installment": 480000,
    "sale": "20",
    "image": "assets/images/car1.png",
  },
  {
    "title": "Al Baik",
    "price": 500,
    "priceSale": 400,
    "Installment": 33,
    "sale": "20",
    "image": "assets/images/food.png",
  },
  {
    "title": "Hyundai Tucson",
    "price": 2000000,
    "priceSale": 1800000,
    "Installment": 150000,
    "sale": "10",
    "image": "assets/images/car2.png",
  },
];
