import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawshly/model/text_field/text_field.dart';

import '../../constant/const_var.dart';

class AddExpensesPage extends StatefulWidget {
  const AddExpensesPage({super.key});

  @override
  State<AddExpensesPage> createState() => _AddExpensesPageState();
}

class _AddExpensesPageState extends State<AddExpensesPage> {
  TextEditingController dateControllar = TextEditingController();
  TextEditingController noteControllar = TextEditingController(text: " ");
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
                  Text(
                    "اضف معاملة",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan[700]),
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      textFromFieldcustom(
                          onTap: () {},
                          prefixIcon: const Icon(Icons.money),
                          controller: moneyControllar,
                          text: "المبلغ",
                          width: MediaQuery.sizeOf(context).width - 100),
                      const Text(
                        "جنيه",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Text(
                        "الغرض من المعاملة",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(59, 208, 208, 208),
                          borderRadius: BorderRadius.circular(15)),
                      margin: const EdgeInsets.all(5),
                      width: MediaQuery.sizeOf(context).width - 60,
                      child: Center(
                        child: DropdownButton<String>(
                          // menuMaxHeight: MediaQuery.sizeOf(context).height / 2,
                          value: dropdownValue,
                          icon: const Icon(
                            Icons.arrow_downward,
                            size: 22,
                          ),
                          // elevation: 40,
                          style: const TextStyle(color: Colors.black),
                          underline: Container(
                            color: Colors.white,
                          ),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  const Gap(10),
                  textFromFieldcustom(
                      onTap: () {},
                      prefixIcon: const Icon(Icons.note),
                      controller: noteControllar,
                      text: "ملاحظات",
                      maxLines: 2,
                      length: true,
                      width: MediaQuery.sizeOf(context).width - 30),
                  textFromFieldcustom(
                      onTap: () async {
                        DateTime? picker = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2010),
                            lastDate: DateTime(2025),
                            initialDate: DateTime.now());
                        if (picker != null) {
                          setState(() {
                            dateControllar.text =
                                picker.toString().split(" ")[0];
                          });
                        }
                      },
                      readOnly: true,
                      prefixIcon: const Icon(Icons.date_range_outlined),
                      controller: dateControllar,
                      text: "التاريخ",
                      width: MediaQuery.sizeOf(context).width - 100),
                  Gap(MediaQuery.sizeOf(context).height / 5.5),
                  Container(
                    height: 60,
                    width: MediaQuery.sizeOf(context).width - 120,
                    decoration: BoxDecoration(
                        color: Colors.cyan[700],
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
                        "اضف معاملة",
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
