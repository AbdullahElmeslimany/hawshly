import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

SizedBox balanceCard(String balance) {
  return SizedBox(
    // height: 135,
    child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15.0, right: 20, bottom: 15),
          child: Text(
            "المرتب",
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
        ),
        const Gap(65),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                " جنيه ",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Text(
              "$balance ",
              style: const TextStyle(fontSize: 43, color: Colors.white),
            ),
          ],
        ),
      ],
    ),
  );
}
