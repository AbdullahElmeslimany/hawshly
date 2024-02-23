import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hawshly/model/send_controller.dart';
import 'package:hawshly/view/homepage/homepage.dart';

class OTPPage extends StatelessWidget {
  final value;
  final type;
  final id;
  const OTPPage({super.key, this.value, this.type, this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 180, 180, 180),
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
                padding: const EdgeInsets.only(top: 20, right: 13),
                height: 100,
                width: MediaQuery.sizeOf(context).width - 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "لتاكيد تحويل مبلغ :  $value",
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    const Gap(5),
                    Text(
                      "الي : $id",
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width - 50,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                margin: const EdgeInsets.only(top: 65),
                child: Center(
                  child: OtpTextField(
                    obscureText: true,
                    cursorColor: Colors.white,
                    fillColor: Colors.white,
                    focusedBorderColor: Colors.red,
                    numberOfFields: 6,
                    borderColor: Colors.white,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) {
                      if (verificationCode == "123321") {
                        idSendController.clear();
                        moneyValueSendController.clear();
                        Get.back();
                        Get.back();
                        
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                title: Text("خطاء"),
                                content: Text('الرقم السري خطاء'),
                              );
                            });
                      }
                    }, // end onSubmit
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
