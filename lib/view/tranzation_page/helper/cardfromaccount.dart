import 'package:flutter/material.dart';

Container cardFromAccount(
    {required double width,
    required String nameSendMony,
    required String iDSendMony}) {
  return Container(
    width: width,
    height: 88,
    decoration: BoxDecoration(
        color: const Color.fromARGB(185, 255, 255, 255),
        borderRadius: BorderRadius.circular(25)),
    margin: const EdgeInsets.only(top: 15, right: 7, left: 7, bottom: 15),
    padding: const EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "الراسل :  $nameSendMony",
          style: const TextStyle(fontSize: 15),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            "رقم حساب الراسل :  $iDSendMony",
            style: const TextStyle(fontSize: 15),
          ),
        )
      ],
    ),
  );
}
