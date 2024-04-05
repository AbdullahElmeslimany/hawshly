import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hawshly/model/text_field/text_field.dart';
import 'package:hawshly/view/loginandsignup/signup.dart';
import '../app_bar_buttom/bar_buttom_app.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    GlobalKey<FormState> loginKey = GlobalKey<FormState>();
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/Vector.png"))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logoIcon.png",
                  width: 260, height: 190),
              const Gap(30),
              Form(
                key: loginKey,
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
                    ],
                  ),
                ),
              ),
              const Gap(15),
              Row(
                children: [
                  Text(
                    "ليس لديك حساب : ",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAll(const SignPage());
                    },
                    child: Text(
                      "سجل الان",
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
                    if (loginKey.currentState!.validate()) {
                      Get.to(const ButtonBarC());
                    }
                  },
                  child: const Text(
                    "تسجيل الدخول",
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
