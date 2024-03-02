import 'package:flutter/material.dart';

Container cradTransation(
    String date, String pricetrans, bool typetrans, String balance) {
  return Container(
    height: 150,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(25)),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Center(
                        child: Text(
                      pricetrans,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: typetrans == true ? Colors.green : Colors.red),
                    )),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        // color: trans == true ? Colors.greenAccent : Colors.red,
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: Text(
                        typetrans == true ? "ايداع" : "نفقة",
                        style: TextStyle(
                            color:
                                typetrans == true ? Colors.green : Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                date,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black54),
              ),
            ],
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Center(
                        child: Text(
                      balance,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: Colors.blue.shade700),
                    )),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
              const Text(
                "المبلغ المتاح",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color.fromARGB(205, 0, 0, 0)),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
