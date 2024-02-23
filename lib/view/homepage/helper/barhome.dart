import 'package:flutter/material.dart';

Padding barHome() {
    return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_on_outlined,
                            size: 30,
                            color: Colors.white60,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings,
                            size: 30,
                            color: Colors.white60,
                          ))
                    ],
                  ),
                );
  }
