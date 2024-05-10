import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FoodPage extends StatelessWidget {
  final person;
  const FoodPage({super.key, this.person});

  @override
  Widget build(BuildContext context) {
    final breakfastone = (person * 7);
    final lunchone = (person * 17);
    final dinnerone = (person * 20);
    final breakfastMonth = (person * 7 * 30);
    final lunchMonth = (person * 17 * 30);
    final dinnerMonth = (person * 20 * 30);
    final additional = (person * 7 * 30);
    final total = breakfastMonth + lunchMonth + dinnerMonth;
    print(person);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "خطة الوجبات",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "عدد الافراد : ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    person.toString(),
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[800]),
                  ),
                ],
              ),
              const Gap(15),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    const Text(
                      "حساب اليوم الواحد",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 36, 90)),
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        const Text(
                          " الفطار : ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          breakfastone.toString(),
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 78, 69)),
                        ),
                      ],
                    ),
                    const Gap(15),
                    Row(
                      children: [
                        const Text(
                          " الغداء : ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          lunchone.toString(),
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 78, 69)),
                        ),
                      ],
                    ),
                    const Gap(15),
                    Row(
                      children: [
                        const Text(
                          " العشاء : ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          dinnerone.toString(),
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 78, 69)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(20),
              const Text(
                textAlign: TextAlign.center,
                "اجمالي المصروف طول الشهر\n  للوجبات الاساسية",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              Text(
                total.toString(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Gap(20),
              Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    const Text(
                      "الوجبات المقترحة لاحتياجاتك الشهرية",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 36, 90)),
                    ),
                    const Gap(20),
                    const Text(
                      " الفطار : ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "الفول والطعمية - الجبنة - البيض - العسل",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900]),
                    ),
                    const Gap(15),
                    const Text(
                      " الغداء : ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "كشري - بامية - بسلة - الملوخية",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900]),
                    ),
                    const Gap(15),
                    const Text(
                      " العشاء : ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "شاورما - الكباب - المحشي - مشوي - مهلبية",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900]),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Text(
                      "يمكنك اضافة مبلغ $additional للوجبات السريعة والمطاعم",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[900]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
