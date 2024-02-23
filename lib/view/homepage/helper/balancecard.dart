import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

SizedBox balanceCard(String balance) {
  return SizedBox(
    height: 135,
    child: Column(
      children: [
        Text(
          "رصيد حسابك",
          style: TextStyle(fontSize: 16, color: Colors.grey.shade400),
        ),
        const Gap(5),
        Text(
          "£ $balance",
          style: const TextStyle(fontSize: 43),
        ),
      ],
    ),
  );
}
