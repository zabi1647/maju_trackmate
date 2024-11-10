import 'package:flutter/material.dart';

import 'package:maju_trackmate/utils/constant_values/size.dart';

Widget firstAuthButton(
    String image, String text, Color color, Function()? onPressed) {
  return Semantics(
    button: true,
    child: InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: mq.height * 0.08,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            children: [
              Image(image: AssetImage(image)),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
