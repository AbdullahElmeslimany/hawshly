import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      animationDuration: const Duration(seconds: 1),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade100,
            bottom: TabBar(
              // isScrollable: true,
              dividerColor: Colors.white,
              onTap: (value) {
                print(value);
              },

              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Tab(text: "الدخل"),
                Tab(text: "المصروف"),
                Tab(text: "الديون"),
              ],
            ),
          ),
          body: TabBarView(children: [
            Column(
              children: [
                const Gap(25),
                cardGrey(context, "تحويل رصيد"),
                const Gap(25),
                cardGrey(context, "سحب رصيد"),
                const Gap(25),
                Container(
                  height: 130,
                  width: MediaQuery.sizeOf(context).width - 35,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.green[300]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      textAndtap("المقاهي"),
                      const Divider(),
                      textAndtap("المطاعم"),
                    ],
                  ),
                ),
                const Gap(25),
                Container(
                  height: 250,
                  width: MediaQuery.sizeOf(context).width - 35,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.green[300]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      textAndtap("البنزين"),
                      const Divider(),
                      textAndtap("الصيانة"),
                      const Divider(),
                      textAndtap("الجراج"),
                      const Divider(),
                      textAndtap("الأجرة"),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  height: 250,
                  width: MediaQuery.sizeOf(context).width - 35,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.green[300]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      textAndtap("الراتب"),
                      const Divider(),
                      textAndtap("المكافآت"),
                      const Divider(),
                      textAndtap("الإضافي"),
                      const Divider(),
                      textAndtap("المبيعات"),
                      const Divider(),
                      textAndtap("أخرى"),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                const Gap(25),
                cardGrey(context, "دفع ديون و أقساط"),
                const Gap(25),
                cardGrey(context, "استلام ديون و أقساط"),
              ],
            )
          ]),
        ),
      ),
    );
  }

  textAndtap(title) {
    return InkWell(
      onTap: () {
        Get.defaultDialog(title: "تم اختيار", content: Text(title));
      },
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  cardGrey(BuildContext context, title) {
    return InkWell(
      onTap: () {
        print(title);
      },
      child: Container(
        height: 50,
        width: MediaQuery.sizeOf(context).width - 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.grey),
        child: Center(
          child: textAndtap(title),
        ),
      ),
    );
  }
}
