import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawshly/controller/bloc/cubit/change_value_cubit.dart';
import 'package:hawshly/model/text_field/text_field.dart';
import '../../constant/const_var.dart';
import '../../controller/add expection/add_expation.dart';

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
    final cubitValue = BlocProvider.of<ChangeValueCubit>(context);
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
                              cubitValue.calculation(
                                  value: int.parse(moneyControllar.text),
                                  typeMonth: value);
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
                    child: Column(
                      children: [
                        const Text(
                          "الخطة المقترحة",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 231, 207, 207),
                        ),
                        const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              premiumValue,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              moneyControllar.text,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 0, 170, 153)),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "كل شهر",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            BlocBuilder<ChangeValueCubit, ChangeValueState>(
                              builder: (context, state) {
                                if (state is SuccessChangeState) {
                                  return Text(
                                    state.value.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 0, 170, 153)),
                                  );
                                }
                                return Text(
                                  cubitValue.valuePrice.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 0, 170, 153)),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const Gap(10),
                  // const Text(
                  //   "المدة المتبقية",
                  //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  // ),
                  // const Gap(10),
                  // Container(
                  //   margin: const EdgeInsets.symmetric(horizontal: 30),
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 30, vertical: 15),
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.grey),
                  //       borderRadius: BorderRadius.circular(15)),
                  //   child: const Column(
                  //     children: [
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             "8 شهور",
                  //             style: TextStyle(
                  //                 fontWeight: FontWeight.bold, fontSize: 16),
                  //           ),
                  //           Text(
                  //             "0.00",
                  //             style: TextStyle(
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 20,
                  //                 color: Color.fromARGB(255, 243, 31, 31)),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
                          AddExpation.addReport(
                              id: widget.id,
                              money: moneyControllar.text,
                              reason: noteControllar.text,
                              period: premiumValue,
                              onePeriod: cubitValue.valuePrice,
                              totalComplete: 0);
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
