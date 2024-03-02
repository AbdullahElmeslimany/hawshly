import 'package:flutter/material.dart';

Padding barHome() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 7.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              size: 30,
              color: Colors.grey.shade800,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_on_outlined,
              size: 30,
              color: Colors.grey.shade900,
            )),
      ],
    ),
  );
}
