import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hawshly/view/testd/testaa.dart';

class ButtonTreeSAR extends StatelessWidget {
  const ButtonTreeSAR({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            MaterialButton(
              onPressed: () {
                // Get.to(SendAndRequestPage(
                //   namepage: "طلب",
                // ));
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: const Icon(
                  Icons.arrow_downward_rounded,
                  size: 30,
                ),
              ),
            ),
            const Gap(4),
            const Text(
              "طلب",
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
        Column(
          children: [
            MaterialButton(
              onPressed: () {},
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 110, 110),
                    borderRadius: BorderRadius.circular(50)),
                child: const Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ),
            const Gap(4),
            const Text(
              "اضافة",
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
        Column(
          children: [
            MaterialButton(
              onPressed: () {
                // Get.to(const SendAndRequestPage(
                //   namepage: "ارسال",
                // ));
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: const Icon(
                  Icons.arrow_upward_rounded,
                  size: 30,
                ),
              ),
            ),
            const Gap(4),
            const Text(
              "ارسال",
              style: TextStyle(fontSize: 13),
            )
          ],
        )
      ],
    );
  }
}
