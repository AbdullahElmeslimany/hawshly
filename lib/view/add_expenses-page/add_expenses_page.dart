import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawshly/controller/bloc/balance_cubit/get_balance_data_cubit.dart';
import 'package:hawshly/model/text_field/text_field.dart';
import '../../constant/const_var.dart';

class AddExpensesPage extends StatefulWidget {
  final id;
  const AddExpensesPage({super.key, this.id});

  @override
  State<AddExpensesPage> createState() => _AddExpensesPageState();
}

class _AddExpensesPageState extends State<AddExpensesPage> {
  TextEditingController dateControllar = TextEditingController();
  TextEditingController noteControllar = TextEditingController();
  TextEditingController moneyControllar = TextEditingController();
  GlobalKey<FormState> addTrans = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Form(
              key: addTrans,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(20),
                  const Gap(20),
                  textFromFieldcustom(
                      hight: 1,
                      keyboardType: TextInputType.number,
                      onTap: () {},
                      // prefixIcon: const Icon(Icons.money),
                      controller: moneyControllar,
                      text: "المبلغ الكلي",
                      width: MediaQuery.sizeOf(context).width - 100),
                  const Gap(10),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  const Gap(10),
                  Center(
                    child: Container(
                      height: 65,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 139, 126),
                          borderRadius: BorderRadius.circular(15)),
                      margin: const EdgeInsets.all(5),
                      width: MediaQuery.sizeOf(context).width - 60,
                      child: Center(
                        child: DropdownButton<String>(
                          // menuMaxHeight: MediaQuery.sizeOf(context).height / 2,
                          value: premiumValue,
                          icon: const Icon(
                            Icons.arrow_downward,
                            size: 22,
                            color: Colors.black,
                          ),
                          // elevation: 40,
                          style: GoogleFonts.alexandria(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          underline: Container(
                            color: Colors.white,
                          ),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              premiumValue = value!;
                            });
                          },
                          items: premium
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              alignment: AlignmentDirectional.centerEnd,
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  const Gap(5),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  const Gap(5),
                  textFromFieldcustom(
                      onTap: () {},
                      // prefixIcon: const Icon(Icons.note),
                      controller: noteControllar,
                      text: "سبب الشراء",
                      maxLines: 2,
                      length: true,
                      width: MediaQuery.sizeOf(context).width - 70),
                  const Text(
                    "مدة سداد القسط",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(15),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "6 شهور",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "0.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 0, 170, 153)),
                            ),
                          ],
                        ),
                        Divider(
                          color: Color.fromARGB(255, 231, 207, 207),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "سنة",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "0.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 0, 170, 153)),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "24 شهور",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "0.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 0, 170, 153)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  const Text(
                    "المدة المتبقية",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Gap(10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "8 شهور",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "0.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 243, 31, 31)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  Container(
                    height: 60,
                    width: MediaQuery.sizeOf(context).width / 3,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 103, 114),
                        borderRadius: BorderRadius.circular(15)),
                    child: MaterialButton(
                      onPressed: () {
                        if (addTrans.currentState!.validate()) {
                          Get.defaultDialog(actions: [
                            Text(
                                "${dateControllar.text} ${noteControllar.text} ${moneyControllar.text} $dropdownValue")
                          ]);
                        }
                      },
                      child: Text(
                        "اضافة",
                        style: GoogleFonts.alexandria(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
