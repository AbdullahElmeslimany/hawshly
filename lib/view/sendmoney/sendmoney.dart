import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hawshly/constant/const_var.dart';
import 'package:hawshly/model/send_controller.dart';
import 'package:hawshly/view/sendmoney/helper_send_money/cardfromAccount.dart';

class SendAndRequestPage extends StatefulWidget {
  final namepage;
  const SendAndRequestPage({super.key, this.namepage = "ارسال"});

  @override
  State<SendAndRequestPage> createState() => _SendAndRequestPageState();
}

class _SendAndRequestPageState extends State<SendAndRequestPage> {
  @override
  Widget build(BuildContext context) {
    String nameSendMony = "احمد علي";
    String iDSendMony = "252012232";
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "${widget.namepage} النقود",
                    style: const TextStyle(fontSize: 22),
                  ),
                )),
                cardFromAccount(
                    width: MediaQuery.sizeOf(context).width - 5,
                    nameSendMony: nameSendMony,
                    iDSendMony: iDSendMony),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "الي",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Form(
                  key: formKeyProssing,
                  child: Center(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(25)),
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: const Text("رقم حساب")),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              controller: idSendController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.perm_identity),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                labelText: "ID Person",
                              ),
                              textAlign: TextAlign.end,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'يرجي ادخال ID الخاص بالمرسل اليه';
                                }
                                return null;
                              },
                            ),
                          ),
                          const Gap(17),
                          Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: const Text("المبلغ")),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              controller: moneyValueSendController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.attach_money_rounded),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                labelText: "المبلغ",
                              ),
                              textAlign: TextAlign.end,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'يرجي ادخال المبلغ';
                                }
                                return null;
                              },
                            ),
                          ),
                          const Gap(20),
                          Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: const Text("سبب التحويل")),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              margin: const EdgeInsets.all(5),
                              width: 200,
                              child: Center(
                                child: DropdownButton<String>(
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
                                    print(value);
                                  },
                                  items: list.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 70),
              width: MediaQuery.sizeOf(context).width - 30,
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(20)),
              child: MaterialButton(
                onPressed: () {
                  // if (formKeyProssing.currentState!.validate()) {
                  //   if (widget.namepage == "طلب") {
                  //     idSendController.clear();
                  //     moneyValueSendController.clear();
                  //     Get.back();
                  //   } else {
                  //     Get.to(OTPPage(
                  //       id: idSendController.text,
                  //       type: widget.namepage,
                  //       value: moneyValueSendController.text,
                  //     ));
                  //   }
                  // }
                },
                child: const Center(
                  child: Text(
                    "تنفيذ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
