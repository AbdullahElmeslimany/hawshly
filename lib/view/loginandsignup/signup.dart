import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hawshly/model/text_field/text_field.dart';
import 'package:hawshly/view/loginandsignup/loginpage.dart';

import '../app_bar_buttom/bar_buttom_app.dart';

class SignPage extends StatelessWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();
    GlobalKey<FormState> signKey = GlobalKey<FormState>();

    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/bag.png", width: 110, height: 110),
              const Gap(30),
              Form(
                key: signKey,
                child: Container(
                  width: MediaQuery.sizeOf(context).width - 25,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      textFromFieldcustom(
                          onTap: () {},
                          hight: 18,
                          rtl: true,
                          controller: nameController,
                          text: "اسم المستخدم",
                          width: MediaQuery.sizeOf(context).width - 50),
                      const Gap(10),
                      textFromFieldcustom(
                          onTap: () {},
                          hight: 18,
                          rtl: true,
                          controller: emailController,
                          text: "البريد الالكتروني",
                          width: MediaQuery.sizeOf(context).width - 50),
                      const Gap(10),
                      textFromFieldcustom(
                          onTap: () {},
                          hight: 18,
                          controller: passController,
                          text: "كلمة المرور",
                          width: MediaQuery.sizeOf(context).width - 50),
                      const Gap(10),
                      textFromFieldcustom(
                          onTap: () {},
                          hight: 18,
                          controller: confirmPassController,
                          text: "تأكيد كلمة المرور",
                          width: MediaQuery.sizeOf(context).width - 50),
                    ],
                  ),
                ),
              ),
              const Gap(15),
              Row(
                children: [
                  Text(
                    " لديك حساب : ",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAll(const LoginPage());
                    },
                    child: Text(
                      "تسجيل الدخول",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.blue.shade800,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const Gap(15),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(229, 0, 110, 99),
                    borderRadius: BorderRadius.circular(15)),
                child: MaterialButton(
                  onPressed: () {
                    if (signKey.currentState!.validate()) {
                      Get.to(const ButtonBarC());
                    }
                  },
                  child: const Text(
                    "انشاء حساب",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      height: 10,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "OR Sgin in with",
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      height: 10,
                    ),
                  ),
                ],
              ),
              const Gap(20),
              SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Image.asset(
                        "assets/images/apple.png",
                        height: 40,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Image.asset(
                        "assets/images/facebook.png",
                        height: 40,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Image.asset(
                        "assets/images/google.png",
                        height: 40,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
