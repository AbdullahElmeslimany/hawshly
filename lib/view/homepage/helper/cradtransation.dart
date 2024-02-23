 import 'package:flutter/material.dart';

Container cradTransation(bool trans, String valueCarancy, String name) {
    return Container(
                      height: 85,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: trans == true
                                          ? Colors.greenAccent
                                          : Colors.red,
                                      borderRadius:
                                          BorderRadius.circular(25)),
                                  child: Icon(
                                    trans == true
                                        ? Icons.arrow_upward_rounded
                                        : Icons.arrow_downward_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(valueCarancy,
                                      style: const TextStyle(fontSize: 18)),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(name),
                            ),
                            Text(
                              trans == true ? "ارسال" : "استقبال",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    );
  }
