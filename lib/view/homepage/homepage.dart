import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawshly/model/home_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 43, 43, 43),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(30),
                cardHomepage(context,
                    price: balanceHome,
                    title: "الرصيد الاجمالي",
                    colortext: const Color.fromARGB(255, 1, 46, 130),
                    colorBack: const Color.fromARGB(255, 100, 151, 246)),
                const Gap(15),
                cardHomepage(context,
                    price: valueCarancy,
                    title: "اجمالي السحب",
                    colortext: const Color.fromARGB(159, 133, 0, 42),
                    colorBack: const Color.fromARGB(160, 246, 100, 146)),
                const Gap(15),
                cardHomepage(context,
                    price: valueCarancy,
                    title: "الرصيد الباقي",
                    colortext: const Color.fromARGB(197, 0, 121, 16),
                    colorBack: const Color.fromARGB(198, 100, 246, 120)),
                const Gap(15),
                const Text(
                  "اخر المعاملات",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: transation.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 65,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$ ${transation[index]["pricetrans"]}",
                            style: const TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 0, 216, 25),
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                transation[index]["title"],
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Image.asset(
                                  transation[index]["icon"],
                                  height: 40,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(208, 0, 85, 76),
                      borderRadius: BorderRadius.circular(25)),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "الكل",
                          style: GoogleFonts.alexandria(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const Icon(
                          Icons.arrow_downward_rounded,
                          color: Colors.white,
                          weight: 20,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container cardHomepage(BuildContext context,
      {required double price,
      required String title,
      required Color colorBack,
      required Color colortext}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.sizeOf(context).width - 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          color: colorBack,
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18, color: colortext, fontWeight: FontWeight.bold),
        ),
        const Gap(18),
        Text(
          "\$ $price",
          style: TextStyle(
              fontSize: 22, color: colortext, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}

List transation = [
  {
    "title": "بنزين",
    "icon": "assets/images/fuel.png",
    "pricetrans": "500",
  },
  {
    "title": "مطاعم",
    "icon": "assets/images/burger.png",
    "pricetrans": "2000",
  },
  {
    "title": "مقاهي",
    "icon": "assets/images/latte.png",
    "pricetrans": "500",
  },
  {
    "title": "فواتير",
    "icon": "assets/images/invoice.png",
    "pricetrans": "2000",
  },
];
