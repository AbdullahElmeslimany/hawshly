import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawshly/model/home_model.dart';
import 'package:hawshly/view/homepage/helper/balancecard.dart';
import 'package:hawshly/view/homepage/helper/barhome.dart';
import 'package:hawshly/view/homepage/helper/cradtransation.dart';
import 'package:hive/hive.dart';
import '../../constant/list_c.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 43, 43, 43),
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
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/card.png",
                        )),
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  const Gap(18),
                  balanceCard(balance),
                  // const ButtonTreeSAR()
                ]),
              ),
            ),
            dridercustom(),
            Container(
              margin: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.sizeOf(context).width / 2.4,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 64, 64),
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 64, 64))),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        "مصرفاتك",
                        style: GoogleFonts.alexandria(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.sizeOf(context).width / 2.4,
                    decoration: BoxDecoration(
                        color: Colors.cyan.shade800,
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: Colors.cyan.shade800)),
                    child: MaterialButton(
                      onPressed: () async {
                        final collection = await BoxCollection.open(
                            'MyFirstFluffyBox', {'cats', 'dogs'},
                            path: './');
                        final catsBox = await collection.openBox('cats');
                        await catsBox.put('name', 'ali');
                        final loki = await catsBox.get('name');
                        print(loki);
                      },
                      child: Text(
                        "التوفير",
                        style: GoogleFonts.alexandria(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(15),
            const Text(
              "اخر المعاملات",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Gap(10),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(125, 245, 245, 245),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ListView.builder(
                    itemCount: transDate.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: cradTransation(
                            transDate[index]["date"],
                            transDate[index]["pricetrans"],
                            transDate[index]["typetrans"],
                            transDate[index]["balance"]),
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
      height: 2,
      color: Colors.grey.shade400,
    );
  }
}
