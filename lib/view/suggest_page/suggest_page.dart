import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SuggestPage extends StatelessWidget {
  const SuggestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: suggestList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        flex: 5,
                        child: Image.asset(
                          suggestList[index]["image"],
                          height: 150,
                          fit: BoxFit.fitHeight,
                        )),
                    Expanded(
                      flex: 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            suggestList[index]["title"],
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const Gap(15),
                          Text(
                            "% خصم ${suggestList[index]["sale"]}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const Gap(25),
                          Container(
                            height: 55,
                            width: 110,
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(35)),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                "شراء",
                                style: GoogleFonts.alexandria(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

List suggestList = [
  {
    "title": "iphone 15 pro max",
    "sale": "15",
    "image": "assets/images/iphone.png",
  },
  {
    "title": "Range Rover",
    "sale": "20",
    "image": "assets/images/car1.png",
  },
  {
    "title": "Al Baik",
    "sale": "20",
    "image": "assets/images/food.png",
  },
  {
    "title": "Hyundai Tucson",
    "sale": "10",
    "image": "assets/images/car2.png",
  },
];
