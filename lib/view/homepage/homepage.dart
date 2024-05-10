import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawshly/view/food/food.dart';
import '../../controller/bloc/balance_cubit/get_balance_data_cubit.dart';
import '../../controller/bloc/trans_cubit/trans_cubit.dart';

class MyHomePage extends StatelessWidget {
  final id;
  final data;
  const MyHomePage({super.key, this.data, this.id});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<GetBalanceDataCubit>(context);
    final cubitTrans = BlocProvider.of<TransCubit>(context);
    cubit.getBalanceData(id: id);
    cubitTrans.getData(id: id);
    // print(data[0]["balance"]);

    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 43, 43, 43),
      body: BlocBuilder<GetBalanceDataCubit, GetBalanceDataState>(
        builder: (context, state) {
          if (state is GetBalanceDataSucess) {
            return SafeArea(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Gap(30),
                      cardHomepage(context,
                          price: cubit.data[0]["balance"],
                          title: "الرصيد الاجمالي",
                          colortext: const Color.fromARGB(255, 1, 46, 130),
                          colorBack: const Color.fromARGB(255, 100, 151, 246)),
                      const Gap(15),
                      cardHomepage(context,
                          price: cubit.data[0]["withdrawal"],
                          title: "اجمالي السحب",
                          colortext: const Color.fromARGB(159, 133, 0, 42),
                          colorBack: const Color.fromARGB(160, 246, 100, 146)),
                      const Gap(15),
                      cardHomepage(context,
                          price: cubit.data[0]["remainbalance"],
                          title: "الرصيد الباقي",
                          colortext: const Color.fromARGB(197, 0, 121, 16),
                          colorBack: const Color.fromARGB(198, 100, 246, 120)),
                      cubit.data[0]["remainbalance"] <= 10000
                          ? Text(
                              "الرصيد الباقي قليل لن يكفيك لبقية الشهر",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[700]),
                            )
                          : Container(),
                      const Gap(15),
                      InkWell(
                        onTap: () {
                          print(data[0].id);
                          Get.to(FoodPage(
                            person: int.parse(cubit.data[0]["person"]),
                          ));
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width - 45,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/meal.png",
                                height: 50,
                              ),
                              const Text(
                                "خطة الوجبات",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(15),
                      const Text(
                        "اخر المعاملات",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      BlocBuilder<TransCubit, TransState>(
                        builder: (context, state) {
                          if (state is SuccessGetDataState) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: cubitTrans.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: 65,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$ ${cubitTrans.data[index]["money"]}",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color:
                                                Color.fromARGB(255, 0, 216, 25),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            cubitTrans.data[index]["reason"],
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          // Padding(
                                          //   padding:
                                          //       const EdgeInsets.only(left: 20.0),
                                          //   child: Image.asset(
                                          //     transation[index]["icon"],
                                          //     height: 40,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                          return const Center(
                              child: CircularProgressIndicator());
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
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Container cardHomepage(BuildContext context,
      {required price,
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
