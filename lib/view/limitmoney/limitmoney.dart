import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawshly/main.dart';
import 'package:hawshly/view/categores/categorises.dart';

import '../../constant/const_var.dart';
import '../../model/text_field/text_field.dart';

class LimitMoneyPage extends StatefulWidget {
  const LimitMoneyPage({super.key});

  @override
  State<LimitMoneyPage> createState() => _LimitMoneyPageState();
}

class _LimitMoneyPageState extends State<LimitMoneyPage> {
  TextEditingController moneyLimitControllar = TextEditingController();
  TextEditingController dateControllar = TextEditingController();
  TextEditingController infoControllar = TextEditingController();
  GlobalKey<FormState> addLimitTrans = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Form(
              key: addLimitTrans,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
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
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        textFromFieldcustom(
                            colorbackground:
                                const Color.fromARGB(170, 76, 175, 79),
                            bordercolor: Colors.lightGreen,
                            keyboardType: TextInputType.number,
                            onTap: () {},
                            // prefixIcon: const Icon(Icons.money),
                            controller: moneyLimitControllar,
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
                    const Text(
                      "الغرض من المعاملة",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(10),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Get.to(Categories());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(135, 77, 77, 77),
                              borderRadius: BorderRadius.circular(15)),
                          margin: const EdgeInsets.all(5),
                          width: MediaQuery.sizeOf(context).width - 60,
                          height: 60,
                          child: Center(
                              // child: DropdownButton<String>(

                              //   // menuMaxHeight: MediaQuery.sizeOf(context).height / 2,
                              //   value: dropdownValue,
                              //   icon: const Icon(
                              //     Icons.arrow_downward,
                              //     size: 22,
                              //   ),
                              //   // elevation: 40,
                              //   style: GoogleFonts.alexandria(
                              //       color: Colors.black,
                              //       fontWeight: FontWeight.bold),
                              //   underline: Container(
                              //     color: Colors.white,
                              //   ),
                              //   onChanged: (String? value) {
                              //     // This is called when the user selects an item.
                              //     setState(() {
                              //       dropdownValue = value!;
                              //     });
                              //   },
                              //   items: list
                              //       .map<DropdownMenuItem<String>>((String value) {
                              //     return DropdownMenuItem<String>(
                              //       alignment: AlignmentDirectional.centerEnd,
                              //       value: value,
                              //       child: Text(value),
                              //     );
                              //   }).toList(),
                              // ),
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
                        length: true,
                        maxLines: 3,
                        colorbackground: const Color.fromARGB(170, 76, 175, 79),
                        bordercolor: Colors.lightGreen,
                        keyboardType: TextInputType.number,
                        onTap: () {},
                        // prefixIcon: const Icon(Icons.money),
                        controller: infoControllar,
                        text: "ملاحظات",
                        width: MediaQuery.sizeOf(context).width - 100),
                    const Gap(15),
                    textFromFieldcustom(
                        onTap: () async {
                          final dateTime = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2017),
                            lastDate: DateTime(2025),
                            initialDate: DateTime.now(),
                          );
                          print(
                              "+++++++++++++++++++++++++++++++++++++++++++++++++++");
                          setState(() {
                            dateControllar.text = dateTime!.toString();
                          });
                        },
                        controller: dateControllar,
                        text: "التاريخ",
                        width: MediaQuery.sizeOf(context).width - 100),
                    const Gap(80),
                    Container(
                      height: 60,
                      width: MediaQuery.sizeOf(context).width - 120,
                      decoration: BoxDecoration(
                          color: Colors.cyan[700],
                          borderRadius: BorderRadius.circular(15)),
                      child: MaterialButton(
                        onPressed: () async {
                          if (addLimitTrans.currentState!.validate()) {
                            // Get.defaultDialog(
                            //     content: Row(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         const Text("   جنية  "),
                            //         Text(moneyLimitControllar.text),
                            //       ],
                            //     ),
                            //     title: "اقصي مبلغ للصرف ( $dropdownValue )",
                            //     actions: []);
                            await myBox!
                                .put(dropdownValue, moneyLimitControllar.text);
                            var value1 = myBox!.get(dropdownValue);

                            print(value1);
                          }
                        },
                        child: Text(
                          "اضافة معاملة",
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
      ),
    );
  }
}
