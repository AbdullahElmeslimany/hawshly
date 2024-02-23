import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hawshly/model/home_model.dart';
import 'package:hawshly/view/homepage/helper/balancecard.dart';
import 'package:hawshly/view/homepage/helper/barhome.dart';
import 'package:hawshly/view/homepage/helper/buttoncardhome.dart';
import 'package:hawshly/view/homepage/helper/cradtransation.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 43, 43, 43),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            barHome(),
            Center(
              child: Container(
                height: 245,
                width: MediaQuery.sizeOf(context).width - 5,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  const Gap(18),
                  balanceCard(balance),
                  const ButtonTreeSAR()
                ]),
              ),
            ),
            dridercustom(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("المجموعات", style: TextStyle(fontSize: 16)),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              height: 95,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35)),
                        child: const Icon(
                          Icons.person,
                          size: 35,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "التحويلات",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: cradTransation(trans, valueCarancy, name),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container dridercustom() {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
      height: 3,
      color: Colors.grey.shade700,
    );
  }
}
